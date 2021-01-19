//
//  ContentView.swift
//  watchOS Extension
//
//  Created by Will Dale on 16/01/2021.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    
//    let data = makeData()
    
    var body: some View {
//        BarChart()
//            .touchOverlay()
//            .xAxisGrid()
//            .yAxisGrid()
//            .xAxisLabels()
//            .yAxisLabels()
//            .environmentObject(data)
//            .padding()
        Text("Hello")
    }
    
//    static func makeData() -> ChartData {
//        let data = [ChartDataPoint(value: 10, xAxisLabel: "A"),
//                    ChartDataPoint(value: 50, xAxisLabel: "B"),
//                    ChartDataPoint(value: 30, xAxisLabel: "C"),
//                    ChartDataPoint(value: 60, xAxisLabel: "D"),]
//
//        let metadata = ChartMetadata(title: "Something", subtitle: "Some data", lineLegend: "Data")
//
//        let xAxisLabels = [""]
//
//        let chartStyle = ChartStyle(infoBoxPlacement: .floating,
//                                    xAxisGridStyle: GridStyle(numberOfLines: 3,
//                                                              lineColour: Color(.lightGray).opacity(0.5),
//                                                              lineWidth: 1),
//                                    yAxisGridStyle: GridStyle(numberOfLines: 3,
//                                                              lineColour: Color(.lightGray).opacity(0.5),
//                                                              lineWidth: 1),
//                                    xAxisLabelPosition: .bottom,
//                                    xAxisLabelsFrom: .dataPoint,
//                                    yAxisLabelPosition: .leading,
//                                    yAxisNumberOfLabels: 3)
//
//        let lineStyle = LineStyle(colour: Color.red,
//                                  lineType: .curvedLine,
//                                  strokeStyle: StrokeStyle(lineWidth: 3,
//                                                           lineCap: .round,
//                                                           lineJoin: .round,
//                                                           miterLimit: 10,
//                                                           dash: [CGFloat](),
//                                                           dashPhase: 0),
//                                  ignoreZero: false)
//
//        let barStyle = BarStyle(barWidth: 0.5, cornerRadius: CornerRadius(top: 0.25, bottom: 0), colourFrom: .barStyle, colour: Color(.blue))
//
//        let pointStyle = PointStyle(pointSize: 6,
//                                    borderColour: Color.primary,
//                                    fillColour: Color.clear,
//                                    lineWidth: 1,
//                                    pointType: .outline,
//                                    pointShape: .circle)
//
//        return ChartData(dataPoints: data,
//                         metadata: metadata,
//                         xAxisLabels: xAxisLabels,
//                         chartStyle: chartStyle,
//                         lineStyle: lineStyle,
//                         barStyle: barStyle,
//                         pointStyle: pointStyle,
//                         calculations: .none)
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
