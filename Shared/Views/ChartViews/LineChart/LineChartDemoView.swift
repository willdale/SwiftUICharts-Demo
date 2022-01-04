//
//  LineChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 23/01/2021.
//

import SwiftUI
import SwiftUICharts
import Combine

struct LineChartDemoView: View {
    
    let data: LineChartData = weekOfData()
    
    var body: some View {
        LineChart(chartData: data)
            .pointMarkers(chartData: data)
            .touch(chartData: data)
            
            .yAxisPOI(chartData: data, label: "Step Count Aim", value: 16_000, position: .leading, style: .red)
//            .yAxisPOI(chartData: data, label: "Minimum Recommended", value: 10_000, position: .center, style: .red)
//            .xAxisPOI(chartData: data,
//                      markerName: "Worst",
//                      markerValue: 2,
//                      dataPointCount: data.dataSets.dataPoints.count,
//                      lineColour: .red)
        
//            .averageLine(chartData: data, label: "Average", position: .center, style: .red)
        
            .xAxisGrid(chartData: data)
            .yAxisGrid(chartData: data)
        
            .axisBorder(chartData: data, side: .leading, style: .lightGray)
            .axisBorder(chartData: data, side: .bottom, style: .lightGray)
        
            .xAxisLabels(chartData: data, style: .standard)
            .yAxisLabels(chartData: data)
        
            .axisTitle(chartData: data, text: "bottom", style: .bottom)
            .axisTitle(chartData: data, text: "leading", style: .leading)
        
            .infoDisplay(.verticle(chartData: data))
            .titleBox(chartData: data,
                      title: HeaderBoxText(text: "Step Count"),
                      subtitle: HeaderBoxText(text: "Over a Week"))
            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .animation(.none, value: data.id)
            .id(data.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.horizontal)
            .navigationTitle("Week of Data")
    }
    
    static func weekOfData() -> LineChartData {
        let data = LineDataSet(dataPoints: [
            LineChartDataPoint(value: 12000, xAxisLabel: "M", description: "Monday"   , ignore: false),
            LineChartDataPoint(value: 10000, xAxisLabel: "T", description: "Tuesday"  , ignore: false),
            LineChartDataPoint(value: 8000 , xAxisLabel: "W", description: "Wednesday", ignore: false),
            LineChartDataPoint(value: 17500, xAxisLabel: "T", description: "Thursday" , ignore: false),
            LineChartDataPoint(value: 16000, xAxisLabel: "F", description: "Friday"   , ignore: false),
            LineChartDataPoint(value: 11000, xAxisLabel: "S", description: "Saturday" , ignore: false),
            LineChartDataPoint(value: 9000 , xAxisLabel: "S", description: "Sunday"   , ignore: false),
        ],
        legendTitle: "Steps",
        pointStyle: PointStyle(),
        style: LineStyle(lineColour: .colour(colour: .red), lineType: .curvedLine))
        
        return LineChartData(dataSets: data)
    }
    
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartDemoView()
    }
}

extension Color {
    public static var myBackground: Color {
        #if os(iOS)
        return Color(.systemBackground)
        #elseif os(tvOS)
        return Color(.darkGray)
        #elseif os(macOS)
        return Color(.windowBackgroundColor)
        #endif
    }
}
