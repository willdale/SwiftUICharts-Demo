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
            .touchOverlay(chartData: data)
            .averageLine(chartData: data, strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .yAxisPOI(chartData: data, markerName: "50", markerValue: 50, lineColour: Color(red: 0.25, green: 0.25, blue: 1.0), strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .xAxisGrid(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data)
            .infoBox(chartData: data)
            .headerBox(chartData: data)
            .legends(chartData: data)
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

struct GroupedBarChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GroupedBarChartDemoView()
    }
}

extension GroupedBarChartDemoView {
    static func makeData() -> GroupedBarChartData {

        let data = GroupedBarDataSets(dataSets: [
            GroupedBarDataSet(dataPoints: [
                GroupedBarChartDataPoint(value: 10, xAxisLabel: "1.1", pointLabel: "One One"  , colour: .blue),
                GroupedBarChartDataPoint(value: 50, xAxisLabel: "1.2", pointLabel: "One Two"  , colour: .red),
                GroupedBarChartDataPoint(value: 30, xAxisLabel: "1.3", pointLabel: "One Three", colour: .yellow),
                GroupedBarChartDataPoint(value: 40, xAxisLabel: "1.4", pointLabel: "One Four" , colour: .green)
            ],

            legendTitle : "One"),

            GroupedBarDataSet(dataPoints: [
                GroupedBarChartDataPoint(value: 20, xAxisLabel: "2.1", pointLabel: "Two One"  , colour: .blue),
                GroupedBarChartDataPoint(value: 60, xAxisLabel: "2.2", pointLabel: "Two Two"  , colour: .red),
                GroupedBarChartDataPoint(value: 40, xAxisLabel: "2.3", pointLabel: "Two Three", colour: .yellow),
                GroupedBarChartDataPoint(value: 60, xAxisLabel: "2.3", pointLabel: "Two Four" , colour: .green)
            ],

            legendTitle : "Two"),

            GroupedBarDataSet(dataPoints: [
                GroupedBarChartDataPoint(value: 30, xAxisLabel: "3.1", pointLabel: "Three One"  , colour: .blue),
                GroupedBarChartDataPoint(value: 70, xAxisLabel: "3.2", pointLabel: "Three Two"  , colour: .red),
                GroupedBarChartDataPoint(value: 30, xAxisLabel: "3.3", pointLabel: "Three Three", colour: .yellow),
                GroupedBarChartDataPoint(value: 90, xAxisLabel: "3.4", pointLabel: "Three Four" , colour: .green)
            ],

            legendTitle : "Three"),

            GroupedBarDataSet(dataPoints: [
                GroupedBarChartDataPoint(value: 40, xAxisLabel: "4.1", pointLabel: "Four One"  , colour: .blue),
                GroupedBarChartDataPoint(value: 80, xAxisLabel: "4.2", pointLabel: "Four Two"  , colour: .red),
                GroupedBarChartDataPoint(value: 20, xAxisLabel: "4.3", pointLabel: "Four Three", colour: .yellow),
                GroupedBarChartDataPoint(value: 50, xAxisLabel: "4.3", pointLabel: "Four Four" , colour: .green)
            ],

            legendTitle : "Four")
           ])
        
        let groupLegends = [GroupedBarLegend(title: "One"  , colour: .blue),
                            GroupedBarLegend(title: "Two"  , colour: .red),
                            GroupedBarLegend(title: "Three", colour: .yellow),
                            GroupedBarLegend(title: "Four" , colour: .green)]
        
        return GroupedBarChartData(dataSets: data,
                                   groupLegends: groupLegends,
                                   metadata: ChartMetadata(title: "Hello", subtitle: "Bob"),
                                   xAxisLabels: ["Hello"],
                                   chartStyle: BarChartStyle(infoBoxPlacement: .floating, xAxisLabelsFrom: .dataPoint))
    }
}
