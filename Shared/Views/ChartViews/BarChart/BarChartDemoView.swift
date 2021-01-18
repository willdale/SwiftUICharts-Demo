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
            .yAxisGrid()
            .xAxisLabels()
            .yAxisLabels()
            .headerBox()
            .legends()
            .environmentObject(data)
            .frame(minWidth: 300, maxWidth: 900, minHeight: 400, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.all, 24)
            .background(
                ZStack {
                    DemoContainer()
                }
            )
            .padding(.horizontal)
    }
    
    static func weekOfData() -> ChartData {
        
        let data : [ChartDataPoint] = [
            ChartDataPoint(value: 20,  xAxisLabel: "M", pointLabel: "Monday"),
            ChartDataPoint(value: 90,  xAxisLabel: "T", pointLabel: "Tuesday"),
            ChartDataPoint(value: 100, xAxisLabel: "W", pointLabel: "Wednesday"),
            ChartDataPoint(value: 75,  xAxisLabel: "T", pointLabel: "Thursday"),
            ChartDataPoint(value: 160, xAxisLabel: "F", pointLabel: "Friday"),
            ChartDataPoint(value: 110, xAxisLabel: "S", pointLabel: "Saturday"),
            ChartDataPoint(value: 90,  xAxisLabel: "S", pointLabel: "Sunday")
        ]
        
        let metadata   : ChartMetadata  = ChartMetadata(title       : "Test Data",
                                                        subtitle    : "A weeks worth",
                                                        lineLegend  : "Data")
                
        let gridStyle   : GridStyle     = GridStyle(lineColour  : Color(.lightGray),
                                                    lineWidth   : 1)
        
        let chartStyle  : ChartStyle    = ChartStyle(infoBoxPlacement: .header,
                                                     xAxisGridStyle  : gridStyle,
                                                     yAxisGridStyle  : gridStyle,
                                                     yAxisNumberOfLabels: 5)
        
        let barStyle    : BarStyle      = BarStyle(barWidth: 0.5,
                                                   colourFrom: .barStyle,
                                                   colours: [Color(red: 1.0, green: 0.15, blue: 0.15),
                                                             Color(red: 1.0, green: 0.35, blue: 0.35)],
                                                   startPoint: .bottom,
                                                   endPoint: .top)
        
        return ChartData(dataPoints     : data,
                         metadata       : metadata,
                         chartStyle     : chartStyle,
                         barStyle       : barStyle)
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartDemoView()
    }
}
