//
//  RangedLineChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 01/03/2021.
//

import SwiftUI
import SwiftUICharts

struct RangedLineChartDemoView: View {
    let data : RangedLineChartData = weekOfData()
        
    var body: some View {
        VStack {
            RangedLineChart(chartData: data)
                .pointMarkers(chartData: data)
                .touchOverlay(chartData: data, specifier: "%.0f")
                .yAxisPOI(chartData: data,
                          markerName: "Step Count Aim",
                          markerValue: 10,
                          labelPosition: .center(specifier: "%.0f"),
                          labelColour: Color.black,
                          labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
                          lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
                          strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                .yAxisPOI(chartData: data,
                          markerName: "Minimum Recommended",
                          markerValue: 40,
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
                .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 250, maxHeight: 600, alignment: .center)
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


extension RangedLineChartDemoView {
    
    static func weekOfData() -> RangedLineChartData {

        let data = RangedLineDataSet(dataPoints: [
            RangedLineChartDataPoint(value: 10, upperValue: 20, lowerValue: 0 , xAxisLabel: "M", pointLabel: "Monday"),
            RangedLineChartDataPoint(value: 25, upperValue: 35, lowerValue: 15, xAxisLabel: "T", pointLabel: "Tuesday"),
            RangedLineChartDataPoint(value: 13, upperValue: 23, lowerValue: 3 , xAxisLabel: "W", pointLabel: "Wednesday"),
            RangedLineChartDataPoint(value: 24, upperValue: 34, lowerValue: 14, xAxisLabel: "T", pointLabel: "Thursday"),
            RangedLineChartDataPoint(value: 36, upperValue: 46, lowerValue: 26, xAxisLabel: "F", pointLabel: "Friday"),
            RangedLineChartDataPoint(value: 14, upperValue: 24, lowerValue: 4 , xAxisLabel: "S", pointLabel: "Saturday"),
            RangedLineChartDataPoint(value: 20, upperValue: 30, lowerValue: 10, xAxisLabel: "S", pointLabel: "Sunday")
        ],
        legendTitle: "Steps",
        pointStyle: PointStyle(),
        style: RangedLineStyle(lineColour: ColourStyle(colour: .red),
                               fillColour: ColourStyle(colour: Color(.blue).opacity(0.25)),
                               lineType: .curvedLine))
        
        let metadata    = ChartMetadata(title: "Step Count", subtitle: "Over a Week")
                
        let gridStyle   = GridStyle(numberOfLines: 7,
                                    lineColour   : Color(.lightGray).opacity(0.5),
                                    lineWidth    : 1,
                                    dash         : [8],
                                    dashPhase    : 0)
        
        let chartStyle = LineChartStyle(infoBoxPlacement    : .floating,
                                        
                                        markerType          : .vertical(attachment: .line(dot: .style(DotStyle()))),
                                        
                                        xAxisGridStyle      : gridStyle,
                                        xAxisLabelPosition  : .bottom,
                                        xAxisLabelColour    : Color.primary,
                                        xAxisLabelsFrom     : .dataPoint,
                                       
                                        yAxisGridStyle      : gridStyle,
                                        yAxisLabelPosition  : .leading,
                                        yAxisLabelColour    : Color.primary,
                                        yAxisNumberOfLabels : 7,
                                        
                                        globalAnimation     : .easeOut(duration: 1))
        
        return RangedLineChartData(dataSets       : data,
                             metadata       : metadata,
                             chartStyle     : chartStyle)
        
    }
    
}

struct RangedLineChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        RangedLineChartDemoView()
    }
}
