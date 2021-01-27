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
            .averageLine(chartData: data, strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .yAxisPOI(chartData: data, markerName: "50", markerValue: 50, lineColour: Color(red: 0.25, green: 0.25, blue: 1.0), strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .xAxisGrid(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data)
            .headerBox(chartData: data)
            .legends(chartData: data)
            .frame(minWidth: 300, maxWidth: 900, minHeight: 300, idealHeight: 450, maxHeight: 600, alignment: .center)
            .padding(.all, 24)
            .background(
                ZStack {
                    DemoContainer()
                }
            )
            .padding(.horizontal)
    }
    
    static func weekOfData() -> BarChartData {
        
        let barStyleOne : BarStyle = BarStyle(barWidth: 0.5, cornerRadius: CornerRadius(top: 5, bottom: 0), colourFrom: .barStyle, colour: Color.blue)
        
//        let barStyleTwo : BarStyle = BarStyle(barWidth: 1.0, cornerRadius: CornerRadius(top: 5, bottom: 0), colourFrom: .barStyle, colour: Color.red)
        
        let data : BarDataSet =
            BarDataSet(dataPoints: [
                BarChartDataPoint(value: 20,  xAxisLabel: "M", pointLabel: "Monday"),
                BarChartDataPoint(value: 90,  xAxisLabel: "T", pointLabel: "Tuesday"),
                BarChartDataPoint(value: 100, xAxisLabel: "W", pointLabel: "Wednesday"),
                BarChartDataPoint(value: 75,  xAxisLabel: "T", pointLabel: "Thursday"),
                BarChartDataPoint(value: 160, xAxisLabel: "F", pointLabel: "Friday"),
                BarChartDataPoint(value: 110, xAxisLabel: "S", pointLabel: "Saturday"),
                BarChartDataPoint(value: 90,  xAxisLabel: "S", pointLabel: "Sunday")
            ],
            legendTitle: "Data",
            pointStyle: PointStyle(),
            style: barStyleOne)
//            ,
//            BarDataSet(dataPoints: [
//                BarChartDataPoint(value: 90,  xAxisLabel: "M", pointLabel: "Monday"),
//                BarChartDataPoint(value: 0,   xAxisLabel: "T", pointLabel: "Tuesday"),
//                BarChartDataPoint(value: 120, xAxisLabel: "W", pointLabel: "Wednesday"),
//                BarChartDataPoint(value: 85,  xAxisLabel: "T", pointLabel: "Thursday"),
//                BarChartDataPoint(value: 160, xAxisLabel: "F", pointLabel: "Friday"),
//                BarChartDataPoint(value: 10,  xAxisLabel: "S", pointLabel: "Saturday"),
//                BarChartDataPoint(value: 0,   xAxisLabel: "S", pointLabel: "Sunday")
//            ],
//            legendTitle: "Data",
//            pointStyle: PointStyle(),
//            style: barStyleTwo)
        
        let metadata   : ChartMetadata  = ChartMetadata(title       : "Test Data",
                                                        subtitle    : "A weeks worth")
        
        let labels      : [String]      = ["Mon", "Thu", "Sun"]

        let gridStyle   : GridStyle     = GridStyle(lineColour  : Color(.lightGray).opacity(0.25),
                                                    lineWidth   : 1)
        
        let chartStyle  : BarChartStyle = BarChartStyle(infoBoxPlacement: .floating,
                                                           xAxisGridStyle  : gridStyle,
                                                           yAxisGridStyle  : gridStyle,
                                                           xAxisLabelPosition: .bottom,
                                                           xAxisLabelsFrom: .dataPoint,
                                                           yAxisLabelPosition: .leading,
                                                           yAxisNumberOfLabels: 5)
        
        return BarChartData(dataSets: data,
                            metadata: metadata,
                            xAxisLabels: labels,
                            chartStyle: chartStyle,
                            calculations: .none)
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartDemoView()
    }
}
