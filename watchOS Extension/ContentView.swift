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
    @State private var touchLocation: CGPoint?
    
    var body: some View {
        Text("")
//        BarChart()
//            .touch(chartData: data) { touchLocation = $0 }
//            .grid()
//            .xAxisLabels(chartData: data)
//            .yAxisLabels(chartData: data)
//            .padding()
    }
    
    static func makeData() -> BarChartData {
        
        let data: BarDataSet = BarDataSet(dataPoints: [
            BarChartDataPoint(value: 10, xAxisLabel: "A"),
            BarChartDataPoint(value: 50, xAxisLabel: "B"),
            BarChartDataPoint(value: 30, xAxisLabel: "C"),
            BarChartDataPoint(value: 60, xAxisLabel: "D")
        ])
        
        return BarChartData(dataSets: data)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
