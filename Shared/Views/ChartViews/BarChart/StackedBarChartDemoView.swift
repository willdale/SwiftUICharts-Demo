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
            .xAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data)
            .headerBox(chartData: data)
            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 250, maxHeight: 400, alignment: .center)
//            .padding(.all, 24)
//            .background(
//                ZStack {
//                    DemoContainer()
//                }
//            )
//            .padding(.horizontal)
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
            case england
            case scotland
            case wales
            
            var data : GroupingData {
                switch self {
                case .england:
                    return GroupingData(title: "England" , colour: ColourStyle(colour: .red))
                case .scotland:
                    return GroupingData(title: "Scotland", colour: ColourStyle(colour: .blue))
                case .wales:
                    return GroupingData(title: "Wales"   , colour: ColourStyle(colour: .green))
                }
            }
        }
        
        let groups : [GroupingData] = [Group.england.data, Group.scotland.data, Group.wales.data]

        let data = MultiBarDataSets(dataSets: [
            MultiBarDataSet(dataPoints: [
                MultiBarChartDataPoint(value: 100, description: "Q1 Sales", group: Group.england.data),
                MultiBarChartDataPoint(value: 500, description: "Q1 Sales", group: Group.scotland.data),
                MultiBarChartDataPoint(value: 300, description: "Q1 Sales", group: Group.wales.data),
            ], setTitle: "Q1"),
            
            MultiBarDataSet(dataPoints: [
                MultiBarChartDataPoint(value: 200, description: "Q2 Sales", group: Group.england.data),
                MultiBarChartDataPoint(value: 600, description: "Q2 Sales", group: Group.scotland.data),
                MultiBarChartDataPoint(value: 400, description: "Q2 Sales", group: Group.wales.data),
            ], setTitle: "Q2"),
            
            MultiBarDataSet(dataPoints: [
                MultiBarChartDataPoint(value: 300, description: "Q3 Sales", group: Group.england.data),
                MultiBarChartDataPoint(value: 700, description: "Q3 Sales", group: Group.scotland.data),
                MultiBarChartDataPoint(value: 300, description: "Q3 Sales", group: Group.wales.data),
            ], setTitle: "Q3"),
            
            MultiBarDataSet(dataPoints: [
                MultiBarChartDataPoint(value: 400, description: "Q4 Sales", group: Group.england.data),
                MultiBarChartDataPoint(value: 800, description: "Q4 Sales", group: Group.scotland.data),
                MultiBarChartDataPoint(value: 200, description: "Q4 Sales", group: Group.wales.data),
            ], setTitle: "Q4")
        ])

        
        return StackedBarChartData(dataSets: data,
                                   groups: groups,
                                   metadata: ChartMetadata(title: "Haggis Sales", subtitle: "Per Quarter"),
                                   barStyle: BarStyle(barWidth: 0.5),
                                   chartStyle: BarChartStyle(infoBoxPlacement: .header,
                                                             xAxisGridStyle: GridStyle(numberOfLines: 5,
                                                                                       lineColour: Color.gray.opacity(0.25)),
                                                             xAxisLabelsFrom: .chartData,
                                                             yAxisGridStyle: GridStyle(numberOfLines: 5,
                                                                                       lineColour: Color.gray.opacity(0.25)),
                                                             yAxisNumberOfLabels: 5,
                                                             baseline: .zero,
                                                             topLine: .maximum(of: 900)))
    }
}
