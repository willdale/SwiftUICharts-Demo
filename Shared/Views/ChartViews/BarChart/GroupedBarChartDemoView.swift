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
            .infoBox(chartData: data)
            .headerBox(chartData: data)
            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 250, maxHeight: 400, alignment: .center)
            .padding(.all, 24)
//            .background(
//                ZStack {
//                    DemoContainer()
//                }
//            )
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

        let data = MultiBarDataSets(dataSets: [
            MultiBarDataSet(dataPoints: [
                MultiBarChartDataPoint(value: 100, group: Group.england.data),
                MultiBarChartDataPoint(value: 500, group: Group.scotland.data),
                MultiBarChartDataPoint(value: 300, group: Group.wales.data),
            ], setTitle: "Q1"),
            
            MultiBarDataSet(dataPoints: [
                MultiBarChartDataPoint(value: 200, group: Group.england.data),
                MultiBarChartDataPoint(value: 600, group: Group.scotland.data),
                MultiBarChartDataPoint(value: 400, group: Group.wales.data),
            ], setTitle: "Q2"),
            
            MultiBarDataSet(dataPoints: [
                MultiBarChartDataPoint(value: 300, group: Group.england.data),
                MultiBarChartDataPoint(value: 700, group: Group.scotland.data),
                MultiBarChartDataPoint(value: 300, group: Group.wales.data),
            ], setTitle: "Q3"),
            
            MultiBarDataSet(dataPoints: [
                MultiBarChartDataPoint(value: 400, group: Group.england.data),
                MultiBarChartDataPoint(value: 800, group: Group.scotland.data),
                MultiBarChartDataPoint(value: 200, group: Group.wales.data),
            ], setTitle: "Q4")
        ])
        
        return GroupedBarChartData(dataSets: data,
                                   groups: groups,
                                   metadata: ChartMetadata(title: "Haggis Sales", subtitle: "Per Year"),
                                   xAxisLabels: [],
                                   chartStyle: BarChartStyle(infoBoxPlacement: .floating,
                                                             xAxisLabelsFrom: .chartData,
                                                             yAxisGridStyle: GridStyle(numberOfLines: 7),
                                                             yAxisNumberOfLabels: 7,
                                                             baseline: .zero,
                                                             topLine: .maximumValue))
    }
}
