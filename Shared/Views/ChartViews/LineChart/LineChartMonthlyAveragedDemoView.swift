//
//  LineChartYearAveragedDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 13/01/2021.
//

import SwiftUI
import SwiftUICharts

struct LineChartMonthlyAveragedDemoView: View {
    
    var data : ChartData = yearOfDataMonthlyAverage()
    
    @State private var pointSize: Double = 0.5
    
    var body: some View {
        VStack {
            LineChart()
                .touchOverlay(specifier: "%.2f", units: .prefix(of: "USD"))
                .yAxisGrid()
                .xAxisLabels()
                .yAxisLabels()
                .headerBox()
                .legends()
                .environmentObject(data)
                .frame(minWidth: 300, maxWidth: 900, minHeight: 300, idealHeight: 400, maxHeight: 500, alignment: .center)
                .padding(.all, 24)
                .background(
                    ZStack {
                        DemoContainer()
                    }
                )
                .padding()
        }
        .navigationTitle("Monthly Average")
    }
    
    
}

struct LineChartMonthlyAveragedDemoView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartMonthlyAveragedDemoView()
    }
}



extension LineChartMonthlyAveragedDemoView {
    static func yearOfDataMonthlyAverage() -> ChartData {
        
        var data : [ChartDataPoint] = []
        
        let calendar = Calendar.current
        
        let date = Date()
        
        for index in 1...365 {
            let value: Double = Double(Int.random(in: -100...100))
            let date = calendar.date(byAdding: .day, value: index, to: date)
            data.append(ChartDataPoint(value: value, date: date))
        }
        
        let metadata   : ChartMetadata  = ChartMetadata(title       : "Test Data",
                                                        subtitle    : "A years worth - Monthly Average",
                                                        lineLegend  : "Data")
        
        let labels      : [String]      = ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]
        
        let chartStyle  : ChartStyle    = ChartStyle(infoBoxPlacement: .header,
                                                     yAxisGridStyle: GridStyle(lineColour: Color.primary.opacity(0.5)))
        
        let lineStyle   : LineStyle     = LineStyle(colour: Color(red: 0.15, green: 0.15, blue: 1.0),
                                                    lineType: .curvedLine,
                                                    strokeStyle: StrokeStyle(lineWidth: 3,
                                                                             lineCap: .round,
                                                                             lineJoin: .round))
        
        return ChartData(dataPoints     : data,
                         metadata       : metadata,
                         xAxisLabels    : labels,
                         chartStyle     : chartStyle,
                         lineStyle      : lineStyle,
                         calculations   : .averageMonth)
    }
}
