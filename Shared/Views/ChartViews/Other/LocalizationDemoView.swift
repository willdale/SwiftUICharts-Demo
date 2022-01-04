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
            .touch(chartData: data)
        
            .yAxisPOI(chartData: data, label: "Local_StepCountAim", value: 15_000, position: .leading, style: .red)
        
            .xAxisPOI(chartData: data,
                      markerName: "Local_Worst",
                      markerValue: 2,
                      dataPointCount: data.dataSets.dataPoints.count,
                      lineColour: .red)
            .averageLine(chartData: data, label: "Average", position: .leading, style: .red)
        
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
        
        return LineChartData(dataSets: data)
    }
}

struct LocalizationDemoView_Previews: PreviewProvider {
    static var previews: some View {
        LocalizationDemoView()
    }
}
