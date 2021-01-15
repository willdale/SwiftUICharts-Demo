//
//  BarChartYearDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 13/01/2021.
//

import SwiftUI
import SwiftUICharts

struct BarChartYearDemoView: View {
    
    var data : ChartData = yearOfData()
    
    var body: some View {
        BarChart()
            .touchOverlay()
            .averageLine(markerName: "Average", lineColour: Color.primary, strokeStyle: StrokeStyle(lineWidth: 2, dash: [5, 10]))
            .yAxisPOI(markerName: "50", markerValue: 50, lineColour: Color(.systemBlue), strokeStyle: StrokeStyle(lineWidth: 2, dash: [5, 10]))
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
                    #if !os(macOS)
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .shadow(color: Color(.systemGray3), radius: 12, x: 0, y: 0)
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .fill(Color(.systemBackground))
                    #elseif os(macOS)
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .shadow(color: Color(.lightGray), radius: 12, x: 0, y: 0)
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .fill(Color(.windowBackgroundColor))
                    #endif
                }
            )
            .padding(.horizontal)
    }
    
    static func yearOfData() -> ChartData {
        
        var data : [ChartDataPoint] = []
        for _ in 1...365 {
            let value: Double = Double(Int.random(in: 0...100))
            data.append(ChartDataPoint(value: value))
        }
        let metadata   : ChartMetadata  = ChartMetadata(title       : "Test Data",
                                                        subtitle    : "A years worth",
                                                        lineLegend  : "Data")
        
        let labels      : [String]      = ["Jan", "Mar", "May", "Jul", "Sep", "Nov"]
        
        #if !os(macOS)
        let gridColour = Color(.systemFill)
        #elseif os(macOS)
        let gridColour = Color(.gridColor)
        #endif
        
        let gridStyle   : GridStyle     = GridStyle(lineColour  : gridColour,
                                                    lineWidth   : 1)
        
        let chartStyle  : ChartStyle    = ChartStyle(infoBoxPlacement: .header,
                                                     xAxisGridStyle  : gridStyle,
                                                     yAxisGridStyle  : gridStyle)
        
        let barStyle    : BarStyle      = BarStyle(barWidth: 1.0,
                                                   cornerRadius: CornerRadius(top: 5, bottom: 5),
                                                   colourFrom: .barStyle,
                                                   colours: [Color(red: 1.0, green: 0.15, blue: 0.15),
                                                             Color(red: 1.0, green: 0.35, blue: 0.35)],
                                                   startPoint: .bottom,
                                                   endPoint: .top)
        
        return ChartData(dataPoints     : data,
                         metadata       : metadata,
                         xAxisLabels: labels,
                         chartStyle     : chartStyle,
                         barStyle  : barStyle)
    }
}

struct BarChartYearView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartYearDemoView()
    }
}
