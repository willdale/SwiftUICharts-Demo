//
//  SplitLegendAndInfoDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 15/03/2021.
//

import SwiftUI
import SwiftUICharts

struct SplitLegendAndInfoDemoView: View {
    
    let data : LineChartData = weekOfData()
    
    var body: some View {
        VStack {
            infoView
            chart
            legends
        }
        .navigationTitle("Step Count")
    }
    
    var infoView: some View {
        HStack {
            InfoValue(chartData: data)
            InfoExtra(chartData: data, text: "steps on")
            InfoDescription(chartData: data)
        }
    }
    
    var chart: some View {
        LineChart(chartData: data)
            .pointMarkers(chartData: data)
            .touchOverlay(chartData: data, specifier: "%.0f")
            .yAxisPOI(chartData: data,
                      markerName: "Step Count Aim",
                      markerValue: 15_000,
                      labelPosition: .center(specifier: "%.0f"),
                      labelColour: Color.black,
                      labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
                      lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .yAxisPOI(chartData: data,
                      markerName: "Minimum Recommended",
                      markerValue: 10_000,
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
            .id(data.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 350, maxHeight: 400, alignment: .center)
            .padding(.horizontal)
    }
    
    var legends: some View {
        VStack(alignment: .leading) {
            ForEach(data.legends, id: \.id) { legend in
                legend.getLegend(textColor: .primary)
            }
        }
    }
    
    
    static func weekOfData() -> LineChartData {
        let data = LineDataSet(dataPoints: [
            LineChartDataPoint(value: 12000, xAxisLabel: "M", description: "Monday"),
            LineChartDataPoint(value: 10000, xAxisLabel: "T", description: "Tuesday"),
            LineChartDataPoint(value: 8000,  xAxisLabel: "W", description: "Wednesday"),
            LineChartDataPoint(value: 17500, xAxisLabel: "T", description: "Thursday"),
            LineChartDataPoint(value: 16000, xAxisLabel: "F", description: "Friday"),
            LineChartDataPoint(value: 11000, xAxisLabel: "S", description: "Saturday"),
            LineChartDataPoint(value: 9000,  xAxisLabel: "S", description: "Sunday")
        ],
        legendTitle: "Steps",
        pointStyle: PointStyle(),
        style: LineStyle(lineColour: ColourStyle(colour: .red), lineType: .curvedLine))
        
        let gridStyle  = GridStyle(numberOfLines: 7,
                                   lineColour   : Color(.lightGray).opacity(0.5),
                                   lineWidth    : 1,
                                   dash         : [8],
                                   dashPhase    : 0)
        
        let chartStyle = LineChartStyle(infoBoxPlacement    : .infoBox(isStatic: false),
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
                                        yAxisNumberOfLabels : 7,
                                        
                                        baseline            : .minimumWithMaximum(of: 5000),
                                        topLine             : .maximum(of: 20000),
                                        
                                        globalAnimation     : .easeOut(duration: 1))
        
        return LineChartData(dataSets       : data,
                             metadata       : ChartMetadata(title: "Step Count", subtitle: "Over a Week"),
                             chartStyle     : chartStyle)
        
    }
}

struct SplitLegendAndInfoDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SplitLegendAndInfoDemoView()
    }
}
