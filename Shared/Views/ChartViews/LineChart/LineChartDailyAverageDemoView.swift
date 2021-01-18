//
//  LineChartDailyAverageDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 14/01/2021.
//

import SwiftUI
import SwiftUICharts

struct LineChartDailyAverageDemoView: View {
    
    var data : ChartData = monthOfDataDailyAverage()
    
    var body: some View {
        VStack {
            LineChart()
                .touchOverlay(specifier: "%.2f")
                .yAxisPOI(markerName: "200", markerValue: 200, lineColour: Color.primary)
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
        .navigationTitle("Daily Average")
    }
}

struct LineChartDailyAverageDemoView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartDailyAverageDemoView()
    }
}

extension LineChartDailyAverageDemoView {
    static func monthOfDataDailyAverage() -> ChartData {
        
        var data : [ChartDataPoint] = []
        
        let calendar = Calendar.current
        
        let currentDate = Date()
        
        let startofDay = calendar.startOfDay(for: currentDate)
        let date = calendar.date(byAdding: .hour, value: 8, to: startofDay)
        
        for index in 1...28 {
            let valueOne: Double = Double(Int.random(in: 200...1000))
            let dateOne = calendar.date(byAdding: .day, value: index, to: date!)
            let dateOneHour = calendar.date(byAdding: .hour, value: 1, to: dateOne!)
            data.append(ChartDataPoint(value: valueOne, date: dateOneHour))
            
            let valueTwo: Double = Double(Int.random(in: 100...1000))
            let dateTwo = calendar.date(byAdding: .day, value: index, to: date!)
            let dateTwoHour = calendar.date(byAdding: .hour, value: 2, to: dateTwo!)
            data.append(ChartDataPoint(value: valueTwo, date: dateTwoHour))
            
            let valueThree: Double = Double(Int.random(in: 300...1000))
            let dateThree = calendar.date(byAdding: .day, value: index, to: date!)
            let dateThreeHour = calendar.date(byAdding: .hour, value: 4, to: dateThree!)
            data.append(ChartDataPoint(value: valueThree, date: dateThreeHour))
            
            let valueFour: Double = Double(Int.random(in: 600...1000))
            let dateFour = calendar.date(byAdding: .day, value: index, to: date!)
            let dateFourHour = calendar.date(byAdding: .hour, value: 8, to: dateFour!)
            data.append(ChartDataPoint(value: valueFour, date: dateFourHour))
        }
        
        let metadata   : ChartMetadata  = ChartMetadata(title       : "Test Data",
                                                        subtitle    : "A Months Worth - Daily Average",
                                                        lineLegend  : "Data")
        
        let labels      : [String]      = ["J", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]

        let gridStyle   : GridStyle     = GridStyle(numberOfLines: 7,
                                                    lineColour   : Color(.lightGray),
                                                    lineWidth    : 1)
        
        let chartStyle  : ChartStyle    = ChartStyle(infoBoxPlacement   : .floating,
                                                     xAxisGridStyle     : gridStyle,
                                                     yAxisGridStyle     : gridStyle,
                                                     xAxisLabelPosition : .bottom,
                                                     xAxisLabelsFrom    : .chartData,
                                                     yAxisLabelPosition : .leading,
                                                     yAxisNumberOfLabels: 5)
        
        let lineStyle   : LineStyle     = LineStyle(colour: Color(.blue),
                                                    lineType: .line,
                                                    strokeStyle: StrokeStyle(lineWidth: 3,
                                                                             lineCap: .round,
                                                                             lineJoin: .round))
        
        return ChartData(dataPoints     : data,
                         metadata       : metadata,
                         xAxisLabels    : labels,
                         chartStyle     : chartStyle,
                         lineStyle      : lineStyle,
                         calculations   : .averageDay)
        
        
    }
}

