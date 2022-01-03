//
//  LocalizationDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 17/07/2021.
//

import SwiftUI
import SwiftUICharts

struct LocalizationDemoView: View {
    
    let data: LineChartData = weekOfData()
    
    var body: some View {
        LineChart(chartData: data)
            .extraLine(chartData: data, legendTitle: "Local_SecondLine") {
                extraLineData
            } style: {
                extraLineStyle
            }
            .pointMarkers(chartData: data)
            .touchOverlay(chartData: data, specifier: "%.0f")
            .yAxisPOI(chartData: data,
                      markerName: "Local_StepCountAim",
                      markerValue: 15_000,
                      labelPosition: .center(specifier: "%.0f"),
                      labelColour: Color.black,
                      labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
                      lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .yAxisPOI(chartData: data,
                      markerName: "Local_MinimumRecommended",
                      markerValue: 10_000,
                      labelPosition: .center(specifier: "%.0f"),
                      labelColour: Color.white,
                      labelBackground: Color(red: 0.25, green: 0.75, blue: 1.0),
                      lineColour: Color(red: 0.25, green: 0.75, blue: 1.0),
                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .xAxisPOI(chartData: data,
                      markerName: "Local_Worst",
                      markerValue: 2,
                      dataPointCount: data.dataSets.dataPoints.count,
                      lineColour: .red)
            .averageLine(chartData: data,
                         strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .xAxisGrid(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data, style: .standard)
            .extraYAxisLabels(chartData: data)
            .infoDisplay(.verticle(chartData: data), style: .bordered)
            .titleBox(chartData: data,
                      title: HeaderBoxText(text: "Local_Title"),
                      subtitle: HeaderBoxText(text: "Local_Subtitle"))
            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .id(data.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.horizontal)
            
            .navigationTitle("Week of Data")
    }
    
    
    private var extraLineData: [ExtraLineDataPoint] {
        [ExtraLineDataPoint(value: 8000),
         ExtraLineDataPoint(value: 10000),
         ExtraLineDataPoint(value: 15000),
         ExtraLineDataPoint(value: 9000)]
    }
    private var extraLineStyle: ExtraLineStyle {
        ExtraLineStyle(lineColour: .colour(colour: .blue),
                       lineType: .line,
                       yAxisTitle: "Local_extraYAxisTitle")
    }
    
    static func weekOfData() -> LineChartData {
        let data = LineDataSet(dataPoints: [
            LineChartDataPoint(value: 12000, xAxisLabel: "Local_Mo", description: "Local_Monday"   ),
            LineChartDataPoint(value: 10000, xAxisLabel: "Local_Tu", description: "Local_Tuesday"  ),
            LineChartDataPoint(value: 8000 , xAxisLabel: "Local_We", description: "Local_Wednesday"),
            LineChartDataPoint(value: 17500, xAxisLabel: "Local_Th", description: "Local_Thursday" ),
            LineChartDataPoint(value: 16000, xAxisLabel: "Local_Fr", description: "Local_Friday"   ),
            LineChartDataPoint(value: 11000, xAxisLabel: "Local_Sa", description: "Local_Saturday" ),
            LineChartDataPoint(value: 9000 , xAxisLabel: "Local_Su", description: "Local_Sunday"   ),
        ],
        legendTitle: "Local_LegendTitle",
        pointStyle: PointStyle(),
        style: LineStyle(lineColour: .colour(colour: .red), lineType: .curvedLine))
        
        let gridStyle = GridStyle(numberOfLines: 7,
                                  lineColour   : Color(.lightGray).opacity(0.5),
                                  lineWidth    : 1,
                                  dash         : [8],
                                  dashPhase    : 0)
        
        let chartStyle = LineChartStyle(markerType          : .vertical(attachment: .line(dot: .style(DotStyle()))),
                                        
                                        xAxisGridStyle      : gridStyle,
                                        xAxisLabelPosition  : .bottom,
                                        xAxisLabelColour    : Color.primary,
                                        xAxisLabelsFrom     : .dataPoint(rotation: .degrees(0)),
                                        xAxisTitle          : "Local_xAxisTitle",
                                        
                                        yAxisGridStyle      : gridStyle,
                                        yAxisLabelPosition  : .leading,
                                        yAxisLabelColour    : Color.primary,
                                        yAxisNumberOfLabels : 7,
                                        
                                        baseline            : .minimumWithMaximum(of: 5000),
                                        topLine             : .maximum(of: 20000),
                                        
                                        globalAnimation     : .easeOut(duration: 1))
        
        
        
        let chartData = LineChartData(dataSets: data,
                                      chartStyle: chartStyle)
        
        
        
        return chartData
        
    }
}

struct LocalizationDemoView_Previews: PreviewProvider {
    static var previews: some View {
        LocalizationDemoView()
    }
}
