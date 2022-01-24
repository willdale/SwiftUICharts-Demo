//
//  FilledLineChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 26/01/2021.
//

import SwiftUI
import SwiftUICharts

struct FilledLineChartDemoView: View {
    
    @State var data: FilledLineChartData = weekOfData()
    @State private var touchLocation: CGPoint?
    
    var body: some View {
        VStack {
            FilledLineChart(chartData: data)
//                .touch(chartData: data) { touchLocation = $0 }
                .pointMarkers(chartData: data)
//                .yAxisPOI(chartData: data,
//                          markerName: "Step Count Aim",
//                          markerValue: 15_000,
//                          labelPosition: .center(specifier: "%.0f"),
//                          labelColour: Color.black,
//                          labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
//                          lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
//                          strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
//                .yAxisPOI(chartData: data,
//                          markerName: "Minimum Recommended",
//                          markerValue: 10_000,
//                          labelPosition: .center(specifier: "%.0f"),
//                          labelColour: Color.white,
//                          labelBackground: Color(red: 0.25, green: 0.75, blue: 1.0),
//                          lineColour: Color(red: 0.25, green: 0.75, blue: 1.0),
//                          strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
//                .averageLine(chartData: data,
//                             strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
//                .xAxisGrid(chartData: data)
//                .yAxisGrid(chartData: data)
//                .xAxisLabels(chartData: data)
//                .yAxisLabels(chartData: data, position: [.leading], data: .generated)
            
//                .infoDisplay(.verticle(chartData: data), style: .bordered)
                .titleBox(chartData: data,
                          title: HeaderBoxText(text: "Some Data"),
                          subtitle: HeaderBoxText(text: "A Week"))
                .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
                .id(data.id)
                .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
                .padding(.horizontal)
        }
        .navigationTitle("Filled Line")
    }
    
    static func weekOfData() -> FilledLineChartData {
        let data = FilledLineDataSet(dataPoints: [
            LineChartDataPoint(value: 12000, xAxisLabel: "M", description: "Monday"     , ignore: true),
            LineChartDataPoint(value: 13000, xAxisLabel: "T", description: "Tuesday"    , ignore: true),
            LineChartDataPoint(value: 8000,  xAxisLabel: "W", description: "Wednesday"  , ignore: false),
            LineChartDataPoint(value: 17500, xAxisLabel: "T", description: "Thursday"   , ignore: true),
            LineChartDataPoint(value: 16000, xAxisLabel: "F", description: "Friday"     , ignore: false),
            LineChartDataPoint(value: 11000, xAxisLabel: "S", description: "Saturday"   , ignore: true),
            LineChartDataPoint(value: 9000,  xAxisLabel: "S", description: "Sunday"     , ignore: true)
        ],
        legendTitle: "Test One",
        pointStyle: PointStyle(),
        style: FilledLineStyle())
        
        return FilledLineChartData(dataSets: data,
                                   xAxisLabels: ["Monday", "Thursday", "Sunday"])
    }
}

struct FilledLineChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        FilledLineChartDemoView()
    }
}
