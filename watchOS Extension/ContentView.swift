//
//  ContentView.swift
//  watchOS Extension
//
//  Created by Will Dale on 16/01/2021.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    
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
        ],legendTitle: "Data")
                
        let xAxisLabels = [""]
        
        let grid = GridStyle(numberOfLines: 3,
                             lineColour: Color(.lightGray).opacity(0.5),
                             lineWidth: 1)
        
        let chartStyle = BarChartStyle(xAxisGridStyle: grid,
                                       xAxisLabelPosition: .bottom,
                                       xAxisLabelsFrom: .dataPoint(rotation: .degrees(0)),
                                       yAxisGridStyle: grid,
                                       yAxisLabelPosition: .leading,
                                       yAxisNumberOfLabels: 3)

        return BarChartData(dataSets: data,
                            xAxisLabels: xAxisLabels,
                            chartStyle: chartStyle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
