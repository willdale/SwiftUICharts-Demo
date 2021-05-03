//
//  HorizontalBarChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 26/04/2021.
//

import SwiftUI
import SwiftUICharts

struct HorizontalBarChartDemoView: View {
    
    let data: HorizontalBarChartData = weekOfData()
    
    var body: some View {
        HorizontalBarChart(chartData: data)
            .touchOverlay(chartData: data)
            .yAxisPOI(chartData: data,
                      markerName: "Step Count Aim",
                      markerValue: 600,
                      labelPosition: .center(specifier: "%.0f"),
                      labelColour: Color.black,
                      labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
                      lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .yAxisPOI(chartData: data,
                      markerName: "Minimum Recommended",
                      markerValue: 100,
                      labelPosition: .center(specifier: "%.0f"),
                      labelColour: Color.white,
                      labelBackground: Color(red: 0.25, green: 0.75, blue: 1.0),
                      lineColour: Color(red: 0.25, green: 0.75, blue: 1.0),
                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .averageLine(chartData: data,
                         strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .xAxisGrid(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data)
            .headerBox(chartData: data)
            .id(data.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.horizontal)
    }
    
    static func weekOfData() -> HorizontalBarChartData {
                
        let data : BarDataSet =
            BarDataSet(dataPoints: [
                BarChartDataPoint(value: 200, xAxisLabel: "Laptops"   , description: "Laptops"   , colour: ColourStyle(colour: .purple)),
                BarChartDataPoint(value: 90,  xAxisLabel: "Desktops"  , description: "Desktops"  , colour: ColourStyle(colour: .blue)),
                BarChartDataPoint(value: 700, xAxisLabel: "Phones"    , description: "Phones"    , colour: ColourStyle(colour: .green)),
                BarChartDataPoint(value: 175, xAxisLabel: "Tablets"   , description: "Tablets"   , colour: ColourStyle(colour: .yellow)),
                BarChartDataPoint(value: 60,  xAxisLabel: "Watches"   , description: "Watches"   , colour: ColourStyle(colour: .yellow)),
                BarChartDataPoint(value: 100, xAxisLabel: "Monitors"  , description: "Monitors"  , colour: ColourStyle(colour: .orange)),
                BarChartDataPoint(value: 600, xAxisLabel: "Headphones", description: "Headphones", colour: ColourStyle(colour: .red))
            ],
            legendTitle: "Data")
        
        let metadata   = ChartMetadata(title: "Units Sold", subtitle: "Last year")
        
        let gridStyle  = GridStyle(numberOfLines: 7,
                                   lineColour   : Color(.lightGray).opacity(0.25),
                                   lineWidth    : 1)
        
        let chartStyle = BarChartStyle(infoBoxPlacement   : .header,
                                       markerType         : .full(),
                                       xAxisGridStyle     : gridStyle,
                                       xAxisLabelPosition : .bottom,
                                       xAxisLabelsFrom    : .chartData(rotation: .degrees(0)),
                                       xAxisTitle         : "Units sold (x 1000)",
                                       yAxisGridStyle     : gridStyle,
                                       yAxisLabelPosition : .leading,
                                       yAxisNumberOfLabels: 5,
                                       yAxisTitle         : "Categories",
                                       baseline           : .zero,
                                       topLine            : .maximumValue)
        
        return HorizontalBarChartData(dataSets  : data,
                                      metadata  : metadata,
                                      barStyle  : BarStyle(barWidth: 0.5,
                                                           cornerRadius: CornerRadius(top: 50, bottom: 0),
                                                           colourFrom: .dataPoints,
                                                           colour: ColourStyle(colour: .blue)),
                                      chartStyle: chartStyle)
    }
}

struct HorizontalBarChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalBarChartDemoView()
    }
}
