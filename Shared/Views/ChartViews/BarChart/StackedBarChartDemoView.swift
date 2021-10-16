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
            .id(data.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
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

        let data = StackedBarDataSets(dataSets: [
            StackedBarDataSet(dataPoints: [
                StackedBarDataPoint(value: 100, description: "Q1 Sales", group: Group.england.data),
                StackedBarDataPoint(value: 500, description: "Q1 Sales", group: Group.scotland.data),
                StackedBarDataPoint(value: 300, description: "Q1 Sales", group: Group.wales.data),
            ], setTitle: "Q1"),
            
            StackedBarDataSet(dataPoints: [
                StackedBarDataPoint(value: 200, description: "Q2 Sales", group: Group.england.data),
                StackedBarDataPoint(value: 600, description: "Q2 Sales", group: Group.scotland.data),
                StackedBarDataPoint(value: 400, description: "Q2 Sales", group: Group.wales.data),
            ], setTitle: "Q2"),
            
            StackedBarDataSet(dataPoints: [
                StackedBarDataPoint(value: 300, description: "Q3 Sales", group: Group.england.data),
                StackedBarDataPoint(value: 700, description: "Q3 Sales", group: Group.scotland.data),
                StackedBarDataPoint(value: 300, description: "Q3 Sales", group: Group.wales.data),
            ], setTitle: "Q3"),
            
            StackedBarDataSet(dataPoints: [
                 StackedBarDataPoint(value: 400, description: "Q4 Sales", group: Group.england.data),
                 StackedBarDataPoint(value: 800, description: "Q4 Sales", group: Group.scotland.data),
                 StackedBarDataPoint(value: 200, description: "Q4 Sales", group: Group.wales.data),
            ], setTitle: "Q4")
        ])

        
        return StackedBarChartData(dataSets: data,
                                   groups: groups,
                                   metadata: ChartMetadata(title: "Haggis Sales", subtitle: "Per Quarter"),
                                   xAxisLabels: ["One", "Two", "Three"],
                                   barStyle: BarStyle(barWidth: 0.5, cornerRadius: CornerRadius(top: 50, bottom: 0)),
                                   chartStyle: BarChartStyle(xAxisGridStyle: GridStyle(numberOfLines: 5,
                                                                                       lineColour: Color.gray.opacity(0.25)),
                                                             xAxisLabelsFrom: .dataPoint(rotation: .degrees(0)),
                                                             yAxisGridStyle: GridStyle(numberOfLines: 5,
                                                                                       lineColour: Color.gray.opacity(0.25)),
                                                             yAxisNumberOfLabels: 5,
                                                             baseline: .zero,
                                                             topLine: .maximum(of: 1600)))
    }
}
