//
//  LineChartWatchDemo.swift
//  SwiftUICharts Demo (watchOS) Extension
//
//  Created by Will Dale on 12/01/2022.
//

import SwiftUI
import SwiftUICharts

struct LineChartWatchDemo: View {
    
    let data: LineChartData = weekOfData()
    
    var body: some View {
        GeometryReader { geo in
            LineChart(chartData: data)
                .touchOverlay(chartData: data,
                              formatter: numberFormatter)
                .yAxisGrid(chartData: data)
                .xAxisLabels(chartData: data)
                .yAxisLabels(chartData: data,
                             formatter: numberFormatter)
                .id(data.id)
                .frame(width: geo.frame(in: .local).width - 20, height: geo.frame(in: .local).height - 20)
                .padding(.top, 20)
        }
    }
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = false
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        return formatter
    }
    
    static func weekOfData() -> LineChartData {
        let data = LineDataSet(dataPoints: [
            LineChartDataPoint(value: 12000, xAxisLabel: "M", description: "Monday"   ),
            LineChartDataPoint(value: 10000, xAxisLabel: "T", description: "Tuesday"  ),
            LineChartDataPoint(value: 8000 , xAxisLabel: "W", description: "Wednesday"),
            LineChartDataPoint(value: 17500, xAxisLabel: "T", description: "Thursday" ),
            LineChartDataPoint(value: 16000, xAxisLabel: "F", description: "Friday"   ),
            LineChartDataPoint(value: 11000, xAxisLabel: "S", description: "Saturday" ),
            LineChartDataPoint(value: 9000 , xAxisLabel: "S", description: "Sunday"   ),
        ],
        legendTitle: "Steps",
        pointStyle: PointStyle(),
        style: LineStyle(lineColour: ColourStyle(colour: .red), lineType: .curvedLine))
        
        let gridStyle = GridStyle(numberOfLines: 3,
                                   lineColour   : Color(.lightGray).opacity(0.5),
                                   lineWidth    : 1,
                                   dash         : [8],
                                   dashPhase    : 0)
        
        let chartStyle = LineChartStyle(infoBoxPlacement    : .infoBox(isStatic: false),
                                        infoBoxContentAlignment: .vertical,
                                        infoBoxBorderColour : Color.primary,
                                        infoBoxBorderStyle  : StrokeStyle(lineWidth: 1),
                                        
                                        markerType          : .vertical(attachment: .line(dot: .style(DotStyle()))),
                                        
                                        xAxisGridStyle      : gridStyle,
                                        xAxisLabelPosition  : .bottom,
                                        xAxisLabelColour    : Color.primary,
                                        xAxisLabelsFrom     : .dataPoint(rotation: .degrees(0)),
                                        
                                        yAxisGridStyle      : gridStyle,
                                        yAxisLabelPosition  : .leading,
                                        yAxisLabelColour    : Color.primary,
                                        yAxisNumberOfLabels : 3,
                                        
                                        globalAnimation     : .easeOut(duration: 1))
        
        
        
        let chartData = LineChartData(dataSets       : data,
                                      metadata       : ChartMetadata(title: "Step Count", subtitle: "Over a Week"),
                                      chartStyle     : chartStyle)
        return chartData
        
    }
}

struct LineChartWatchDemo_Previews: PreviewProvider {
    static var previews: some View {
        LineChartWatchDemo()
    }
}
