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
                    return GroupingData(title: "One"  , colour: ColourStyle(colour: .blue))
                case .two:
                    return GroupingData(title: "Two"  , colour: ColourStyle(colour: .red))
                case .three:
                    return GroupingData(title: "Three", colour: ColourStyle(colour: .yellow))
                case .four:
                    return GroupingData(title: "Four" , colour: ColourStyle(colour: .green))
                }
            }
        }
        
        let groups : [GroupingData] = [Group.one.data, Group.two.data, Group.three.data, Group.four.data]

        let data = MultiBarDataSets(dataSets: [
            MultiBarDataSet(dataPoints: [
                MultiBarChartDataPoint(value: 10,  description: "One One"    , group: Group.one.data),
                MultiBarChartDataPoint(value: 10,  description: "One Two"    , group: Group.two.data),
                MultiBarChartDataPoint(value: 30,  description: "One Three"  , group: Group.three.data),
                MultiBarChartDataPoint(value: 40,  description: "One Four"   , group: Group.four.data)
            ]),
            MultiBarDataSet(dataPoints: [
                MultiBarChartDataPoint(value: 50,  description: "Two One"    , group: Group.one.data),
                MultiBarChartDataPoint(value: 10,  description: "Two Two"    , group: Group.two.data),
                MultiBarChartDataPoint(value: 40,  description: "Two Three"  , group: Group.three.data),
                MultiBarChartDataPoint(value: 60,  description: "Two Four"   , group: Group.four.data)
            ]),
            MultiBarDataSet(dataPoints: [
                MultiBarChartDataPoint(value: 10,  description: "Three One"  , group: Group.one.data),
                MultiBarChartDataPoint(value: 50,  description: "Three Two"  , group: Group.two.data),
                MultiBarChartDataPoint(value: 30,  description: "Three Three", group: Group.three.data),
                MultiBarChartDataPoint(value: 100, description: "Three Four" , group: Group.four.data)
            ]),
            MultiBarDataSet(dataPoints: [
                MultiBarChartDataPoint(value: 80,  description: "Four One"   , group: Group.one.data),
                MultiBarChartDataPoint(value: 10,  description: "Four Two"   , group: Group.two.data),
                MultiBarChartDataPoint(value: 20,  description: "Four Three" , group: Group.three.data),
                MultiBarChartDataPoint(value: 50,  description: "Four Four"  , group: Group.four.data)
            ])
        ])

        
        return StackedBarChartData(dataSets: data,
                                   groups: groups,
                                   metadata: ChartMetadata(title: "Hello", subtitle: "Bob"),
                                   xAxisLabels: ["Hello"],
                                   chartStyle: BarChartStyle(infoBoxPlacement: .header,
                                                             xAxisLabelsFrom: .dataPoint(rotation: .degrees(-90)),
                                                             baseline: .minimumWithMaximum(of: 5),
                                                             topLine: .maximum(of: 120)))
    }
}
