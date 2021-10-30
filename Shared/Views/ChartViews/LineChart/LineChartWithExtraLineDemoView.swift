//
//  LineChartWithExtraLineDemoView.swift
//  LineChartWithExtraLineDemoView
//
//  Created by Will Dale on 17/09/2021.
//

import SwiftUI
import SwiftUICharts

struct LineChartWithExtraLineDemoView: View {
    
    let data: LineChartData = weekOfData()
    
    var body: some View {
        LineChart(chartData: data)
            .extraLine(chartData: data,
                       legendTitle: "Test",
                       datapoints: extraLineData,
                       style: extraLineStyle)
            .pointMarkers(chartData: data)
            .touchOverlay(chartData: data, specifier: "%.0f")
            .xAxisGrid(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data, colourIndicator: .style(size: 12))
            .extraYAxisLabels(chartData: data, colourIndicator: .style(size: 12))
            .infoDisplay(.verticle(chartData: data), style: .bordered)
            .titleBox(chartData: data,
                      title: HeaderBoxText(text: "Step Count"),
                      subtitle: HeaderBoxText(text: "Over a Week"))
            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .id(data.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.horizontal)
            
            .navigationTitle("Week of Data")
    }
    
    
    private var extraLineData: [ExtraLineDataPoint] {
        [ExtraLineDataPoint(value: 8000, pointDescription: "Something 1"),
         ExtraLineDataPoint(value: 10000, pointDescription: "Something 2"),
         ExtraLineDataPoint(value: 15000, pointDescription: "Something 3"),
         ExtraLineDataPoint(value: 9000, pointDescription: "Something 4")]
    }
    
    private var extraLineStyle: ExtraLineStyle {
        ExtraLineStyle(lineColour: ColourStyle(colour: .blue),
                       lineType: .line,
                       yAxisTitle: "Another Axis")
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
        
        let gridStyle = GridStyle(numberOfLines: 7,
                                   lineColour: Color(.lightGray).opacity(0.5),
                                   lineWidth: 1,
                                   dash: [8],
                                   dashPhase: 0)
        
        let chartStyle = LineChartStyle(markerType: .vertical(attachment: .line(dot: .style(DotStyle()))),
                                        
                                        xAxisGridStyle: gridStyle,
                                        xAxisLabelPosition: .bottom,
                                        xAxisLabelColour: Color.primary,
                                        xAxisLabelsFrom: .dataPoint(rotation: .degrees(0)),
                                        xAxisTitle: "xAxisTitle",
                                        
                                        yAxisGridStyle: gridStyle,
                                        yAxisLabelPosition: .leading,
                                        yAxisLabelColour: Color.primary,
                                        yAxisNumberOfLabels: 7,
                                        
                                        baseline: .minimumWithMaximum(of: 5000),
                                        topLine: .maximum(of: 20000),
                                        
                                        globalAnimation: .easeOut(duration: 1))
        
        
        
        let chartData = LineChartData(dataSets: data,
                                      chartStyle: chartStyle)
        
        return chartData
        
    }

}

struct LineChartWithExtraLineDemoView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartWithExtraLineDemoView()
    }
}
