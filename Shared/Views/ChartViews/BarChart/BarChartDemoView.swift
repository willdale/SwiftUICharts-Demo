//
//  BarDemoChart.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 13/01/2021.
//

import SwiftUI
import SwiftUICharts

struct BarChartDemoView: View {
    
    let data : ChartData = weekOfData()
    
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
    
    static func weekOfData() -> ChartData {
        
        let data : [ChartDataPoint] = [
            ChartDataPoint(value: 20,  xAxisLabel: "M", pointLabel: "Monday"   , colour: Color(.systemRed)   ),
            ChartDataPoint(value: 90,  xAxisLabel: "T", pointLabel: "Tuesday"  , colour: Color(.systemBlue)  ),
            ChartDataPoint(value: 100, xAxisLabel: "W", pointLabel: "Wednesday", colour: Color(.systemGreen) ),
            ChartDataPoint(value: 75,  xAxisLabel: "T", pointLabel: "Thursday" , colour: Color(.systemOrange)),
            ChartDataPoint(value: 160, xAxisLabel: "F", pointLabel: "Friday"   , colour: Color(.systemTeal)  ),
            ChartDataPoint(value: 110, xAxisLabel: "S", pointLabel: "Saturday" , colour: Color(.systemPurple)),
            ChartDataPoint(value: 90,  xAxisLabel: "S", pointLabel: "Sunday"   , colour: Color(.systemYellow))
        ]
        
        let metadata   : ChartMetadata  = ChartMetadata(title       : "Test Data",
                                                        subtitle    : "A weeks worth",
                                                        lineLegend  : "Data")
        
        let labels      : [String]      = ["Mon", "Thu", "Sun"]
        
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
        
        let barStyle    : BarStyle      = BarStyle(barWidth: 0.5,
                                                   colourFrom: .barStyle,
                                                   colours: [Color(red: 1.0, green: 0.15, blue: 0.15),
                                                             Color(red: 1.0, green: 0.35, blue: 0.35)],
                                                   startPoint: .bottom,
                                                   endPoint: .top)
        
        return ChartData(dataPoints     : data,
                         metadata       : metadata,
                         xAxisLabels    : labels,
                         chartStyle     : chartStyle,
                         barStyle       : barStyle
        )
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartDemoView()
    }
}
