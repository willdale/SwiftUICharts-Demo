//
//  LineChartCustomCalculationDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 14/01/2021.
//

import SwiftUI
import SwiftUICharts

//struct LineChartCustomCalculationDemoView: View {
//    
//    var data : ChartData = monthOfDataDailyAverage()
//    
//    var body: some View {
//        VStack {
//            Text("The data input for this chart is for 28 days of data. Each day has 4 datapoints. The ChartData init has a closure in it where additional calculations can be done. In this case, the calculation is give the sum of each day.")
//                .padding()
//            LineChart()
//                .touchOverlay(specifier: "%.2f")
//                .pointMarkers()
//                .yAxisPOI(markerName: "0", markerValue: 0, lineColour: Color.primary)
//                .xAxisGrid()
//                .yAxisGrid()
//                .xAxisLabels()
//                .yAxisLabels()
//                .headerBox()
//                .legends()
//                .environmentObject(data)
//                .frame(minWidth: 300, maxWidth: 900, minHeight: 300, idealHeight: 400, maxHeight: 500, alignment: .center)
//                .padding(.all, 24)
//                .background(
//                    ZStack {
//                        DemoContainer()
//                    }
//                )
//                .padding()
//            
//            
//        }
//        .navigationTitle("Daily Total")
//    }
//}
//
//struct LineChartCustomCalculationDemoView_Previews: PreviewProvider {
//    static var previews: some View {
//        LineChartCustomCalculationDemoView()
//    }
//}
//
//
//extension LineChartCustomCalculationDemoView {
//    static func monthOfDataDailyAverage() -> ChartData {
//        
//        // Make dataPoints
//        let calendar = Calendar.current
//        let currentDate = Date()
//        let startofDay = calendar.startOfDay(for: currentDate)
//        let date = calendar.date(byAdding: .hour, value: 8, to: startofDay)
//        
//        var data : [ChartDataPoint] = []
//        for index in 1...28 {
//            let valueOne: Double = Double(Int.random(in: 200...1000))
//            let dateOne = calendar.date(byAdding: .day, value: index, to: date!)
//            let dateOneHour = calendar.date(byAdding: .hour, value: 1, to: dateOne!)
//            data.append(ChartDataPoint(value: valueOne, date: dateOneHour))
//            
//            let valueTwo: Double = Double(Int.random(in: 100...1000))
//            let dateTwo = calendar.date(byAdding: .day, value: index, to: date!)
//            let dateTwoHour = calendar.date(byAdding: .hour, value: 2, to: dateTwo!)
//            data.append(ChartDataPoint(value: valueTwo, date: dateTwoHour))
//            
//            let valueThree: Double = Double(Int.random(in: 300...1000))
//            let dateThree = calendar.date(byAdding: .day, value: index, to: date!)
//            let dateThreeHour = calendar.date(byAdding: .hour, value: 4, to: dateThree!)
//            data.append(ChartDataPoint(value: valueThree, date: dateThreeHour))
//            
//            let valueFour: Double = Double(Int.random(in: 600...1000))
//            let dateFour = calendar.date(byAdding: .day, value: index, to: date!)
//            let dateFourHour = calendar.date(byAdding: .hour, value: 8, to: dateFour!)
//            data.append(ChartDataPoint(value: valueFour, date: dateFourHour))
//        }
//        
//        let metadata   : ChartMetadata  = ChartMetadata(title       : "Test Data",
//                                                        subtitle    : "A months worth - Daily Total",
//                                                        lineLegend  : "Data")
//        
//        let labels      : [String]      = ["Jan", "Feb", ""]
//        
//        let gridStyle   : GridStyle     = GridStyle(lineColour  : Color(.lightGray),
//                                                    lineWidth   : 1)
//        
//        let chartStyle  : ChartStyle    = ChartStyle(infoBoxPlacement   : .header,
//                                                     xAxisGridStyle     : gridStyle,
//                                                     yAxisGridStyle     : gridStyle,
//                                                     xAxisLabelPosition : .bottom,
//                                                     xAxisLabelsFrom    : .chartData,
//                                                     yAxisLabelPosition : .leading,
//                                                     yAxisNumberOfLabels: 5)
//        
//        let lineStyle   : LineStyle     = LineStyle(colours: [Color(red: 0.15, green: 0.15, blue: 1.0),
//                                                              Color(red: 0.35, green: 0.35, blue: 1.0)],
//                                                    startPoint: .leading,
//                                                    endPoint: .trailing,
//                                                    lineType: .curvedLine,
//                                                    strokeStyle: StrokeStyle(lineWidth: 3,
//                                                                             lineCap: .round,
//                                                                             lineJoin: .round))
//        let pointStyle : PointStyle     = PointStyle(pointSize: 6,
//                                                     borderColour: .primary,
//                                                     fillColour: .clear,
//                                                     lineWidth: 1,
//                                                     pointType: .outline,
//                                                     pointShape: .circle)
//        
//        return ChartData(dataPoints     : data,
//                         metadata       : metadata,
//                         xAxisLabels    : labels,
//                         chartStyle     : chartStyle,
//                         lineStyle      : lineStyle,
//                         pointStyle     : pointStyle) { (dataPoints) -> [ChartDataPoint]? in
//            // Closure to return sum of each day
//            let calendar = Calendar.current
//            
//            let formatterForXAxisLabel      = DateFormatter()
//            formatterForXAxisLabel.locale   = .current
//            formatterForXAxisLabel.setLocalizedDateFormatFromTemplate("MMM")
//            let formatterForPointLabel      = DateFormatter()
//            formatterForXAxisLabel.locale   = .current
//            formatterForPointLabel.setLocalizedDateFormatFromTemplate("dd MMM YYYY")
//            
//            guard let firstDataPoint = dataPoints.first?.date else { return nil }
//            guard let lastDataPoint  = dataPoints.last?.date else { return nil }
//            
//            guard let numberOfWeeks = calendar.dateComponents([.day],
//                                                              from: firstDataPoint,
//                                                              to: lastDataPoint).day else { return nil }
//            
//            var outputData : [ChartDataPoint] = []
//            for index in 0...numberOfWeeks {
//                if let date = calendar.date(byAdding: .day, value: index, to: firstDataPoint) {
//                    
//                    let requestedDay = calendar.dateComponents([.year, .day], from: date)
//                    
//                    let dayOfData = dataPoints.filter { (dataPoint) -> Bool in
//                        let day = calendar.dateComponents([.year, .day], from:  dataPoint.date ?? Date())
//                        return day == requestedDay
//                    }
//                    let sum = dayOfData.reduce(0) { $0 + $1.value }
//                    
//                    outputData.append(ChartDataPoint(value: sum,
//                                                     xAxisLabel: formatterForXAxisLabel.string(from: date),
//                                                     pointLabel: formatterForPointLabel.string(from: date)))
//                }
//            }
//            return outputData
//        }
//        
//        
//    }
//}
