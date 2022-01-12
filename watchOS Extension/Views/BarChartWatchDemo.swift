//
//  BarChartWatchDemo.swift
//  SwiftUICharts Demo (watchOS) Extension
//
//  Created by Will Dale on 12/01/2022.
//

import SwiftUI
import SwiftUICharts

struct BarChartWatchDemo: View {
    
    let data = makeData()
    
    var body: some View {
        BarChart(chartData: data)
            .touchOverlay(chartData: data)
            .xAxisGrid(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data)
            .padding()
    }
    
    static func makeData() -> BarChartData {
        
        let data : BarDataSet = BarDataSet(dataPoints: [
            BarChartDataPoint(value: 10, xAxisLabel: "A"),
            BarChartDataPoint(value: 50, xAxisLabel: "B"),
            BarChartDataPoint(value: 30, xAxisLabel: "C"),
            BarChartDataPoint(value: 60, xAxisLabel: "D")
        ],
        legendTitle: "Data")
        
        let metadata = ChartMetadata(title: "Something", subtitle: "Some data")
        let xAxisLabels = [""]

        let chartStyle = BarChartStyle(infoBoxPlacement: .floating,
                                    xAxisGridStyle: GridStyle(numberOfLines: 3,
                                                              lineColour: Color(.lightGray).opacity(0.5),
                                                              lineWidth: 1),
                                    xAxisLabelPosition: .bottom,
                                    xAxisLabelsFrom: .dataPoint(rotation: .degrees(0)),
                                    yAxisGridStyle: GridStyle(numberOfLines: 3,
                                                              lineColour: Color(.lightGray).opacity(0.5),
                                                              lineWidth: 1),
                                    yAxisLabelPosition: .leading,
                                    yAxisNumberOfLabels: 3)

        return BarChartData(dataSets: data,
                         metadata: metadata,
                         xAxisLabels: xAxisLabels,
                         chartStyle: chartStyle)
    }
}


struct BarChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartWatchDemo()
    }
}
