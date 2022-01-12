//
//  MultiLineChartWatchDemo.swift
//  SwiftUICharts Demo (watchOS) Extension
//
//  Created by Will Dale on 12/01/2022.
//

import SwiftUI
import SwiftUICharts

struct MultiLineChartWatchDemo: View {
    
    let data: MultiLineChartData = weekOfData()
    
    var body: some View {
        MultiLineChart(chartData: data)
            .pointMarkers(chartData: data)
            .xAxisGrid(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data, specifier: "%.01f")
            .id(data.id)
            .padding([.vertical, .trailing], 10)
            .ignoresSafeArea(.all, edges: [.leading, .trailing, .bottom])
    }

    static func weekOfData() -> MultiLineChartData {
        let data = MultiLineDataSet(dataSets: [
            LineDataSet(dataPoints: [
                LineChartDataPoint(value: 4.3,  xAxisLabel: "J", description: "January"),
                LineChartDataPoint(value: 4.5,  xAxisLabel: "F", description: "February"),
                LineChartDataPoint(value: 6.9,  xAxisLabel: "M", description: "March"),
                LineChartDataPoint(value: 8.7,  xAxisLabel: "A", description: "April"),
                LineChartDataPoint(value: 12.1, xAxisLabel: "M", description: "May"),
                LineChartDataPoint(value: 15.1, xAxisLabel: "J", description: "June"),
                LineChartDataPoint(value: 17.3, xAxisLabel: "J", description: "July"),
                LineChartDataPoint(value: 17.0, xAxisLabel: "A", description: "August"),
                LineChartDataPoint(value: 14.3, xAxisLabel: "S", description: "September"),
                LineChartDataPoint(value: 10.9, xAxisLabel: "O", description: "October"),
                LineChartDataPoint(value: 7.2,  xAxisLabel: "N", description: "November"),
                LineChartDataPoint(value: 4.7,  xAxisLabel: "D", description: "December")
            ],
            legendTitle: "London",
            pointStyle: PointStyle(),
            style: LineStyle(lineColour: ColourStyle(colour: .red), lineType: .line)),
            
            LineDataSet(dataPoints: [
                LineChartDataPoint(value: 16.9, xAxisLabel: "J", description: "January"),
                LineChartDataPoint(value: 17.2, xAxisLabel: "F", description: "February"),
                LineChartDataPoint(value: 15.8, xAxisLabel: "M", description: "March"),
                LineChartDataPoint(value: 13.7, xAxisLabel: "A", description: "April"),
                LineChartDataPoint(value: 11.7, xAxisLabel: "M", description: "May"),
                LineChartDataPoint(value: 9.7,  xAxisLabel: "J", description: "June"),
                LineChartDataPoint(value: 8.9,  xAxisLabel: "J", description: "July"),
                LineChartDataPoint(value: 9.4,  xAxisLabel: "A", description: "August"),
                LineChartDataPoint(value: 10.8, xAxisLabel: "S", description: "September"),
                LineChartDataPoint(value: 12.0, xAxisLabel: "O", description: "October"),
                LineChartDataPoint(value: 13.5, xAxisLabel: "N", description: "November"),
                LineChartDataPoint(value: 15.4, xAxisLabel: "D", description: "December")
            ],
            legendTitle: "Wellington",
            pointStyle: PointStyle(),
            style: LineStyle(lineColour: ColourStyle(colour: .blue), lineType: .line)),
            
            LineDataSet(dataPoints: [
                LineChartDataPoint(value: 14.6, xAxisLabel: "J", description: "January"),
                LineChartDataPoint(value: 15.9, xAxisLabel: "F", description: "February"),
                LineChartDataPoint(value: 18.1, xAxisLabel: "M", description: "March"),
                LineChartDataPoint(value: 19.6, xAxisLabel: "A", description: "April"),
                LineChartDataPoint(value: 20.0, xAxisLabel: "M", description: "May"),
                LineChartDataPoint(value: 19.4, xAxisLabel: "J", description: "June"),
                LineChartDataPoint(value: 18.2, xAxisLabel: "J", description: "July"),
                LineChartDataPoint(value: 18.3, xAxisLabel: "A", description: "August"),
                LineChartDataPoint(value: 18.0, xAxisLabel: "S", description: "September"),
                LineChartDataPoint(value: 17.1, xAxisLabel: "O", description: "October"),
                LineChartDataPoint(value: 16.3, xAxisLabel: "N", description: "November"),
                LineChartDataPoint(value: 15.0, xAxisLabel: "D", description: "December")
            ],
            legendTitle: "Mexico City",
            pointStyle: PointStyle(),
            style: LineStyle(lineColour: ColourStyle(colour: .green), lineType: .line)),
            
            LineDataSet(dataPoints: [
                LineChartDataPoint(value: -4.5, xAxisLabel: "J", description: "January"),
                LineChartDataPoint(value: -4.9, xAxisLabel: "F", description: "February"),
                LineChartDataPoint(value: -2.6, xAxisLabel: "M", description: "March"),
                LineChartDataPoint(value: 1.9,  xAxisLabel: "A", description: "April"),
                LineChartDataPoint(value: 6.4,  xAxisLabel: "M", description: "May"),
                LineChartDataPoint(value: 10.9, xAxisLabel: "J", description: "June"),
                LineChartDataPoint(value: 15.8, xAxisLabel: "J", description: "July"),
                LineChartDataPoint(value: 16.1, xAxisLabel: "A", description: "August"),
                LineChartDataPoint(value: 12.4, xAxisLabel: "S", description: "September"),
                LineChartDataPoint(value: 7.4,  xAxisLabel: "O", description: "October"),
                LineChartDataPoint(value: 3.0,  xAxisLabel: "N", description: "November"),
                LineChartDataPoint(value: -1.5, xAxisLabel: "D", description: "December")
            ],
            legendTitle: "St. John's",
            pointStyle: PointStyle(),
            style: LineStyle(lineColour: ColourStyle(colour: .primary), lineType: .line)),
        ])
        
        return MultiLineChartData(dataSets: data,
                                  metadata: ChartMetadata(title: "Average Temperature", subtitle: "Monthly"),
                                  xAxisLabels: ["January", "December"],
                                  chartStyle: LineChartStyle(markerType: .full(attachment: .line(dot: .style(DotStyle()))),
                                                             xAxisGridStyle: GridStyle(numberOfLines: 3),
                                                             yAxisGridStyle: GridStyle(numberOfLines: 3),
                                                             yAxisNumberOfLabels: 3))
    }
}

struct MultiLineChartWatchDemo_Previews: PreviewProvider {
    static var previews: some View {
        MultiLineChartWatchDemo()
    }
}
