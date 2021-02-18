//
//  StackedBarChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 12/02/2021.
//

import SwiftUI
import SwiftUICharts

struct StackedBarChartDemoView: View {
    
    let data = makeData()
    
    var body: some View {
            
        StackedBarChart(chartData: data)
            .touchOverlay(chartData: data)
            .averageLine(chartData: data, strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .yAxisPOI(chartData: data, markerName: "50", markerValue: 50, lineColour: Color(red: 0.25, green: 0.25, blue: 1.0), strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .xAxisGrid(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data)
            .infoBox(chartData: data)
            .headerBox(chartData: data)
            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .frame(minWidth: 300, maxWidth: 900, minHeight: 300, idealHeight: 450, maxHeight: 600, alignment: .center)
            .padding(.all, 24)
            .background(
                ZStack {
                    DemoContainer()
                }
            )
            .padding(.horizontal)
    }
}

struct StackedBarChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        StackedBarChartDemoView()
    }
}

extension StackedBarChartDemoView {
    static func makeData() -> StackedBarChartData {
        
        enum Group {
            case one
            case two
            case three
            case four
            
            var data : GroupingData {
                switch self {
                case .one:
                    return GroupingData(title: "One"  , colour: .blue)
                case .two:
                    return GroupingData(title: "Two"  , colour: .red)
                case .three:
                    return GroupingData(title: "Three", colour: .yellow)
                case .four:
                    return GroupingData(title: "Four" , colour: .green)
                }
            }
        }
        
        let groups : [GroupingData] = [Group.one.data, Group.two.data, Group.three.data, Group.four.data]

        let data = GroupedBarDataSets(dataSets: [
            GroupedBarDataSet(dataPoints: [
                GroupedBarChartDataPoint(value: 10,  xAxisLabel: "1.1", pointLabel: "One One"    , group: Group.one.data),
                GroupedBarChartDataPoint(value: 10,  xAxisLabel: "1.2", pointLabel: "One Two"    , group: Group.two.data),
                GroupedBarChartDataPoint(value: 30,  xAxisLabel: "1.3", pointLabel: "One Three"  , group: Group.three.data),
                GroupedBarChartDataPoint(value: 40,  xAxisLabel: "1.4", pointLabel: "One Four"   , group: Group.four.data)
            ]),
            GroupedBarDataSet(dataPoints: [
                GroupedBarChartDataPoint(value: 50,  xAxisLabel: "2.1", pointLabel: "Two One"    , group: Group.one.data),
                GroupedBarChartDataPoint(value: 10,  xAxisLabel: "2.2", pointLabel: "Two Two"    , group: Group.two.data),
                GroupedBarChartDataPoint(value: 40,  xAxisLabel: "2.3", pointLabel: "Two Three"  , group: Group.three.data),
                GroupedBarChartDataPoint(value: 60,  xAxisLabel: "2.3", pointLabel: "Two Four"   , group: Group.four.data)
            ]),
            GroupedBarDataSet(dataPoints: [
                GroupedBarChartDataPoint(value: 10,  xAxisLabel: "3.1", pointLabel: "Three One"  , group: Group.one.data),
                GroupedBarChartDataPoint(value: 50,  xAxisLabel: "3.2", pointLabel: "Three Two"  , group: Group.two.data),
                GroupedBarChartDataPoint(value: 30,  xAxisLabel: "3.3", pointLabel: "Three Three", group: Group.three.data),
                GroupedBarChartDataPoint(value: 100, xAxisLabel: "3.4", pointLabel: "Three Four" , group: Group.four.data)
            ]),
            GroupedBarDataSet(dataPoints: [
                GroupedBarChartDataPoint(value: 80,  xAxisLabel: "4.1", pointLabel: "Four One"   , group: Group.one.data),
                GroupedBarChartDataPoint(value: 10,  xAxisLabel: "4.2", pointLabel: "Four Two"   , group: Group.two.data),
                GroupedBarChartDataPoint(value: 20,  xAxisLabel: "4.3", pointLabel: "Four Three" , group: Group.three.data),
                GroupedBarChartDataPoint(value: 50,  xAxisLabel: "4.3", pointLabel: "Four Four"  , group: Group.four.data)
            ])
        ])

        
        return StackedBarChartData(dataSets: data,
                                   groups: groups,
                                   metadata: ChartMetadata(title: "Hello", subtitle: "Bob"),
                                   xAxisLabels: ["Hello"],
                                   chartStyle: BarChartStyle(xAxisLabelsFrom: .dataPoint))
    }
}
