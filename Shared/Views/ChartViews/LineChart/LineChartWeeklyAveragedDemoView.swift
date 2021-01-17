//
//  LineChartWeeklyAveragedDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 14/01/2021.
//

import SwiftUI
import SwiftUICharts

struct LineChartWeeklyAveragedDemoView: View {
    
    var data : ChartData = yearOfDataWeeklyAverage()
    
    var body: some View {
        VStack {
            LineChart()
                .touchOverlay(specifier: "%.2f")
                .yAxisPOI(markerName: "0", markerValue: 0, lineColour: Color.primary)
                .xAxisGrid()
                .yAxisGrid()
                .xAxisLabels()
                .yAxisLabels()
                .headerBox()
                .legends()
                .environmentObject(data)
                .frame(width: 300, height: 400)
                .padding(.all, 24)
                .background(
                    ZStack {
                        DemoContainer()
                    }
                )
                .padding()
            
            
        }
        .navigationTitle("Weekly Average")
    }
}

struct LineChartWeeklyAveragedDemoView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartWeeklyAveragedDemoView()
    }
}

extension LineChartWeeklyAveragedDemoView {
    static func yearOfDataWeeklyAverage() -> ChartData {
        
        var data : [ChartDataPoint] = []
        
        let calendar = Calendar.current
        
        let date = Date()
        
        for index in 1...365 {
            let value: Double = Double(Int.random(in: -100...100))
            let date = calendar.date(byAdding: .day, value: index, to: date)
            data.append(ChartDataPoint(value: value, date: date))
        }
        
        let metadata   : ChartMetadata  = ChartMetadata(title       : "Test Data",
                                                        subtitle    : "A years worth - Weekly Average",
                                                        lineLegend  : "Data")
        
        let labels      : [String]      = ["J", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]
        
        let gridStyle   : GridStyle     = GridStyle(lineColour  : Color(.lightGray),
                                                    lineWidth   : 1,
                                                    dash        : [CGFloat](),
                                                    dashPhase   : 0)
        
        let chartStyle  : ChartStyle    = ChartStyle(infoBoxPlacement   : .header,
                                                     xAxisGridStyle     : gridStyle,
                                                     yAxisGridStyle     : gridStyle,
                                                     xAxisLabelPosition : .bottom,
                                                     xAxisLabelsFrom    : .chartData,
                                                     yAxisLabelPosition : .leading,
                                                     yAxisNumberOfLabels: 7)
        
        let lineStyle   : LineStyle     = LineStyle(stops: [GradientStop(color: Color(red: 0.15, green: 1.0, blue: 0.25), location: 0.5),
                                                            GradientStop(color: Color(red: 0.15, green: 0.25, blue: 1.0), location: 0.5)],
                                                    startPoint: .leading,
                                                    endPoint: .trailing,
                                                    lineType: .curvedLine,
                                                    strokeStyle: StrokeStyle(lineWidth: 3,
                                                                             lineCap: .round,
                                                                             lineJoin: .round))
        
        return ChartData(dataPoints     : data,
                         metadata       : metadata,
                         xAxisLabels    : labels,
                         chartStyle     : chartStyle,
                         lineStyle      : lineStyle,
                         calculations   : .averageWeek)
    }
}
