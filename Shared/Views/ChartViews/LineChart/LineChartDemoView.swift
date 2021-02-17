//
//  LineChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 23/01/2021.
//

import SwiftUI
import SwiftUICharts

struct LineChartDemoView: View {
    
    let data : LineChartData = weekOfData()
        
    var body: some View {
        VStack {
            LineChart(chartData: data)
                .pointMarkers(chartData: data)
                .touchOverlay(chartData: data, specifier: "%.0f")
                .yAxisPOI(chartData: data,
                          markerName: "Other thing",
                          markerValue: 185,
                          labelPosition: .center(specifier: "%.0f"),
                          labelColour: Color.black,
                          labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
                          lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
                          strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                .yAxisPOI(chartData: data,
                          markerName: "Something",
                          markerValue: 110,
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
                .infoBox(chartData: data)
                .headerBox(chartData: data)
                .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
                .frame(minWidth: 300, maxWidth: 900, minHeight: 300, idealHeight: 450, maxHeight: 600, alignment: .center)
                .padding(.all, 24)
                .background(
                    ZStack {
                        DemoContainer()
                    }
                )
                .padding(.horizontal)
        }
        .navigationTitle("Week of Data")
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartDemoView()
    }
}

extension LineChartDemoView {
    
    static func weekOfData() -> LineChartData {
        
        let data = LineDataSet(dataPoints: [
            LineChartDataPoint(value: 120, xAxisLabel: "M", pointLabel: "Monday"),
            LineChartDataPoint(value: 190, xAxisLabel: "T", pointLabel: "Tuesday"),
            LineChartDataPoint(value: 100, xAxisLabel: "W", pointLabel: "Wednesday"),
            LineChartDataPoint(value: 175, xAxisLabel: "T", pointLabel: "Thursday"),
            LineChartDataPoint(value: 160, xAxisLabel: "F", pointLabel: "Friday"),
            LineChartDataPoint(value: 110, xAxisLabel: "S", pointLabel: "Saturday"),
            LineChartDataPoint(value: 190, xAxisLabel: "S", pointLabel: "Sunday")
        ],
        legendTitle: "Test One",
        pointStyle: PointStyle(),
        style: LineStyle(colour: Color.red, lineType: .curvedLine))
        
        let metadata    = ChartMetadata(title: "Some Data", subtitle: "A Week")
        
        let labels      = ["Monday", "Thursday", "Sunday"]
        
        let gridStyle   = GridStyle(numberOfLines: 7,
                                    lineColour   : Color(.lightGray),
                                    lineWidth    : 1,
                                    dash         : [8],
                                    dashPhase    : 0)
        
        let chartStyle = LineChartStyle(infoBoxPlacement    : .floating,
                                        
                                        xAxisGridStyle      : gridStyle,
                                        xAxisLabelPosition  : .bottom,
                                        xAxisLabelColour    : Color.primary,
                                        xAxisLabelsFrom     : .chartData,
                                       
                                        yAxisGridStyle      : gridStyle,
                                        yAxisLabelPosition  : .leading,
                                        yAxisLabelColour    : Color.primary,
                                        yAxisNumberOfLabels : 7,
                                        
                                        baseline            : .minimumWithMaximum(of: 80),
                                        globalAnimation     : .easeOut(duration: 1))
        
        return LineChartData(dataSets       : data,
                             metadata       : metadata,
                             xAxisLabels    : labels,
                             chartStyle     : chartStyle)
        
    }
}
