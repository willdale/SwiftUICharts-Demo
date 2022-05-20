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

    let data: BarChartData = weekOfData()

    var body: some View {
        BarChart(chartData: data)
            .disableAnimation(chartData: data, true)
            .extraLine(chartData: data,
                       legendTitle: "Test",
                       datapoints: extraLineData,
                       style: extraLineStyle)
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
            .xAxisPOI(chartData: data,
                      markerName: "Bob",
                      markerValue: 6,
                      dataPointCount: data.dataSets.dataPoints.count)
            .xAxisGrid(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data, colourIndicator: .custom(colour: ColourStyle(colour: .red), size: 12))
            .extraYAxisLabels(chartData: data, colourIndicator: .style(size: 12))
            .headerBox(chartData: data)
            .id(data.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.horizontal)
    }

    private var extraLineData: [ExtraLineDataPoint] {
        [
            ExtraLineDataPoint(value: 200),
            ExtraLineDataPoint(value: 90),
            ExtraLineDataPoint(value: 700),
            ExtraLineDataPoint(value: 175),
            ExtraLineDataPoint(value: 60),
            ExtraLineDataPoint(value: 100),
            ExtraLineDataPoint(value: 600)
        ]
    }

    private var extraLineStyle: ExtraLineStyle {
        ExtraLineStyle(lineColour: ColourStyle(colour: .blue),
                       lineType: .curvedLine,
                       lineSpacing: .bar,
                       yAxisTitle: "Bob",
                       yAxisNumberOfLabels: 7,
                       animationType: .raise,
                       baseline: .zero)
    }

    static func weekOfData() -> BarChartData {
        let data: BarDataSet =
            BarDataSet(dataPoints: [
                BarChartDataPoint(value: 200, xAxisLabel: "Laptops"   , description: "Laptops"   , colour: ColourStyle(colour: .purple)),
                BarChartDataPoint(value: 90 , xAxisLabel: "Desktops"  , description: "Desktops"  , colour: ColourStyle(colour: .blue)),
                BarChartDataPoint(value: 700, xAxisLabel: "Phones"    , description: "Phones"    , colour: ColourStyle(colour: .green)),
                BarChartDataPoint(value: 175, xAxisLabel: "Tablets"   , description: "Tablets"   , colour: ColourStyle(colour: .yellow)),
                BarChartDataPoint(value: 60 , xAxisLabel: "Watches"   , description: "Watches"   , colour: ColourStyle(colour: .yellow)),
                BarChartDataPoint(value: 100, xAxisLabel: "Monitors"  , description: "Monitors"  , colour: ColourStyle(colour: .orange)),
                BarChartDataPoint(value: 600, xAxisLabel: "Headphones", description: "Headphones", colour: ColourStyle(colour: .red))
            ],
            legendTitle: "Data")

        let metadata = ChartMetadata(title: "Units Sold", subtitle: "Last year")

        let gridStyle = GridStyle(numberOfLines: 7,
                                   lineColour: Color(.lightGray).opacity(0.25),
                                   lineWidth: 1)

        let chartStyle = BarChartStyle(infoBoxPlacement: .header,
                                       markerType: .bottomLeading(),
                                       xAxisGridStyle: gridStyle,
                                       xAxisLabelPosition: .bottom,
                                       xAxisLabelsFrom: .dataPoint(rotation: .degrees(-90)),
                                       xAxisTitle: "Categories",
                                       yAxisGridStyle: gridStyle,
                                       yAxisLabelPosition: .leading,
                                       yAxisNumberOfLabels: 5,
                                       yAxisTitle: "Units sold (x 1000)",
                                       baseline: .zero,
                                       topLine: .maximumValue)

        return BarChartData(dataSets: data,
                            metadata: metadata,
                            xAxisLabels: ["One", "Two", "Three"],
                            barStyle: BarStyle(barWidth: 0.5,
                                               cornerRadius: CornerRadius(top: 50, bottom: 0),
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
