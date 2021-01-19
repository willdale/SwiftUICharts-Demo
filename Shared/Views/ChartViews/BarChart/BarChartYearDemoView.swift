//
//  BarChartYearDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 13/01/2021.
//

import SwiftUI
import SwiftUICharts

//struct BarChartYearDemoView: View {
//    
//    var data : ChartData = weekOfData()
//    
//    var body: some View {
//        BarChart()
//            .touchOverlay()
//            .averageLine(markerName: "Average", lineColour: Color.primary, strokeStyle: StrokeStyle(lineWidth: 2, dash: [5, 10]))
//            .yAxisGrid()
//            .xAxisLabels()
//            .yAxisLabels()
//            .headerBox()
//            .legends()
//            .environmentObject(data)
//            .frame(minWidth: 300, maxWidth: 900, minHeight: 300, idealHeight: 400, maxHeight: 500, alignment: .center)
//            .padding(.all, 24)
//            .background(
//                ZStack {
//                    DemoContainer()
//                }
//            )
//            .padding(.horizontal)
//    }
//    
//    static func weekOfData() -> ChartData {
//        
//        let data : [ChartDataPoint] = [
//            ChartDataPoint(value: 70,  xAxisLabel: "M", pointLabel: "Monday"   , colour: Color(.systemRed)),
//            ChartDataPoint(value: 40,  xAxisLabel: "T", pointLabel: "Tuesday"  , colour: Color(.systemBlue)),
//            ChartDataPoint(value: 90, xAxisLabel:  "W", pointLabel: "Wednesday", colour: Color(.systemGreen)),
//            ChartDataPoint(value: 35,  xAxisLabel: "T", pointLabel: "Thursday" , colour: Color(.systemOrange)),
//            ChartDataPoint(value: 60, xAxisLabel:  "F", pointLabel: "Friday"   , colour: Color(.systemTeal)),
//            ChartDataPoint(value: 110, xAxisLabel: "S", pointLabel: "Saturday" , colour: Color(.systemPurple)),
//            ChartDataPoint(value: 40,  xAxisLabel: "S", pointLabel: "Sunday"   , colour: Color(.systemYellow))
//        ]
//        
//        let metadata   : ChartMetadata  = ChartMetadata(title       : "Test Data",
//                                                        subtitle    : "A weeks worth",
//                                                        lineLegend  : "Data")
//        
//        let gridStyle   : GridStyle     = GridStyle(lineColour  : Color(.lightGray),
//                                                    lineWidth   : 1)
//        
//        let chartStyle  : ChartStyle    = ChartStyle(infoBoxPlacement: .header,
//                                                     xAxisGridStyle  : gridStyle,
//                                                     yAxisGridStyle  : gridStyle,
//                                                     xAxisLabelsFrom: .dataPoint,
//                                                     yAxisNumberOfLabels: 5)
//        
//        let barStyle    : BarStyle      = BarStyle(barWidth: 1,
//                                                   colourFrom: .dataPoints,
//                                                   colours: [Color(red: 1.0, green: 0.15, blue: 0.15),
//                                                             Color(red: 1.0, green: 0.35, blue: 0.35)],
//                                                   startPoint: .bottom,
//                                                   endPoint: .top)
//        
//        return ChartData(dataPoints     : data,
//                         metadata       : metadata,
//                         chartStyle     : chartStyle,
//                         barStyle       : barStyle
//        )
//    }
//}
//
//struct BarChartYearView_Previews: PreviewProvider {
//    static var previews: some View {
//        BarChartYearDemoView()
//    }
//}
