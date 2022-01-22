//
//  FilteredDemo.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 28/02/2021.
//

import SwiftUI
import SwiftUICharts

struct FilteredDemo: View {
    
    @State private var startDate : Date = Date()
    
    var body: some View {
        VStack {
            #if os(iOS)
            DatePicker("Select Date", selection: $startDate)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
            #elseif os(macOS)
            DatePicker("Select Date", selection: $startDate)
                .datePickerStyle(DefaultDatePickerStyle())
                .labelsHidden()
                .frame(minWidth: 150, maxWidth: 900)
                .padding(.all, 24)
            #endif
            FilterView(startDate: startDate, title: "Hello", subtitle: "World")
            
        }
        .navigationTitle(Text("Date Picker"))
    }
    
}

struct FilterView: View {
    
    let data: LineChartData
    let title: HeaderBoxText
    let subtitle: HeaderBoxText
        
    @State private var touchLocation: CGPoint?
    @State private var chartSize: CGRect = .zero
    
    var body: some View { EmptyView()
//        LineChart(chartData: data) //{ chartSize = $0 }
//            .pointMarkers(chartData: data)
//            .touch(chartData: data) { touchLocation = $0 }
//            .yAxisPOI(chartData: data,
//                      markerName: "Step Count Aim",
//                      markerValue: 150,
//                      labelPosition: .center(specifier: "%.0f"),
//                      labelColour: Color.black,
//                      labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
//                      lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
//                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
//            .yAxisPOI(chartData: data,
//                      markerName: "Minimum Recommended",
//                      markerValue: 100,
//                      labelPosition: .center(specifier: "%.0f"),
//                      labelColour: Color.white,
//                      labelBackground: Color(red: 0.25, green: 0.75, blue: 1.0),
//                      lineColour: Color(red: 0.25, green: 0.75, blue: 1.0),
//                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
//            .averageLine(chartData: data,
//                         strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
//            .xAxisGrid(chartData: data)
//            .yAxisGrid(chartData: data)
//            .xAxisLabels(chartData: data)
//            .yAxisLabels(chartData: data)
        
//            .infoDisplay(.verticle(chartData: data), style: .bordered)
//            .titleBox(chartData: data,
//                      title: title,
//                      subtitle: subtitle)
//            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.all, 24)
            .id(data.id)
    }
    
    init(startDate: Date, title: String, subtitle: String) {
        var calendar = Calendar.current
        calendar.timeZone = NSTimeZone.local
        
        let endDate = calendar.date(byAdding: .day, value: 7, to: startDate) ?? Date()
        
        let myDataPoints = MyData().data.filter({ $0.date >= startDate && $0.date <= endDate })
        
        let chartDataPoints : [LineChartDataPoint] = myDataPoints.map { (myData) in
            LineChartDataPoint(value: myData.value, xAxisLabel: myData.xAxisLabel, description: myData.description)
        }
        
        self.data = LineChartData(dataSets: LineDataSet(dataPoints: chartDataPoints, legendTitle: "Steps"))
        self.title = HeaderBoxText(text: title)
        self.subtitle = HeaderBoxText(text: subtitle)
    }
}

// Database
struct MyDataModel {
    var value       : Double
    let xAxisLabel  : String
    let description : String
    let date        : Date
}

struct MyData {
    
