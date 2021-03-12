//
//  BarDemoChart.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 13/01/2021.
//
//
import SwiftUI
import SwiftUICharts

struct BarChartDemoView: View {
    
    let data : BarChartData = weekOfData()
    
    var body: some View {
        BarChart(chartData: data)
            .touchOverlay(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data)
            .headerBox(chartData: data)
//            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 250, maxHeight: 400, alignment: .center)
//            .padding(.all, 24)
//            .background(
//                ZStack {
//                    DemoContainer()
//                }
//            )
            .padding(.horizontal)
    }
    
    static func weekOfData() -> BarChartData {
                
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
                                       markerType         : .bottomLeading,
                                       xAxisGridStyle     : gridStyle,
                                       xAxisLabelPosition : .bottom,
                                       xAxisLabelsFrom    : .dataPoint(rotation: .degrees(-90)),
                                       xAxisTitle         : "Categories",
                                       yAxisGridStyle     : gridStyle,
                                       yAxisLabelPosition : .leading,
                                       yAxisNumberOfLabels: 5,
                                       yAxisTitle         : "Units sold (x 1000)",
                                       baseline           : .zero,
                                       topLine            : .maximumValue)
        
        return BarChartData(dataSets  : data,
                            metadata  : metadata,
                            barStyle  : BarStyle(barWidth: 0.5,
                                            colourFrom: .dataPoints,
                                            colour: ColourStyle(colour: .blue)),
                            chartStyle: chartStyle)
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartDemoView()
    }
}
