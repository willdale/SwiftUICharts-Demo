//
//  GroupedBarChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 25/01/2021.
//

import SwiftUI
import SwiftUICharts

struct GroupedBarChartDemoView: View {
    
    let data = makeData()
    
    var body: some View {
        GroupedBarChart(chartData: data)
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
}

struct GroupedBarChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GroupedBarChartDemoView()
    }
}

extension GroupedBarChartDemoView {
    static func makeData() -> MultiBarChartData {
        
        let data = MultiBarDataSet(dataSets: [
            BarDataSet(dataPoints: [
                        BarChartDataPoint(value: 10, xAxisLabel: "1.1", pointLabel: "One One"  , colour: .blue),
                        BarChartDataPoint(value: 20, xAxisLabel: "1.2", pointLabel: "One Two"  , colour: .yellow),
                        BarChartDataPoint(value: 30, xAxisLabel: "1.3", pointLabel: "One Three", colour: .purple),
                        BarChartDataPoint(value: 40, xAxisLabel: "1.4", pointLabel: "One Four" , colour: .green)],
                       legendTitle: "One",
                       pointStyle: PointStyle(),
                       style: BarStyle(barWidth: 1.0, colourFrom: .dataPoints)),
            BarDataSet(dataPoints: [
                        BarChartDataPoint(value: 50, xAxisLabel: "2.1", pointLabel: "Two One"  , colour: .blue),
                        BarChartDataPoint(value: 10, xAxisLabel: "2.2", pointLabel: "Two Two"  , colour: .yellow),
                        BarChartDataPoint(value: 40, xAxisLabel: "2.3", pointLabel: "Two Three", colour: .purple),
                        BarChartDataPoint(value: 60, xAxisLabel: "2.3", pointLabel: "Two Three", colour: .green)],
                       legendTitle: "Two",
                       pointStyle: PointStyle(),
                       style: BarStyle(barWidth: 1.0, colourFrom: .dataPoints)),
            BarDataSet(dataPoints: [
                        BarChartDataPoint(value: 10, xAxisLabel: "3.1", pointLabel: "Three One"  , colour: .blue),
                        BarChartDataPoint(value: 50, xAxisLabel: "3.2", pointLabel: "Three Two"  , colour: .yellow),
                        BarChartDataPoint(value: 30, xAxisLabel: "3.3", pointLabel: "Three Three", colour: .purple),
                        BarChartDataPoint(value: 99, xAxisLabel: "3.4", pointLabel: "Three Four" , colour: .green)],
                       legendTitle: "Three",
                       pointStyle: PointStyle(),
                       style: BarStyle(barWidth: 1.0, colourFrom: .dataPoints)),
            BarDataSet(dataPoints: [
                        BarChartDataPoint(value: 80, xAxisLabel: "4.1", pointLabel: "Four One"  , colour: .blue),
                        BarChartDataPoint(value: 10, xAxisLabel: "4.2", pointLabel: "Four Two"  , colour: .yellow),
                        BarChartDataPoint(value: 20, xAxisLabel: "4.3", pointLabel: "Four Three", colour: .purple),
                        BarChartDataPoint(value: 50, xAxisLabel: "4.3", pointLabel: "Four Three", colour: .green)],
                       legendTitle: "Four",
                       pointStyle: PointStyle(),
                       style: BarStyle(barWidth: 1.0, colourFrom: .dataPoints))
            
        ])
        
        return MultiBarChartData(dataSets: data,
                                 metadata: ChartMetadata(title: "Hello", subtitle: "Bob"),
                                 xAxisLabels: ["Hello"],
                                 chartStyle: BarChartStyle(),
                                 calculations: .none)
    }
}