    var data = [
        MyDataModel(value: 140, xAxisLabel: "1",  description: "One",   date: Calendar.current.date(byAdding: .day, value: 1,  to: Date())!),
        MyDataModel(value: 150, xAxisLabel: "2",  description: "Two",   date: Calendar.current.date(byAdding: .day, value: 2,  to: Date())!),
        MyDataModel(value: 190, xAxisLabel: "3",  description: "Three", date: Calendar.current.date(byAdding: .day, value: 3,  to: Date())!),
        MyDataModel(value: 110, xAxisLabel: "4",  description: "Four",  date: Calendar.current.date(byAdding: .day, value: 4,  to: Date())!),
        MyDataModel(value: 100, xAxisLabel: "5",  description: "Five",  date: Calendar.current.date(byAdding: .day, value: 5,  to: Date())!),
        MyDataModel(value: 190, xAxisLabel: "6",  description: "Six",   date: Calendar.current.date(byAdding: .day, value: 6,  to: Date())!),
        MyDataModel(value: 130, xAxisLabel: "7",  description: "Seven", date: Calendar.current.date(byAdding: .day, value: 7,  to: Date())!),
        
        MyDataModel(value: 160, xAxisLabel: "8",  description: "One",   date: Calendar.current.date(byAdding: .day, value: 8,  to: Date())!),
        MyDataModel(value: 120, xAxisLabel: "9",  description: "Two",   date: Calendar.current.date(byAdding: .day, value: 9,  to: Date())!),
        MyDataModel(value: 110, xAxisLabel: "10", description: "Three", date: Calendar.current.date(byAdding: .day, value: 10, to: Date())!),
        MyDataModel(value: 190, xAxisLabel: "11", description: "Four",  date: Calendar.current.date(byAdding: .day, value: 11, to: Date())!),
        MyDataModel(value: 150, xAxisLabel: "12", description: "Five",  date: Calendar.current.date(byAdding: .day, value: 12, to: Date())!),
        MyDataModel(value: 130, xAxisLabel: "13", description: "Six",   date: Calendar.current.date(byAdding: .day, value: 13, to: Date())!),
        MyDataModel(value: 120, xAxisLabel: "14", description: "Seven", date: Calendar.current.date(byAdding: .day, value: 14, to: Date())!),
        
        MyDataModel(value: 190, xAxisLabel: "16", description: "One",   date: Calendar.current.date(byAdding: .day, value: 16, to: Date())!),
        MyDataModel(value: 180, xAxisLabel: "17", description: "Two",   date: Calendar.current.date(byAdding: .day, value: 17, to: Date())!),
        MyDataModel(value: 170, xAxisLabel: "18", description: "Three", date: Calendar.current.date(byAdding: .day, value: 18, to: Date())!),
        MyDataModel(value: 160, xAxisLabel: "19", description: "Four",  date: Calendar.current.date(byAdding: .day, value: 19, to: Date())!),
        MyDataModel(value: 150, xAxisLabel: "19", description: "Five",  date: Calendar.current.date(byAdding: .day, value: 19, to: Date())!),
        MyDataModel(value: 140, xAxisLabel: "20", description: "Six",   date: Calendar.current.date(byAdding: .day, value: 20, to: Date())!),
        MyDataModel(value: 130, xAxisLabel: "21", description: "Seven", date: Calendar.current.date(byAdding: .day, value: 21, to: Date())!),
        
        MyDataModel(value: 120, xAxisLabel: "22", description: "One",   date: Calendar.current.date(byAdding: .day, value: 22, to: Date())!),
        MyDataModel(value: 110, xAxisLabel: "23", description: "Two",   date: Calendar.current.date(byAdding: .day, value: 23, to: Date())!),
        MyDataModel(value: 120, xAxisLabel: "24", description: "Three", date: Calendar.current.date(byAdding: .day, value: 24, to: Date())!),
        MyDataModel(value: 130, xAxisLabel: "25", description: "Four",  date: Calendar.current.date(byAdding: .day, value: 25, to: Date())!),
        MyDataModel(value: 140, xAxisLabel: "26", description: "Five",  date: Calendar.current.date(byAdding: .day, value: 26, to: Date())!),
        MyDataModel(value: 150, xAxisLabel: "27", description: "Six",   date: Calendar.current.date(byAdding: .day, value: 27, to: Date())!),
        MyDataModel(value: 160, xAxisLabel: "28", description: "Seven", date: Calendar.current.date(byAdding: .day, value: 28, to: Date())!)
    ]
   
}
