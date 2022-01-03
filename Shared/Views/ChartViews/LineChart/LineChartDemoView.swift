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
        
            .yAxisPOI(chartData: data,
                      markerName: "Step Count Aim",
                      markerValue: 15_000,
                      labelPosition: .center(specifier: "%.0f"),
                      labelColour: Color.black,
                      labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
                      lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .yAxisPOI(chartData: data,
                      markerName: "Minimum Recommended",
                      markerValue: 10_000,
                      labelPosition: .center(specifier: "%.0f"),
                      labelColour: Color.white,
                      labelBackground: Color(red: 0.25, green: 0.75, blue: 1.0),
                      lineColour: Color(red: 0.25, green: 0.75, blue: 1.0),
                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .xAxisPOI(chartData: data,
                      markerName: "Worst",
                      markerValue: 2,
                      dataPointCount: data.dataSets.dataPoints.count,
                      lineColour: .red)
            .averageLine(chartData: data,
                         strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
        
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
            LineChartDataPoint(value: 12000, xAxisLabel: "M", description: "Monday"   , ignore: true),
            LineChartDataPoint(value: 10000, xAxisLabel: "T", description: "Tuesday"  , ignore: false),
            LineChartDataPoint(value: 8000 , xAxisLabel: "W", description: "Wednesday", ignore: true),
            LineChartDataPoint(value: 17500, xAxisLabel: "T", description: "Thursday" , ignore: true),
            LineChartDataPoint(value: 16000, xAxisLabel: "F", description: "Friday"   , ignore: false),
            LineChartDataPoint(value: 11000, xAxisLabel: "S", description: "Saturday" , ignore: false),
            LineChartDataPoint(value: 9000 , xAxisLabel: "S", description: "Sunday"   , ignore: true),
        ],
        legendTitle: "Steps",
        pointStyle: PointStyle(),
        style: LineStyle(lineColour: .colour(colour: .red), lineType: .curvedLine))
        
        let gridStyle = GridStyle(numberOfLines: 7,
                                  lineColour: Color(.lightGray).opacity(0.5),
                                  lineWidth: 1,
                                  dash: [8],
                                  dashPhase: 0)
        
        let chartStyle = LineChartStyle(markerType          : .vertical(attachment: .line(dot: .style(DotStyle()))),
                                        
                                        xAxisGridStyle      : gridStyle,
                                        xAxisLabelPosition  : .bottom,
                                        xAxisLabelColour    : Color.primary,
                                        xAxisLabelsFrom     : .dataPoint(rotation: .degrees(0)),
                                        xAxisTitle          : "xAxisTitle",
                                        
                                        yAxisGridStyle      : gridStyle,
                                        yAxisLabelPosition  : .leading,
                                        yAxisLabelColour    : Color.primary,
                                        yAxisNumberOfLabels : 7,
                                        
                                        baseline            : .minimumWithMaximum(of: 5000),
                                        topLine             : .maximum(of: 20000),
                                        
                                        globalAnimation     : .easeOut(duration: 1))
        
        
        
        let chartData = LineChartData(dataSets: data,
                                      chartStyle: chartStyle)
        
//        defer {
//            chartData.touchedDataPointPublisher
//                .map(\.datapoint)
//                .map(\.value)
//                .sink { value in
//                    var dotStyle: DotStyle
//                    if value < 10_000 {
//                        dotStyle = DotStyle(fillColour: .red)
//                    } else if value >= 10_000 && value <= 15_000 {
//                        dotStyle = DotStyle(fillColour: .blue)
//                    } else {
//                        dotStyle = DotStyle(fillColour: .green)
//                    }
//                    withAnimation(.linear(duration: 0.5)) {
//                        chartData.chartStyle.markerType = .vertical(attachment: .line(dot: .style(dotStyle)))
//                    }
//                }
//                .store(in: &chartData.subscription)
//        }
        
        return chartData
        
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
