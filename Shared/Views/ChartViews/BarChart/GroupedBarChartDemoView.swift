//
//  GroupedBarChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 25/01/2021.
//

import SwiftUI
import SwiftUICharts

struct GroupedBarChartDemoView: View {
    
    let data = makeData()
    
    var body: some View {
        GroupedBarChart(chartData: data, groupSpacing: 25)
            .touchOverlay(chartData: data, unit: .suffix(of: "kg"))
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data)
            .headerBox(chartData: data)
            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .id(data.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.horizontal)
    }
}

struct GroupedBarChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GroupedBarChartDemoView()
    }
}

extension GroupedBarChartDemoView {
    static func makeData() -> GroupedBarChartData {

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

        let data = GroupedBarDataSets(dataSets: [
            GroupedBarDataSet(dataPoints: [
                GroupedBarDataPoint(value: 100, description: "Q1 Sales", group: Group.england.data),
                GroupedBarDataPoint(value: 500, description: "Q1 Sales", group: Group.scotland.data),
                GroupedBarDataPoint(value: 300, description: "Q1 Sales", group: Group.wales.data),
            ], setTitle: "Q1"),
            
            GroupedBarDataSet(dataPoints: [
                GroupedBarDataPoint(value: 200, description: "Q2 Sales", group: Group.england.data),
                GroupedBarDataPoint(value: 600, description: "Q2 Sales", group: Group.scotland.data),
                GroupedBarDataPoint(value: 400, description: "Q2 Sales", group: Group.wales.data),
            ], setTitle: "Q2"),
            
            GroupedBarDataSet(dataPoints: [
                GroupedBarDataPoint(value: 300, description: "Q3 Sales", group: Group.england.data),
                GroupedBarDataPoint(value: 700, description: "Q3 Sales", group: Group.scotland.data),
                GroupedBarDataPoint(value: 300, description: "Q3 Sales", group: Group.wales.data),
            ], setTitle: "Q3"),
            
            GroupedBarDataSet(dataPoints: [
                GroupedBarDataPoint(value: 400, description: "Q4 Sales", group: Group.england.data),
                GroupedBarDataPoint(value: 800, description: "Q4 Sales", group: Group.scotland.data),
                GroupedBarDataPoint(value: 200, description: "Q4 Sales", group: Group.wales.data),
            ], setTitle: "Q4")
        ])
        
        return GroupedBarChartData(dataSets: data,
                                   groups: groups,
                                   metadata: ChartMetadata(title: "Haggis Sales", subtitle: "Per Quarter"),
                                   xAxisLabels: ["One", "Two", "Three"],
                                   barStyle: BarStyle(cornerRadius: CornerRadius(top: 5, bottom: 0)),
                                   chartStyle: BarChartStyle(xAxisLabelsFrom: .dataPoint(rotation: .degrees(0)),
                                                             yAxisGridStyle: GridStyle(numberOfLines: 7),
                                                             yAxisNumberOfLabels: 7,
                                                             baseline: .zero,
                                                             topLine: .maximumValue))
    }
}
