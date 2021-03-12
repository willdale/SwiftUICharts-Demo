//
//  RangedBarChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 04/03/2021.
//

import SwiftUI
import SwiftUICharts

struct RangedBarChartDemoView: View {
    
    let data : RangedBarChartData = weekOfData()
    
    var body: some View {
        RangedBarChart(chartData: data)
            .touchOverlay(chartData: data, specifier: "%.0f", unit: .suffix(of: "BPM"))
            .yAxisPOI(chartData: data,
                      markerName: "Upper Limit",
                      markerValue: 100,
                      labelPosition: .center(specifier: "%.0f"),
                      labelColour: Color.black,
                      labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
                      lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .yAxisPOI(chartData: data,
                      markerName: "Lower Limit",
                      markerValue: 50,
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
//            .padding(.all, 24)
//            .background(
//                ZStack {
//                    DemoContainer()
//                }
//            )
//            .padding(.horizontal)
            .navigationTitle("Week of Data")
    }
    
    static func weekOfData() -> RangedBarChartData {
        
        let data : RangedBarDataSet =
            RangedBarDataSet(dataPoints: [
                
                RangedBarDataPoint(lowerValue: 66, upperValue: 75 , description: "00:00 - 01:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 90 , description: "01:00 - 02:00"),
                RangedBarDataPoint(lowerValue: 55, upperValue: 79 , description: "02:00 - 03:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 130, description: "03:00 - 04:00"),
                RangedBarDataPoint(lowerValue: 70, upperValue: 84 , description: "04:00 - 05:00"),
                RangedBarDataPoint(lowerValue: 63, upperValue: 119, description: "05:00 - 06:00"),
                RangedBarDataPoint(lowerValue: 57, upperValue: 98 , description: "06:00 - 07:00"),
                RangedBarDataPoint(lowerValue: 66, upperValue: 75 , description: "07:00 - 08:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 90 , description: "08:00 - 09:00"),
                RangedBarDataPoint(lowerValue: 55, upperValue: 79 , description: "09:00 - 10:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 130, description: "10:00 - 11:00"),
                RangedBarDataPoint(lowerValue: 70, upperValue: 84 , description: "11:00 - 12:00"),
                RangedBarDataPoint(lowerValue: 63, upperValue: 119, description: "12:00 - 13:00"),
                RangedBarDataPoint(lowerValue: 57, upperValue: 98 , description: "13:00 - 14:00"),
                RangedBarDataPoint(lowerValue: 66, upperValue: 75 , description: "15:00 - 16:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 90 , description: "16:00 - 17:00"),
                RangedBarDataPoint(lowerValue: 55, upperValue: 79 , description: "17:00 - 18:00"),
                RangedBarDataPoint(lowerValue: 55, upperValue: 79 , description: "18:00 - 19:00"),
                RangedBarDataPoint(lowerValue: 63, upperValue: 119, description: "19:00 - 20:00"),
                RangedBarDataPoint(lowerValue: 57, upperValue: 98 , description: "20:00 - 21:00"),
                RangedBarDataPoint(lowerValue: 66, upperValue: 75 , description: "22:00 - 23:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 90 , description: "23:00 - 24:00")
            ],
            legendTitle: "BPM")
                        
        let gridStyle  = GridStyle(numberOfLines: 11,
                                   lineColour  : Color(.lightGray).opacity(0.25),
                                   lineWidth   : 1)
        
        let chartStyle = BarChartStyle(infoBoxPlacement   : .infoBox(isStatic: false),
                                       xAxisGridStyle     : gridStyle,
                                       xAxisLabelPosition : .bottom,
                                       xAxisLabelsFrom    : .chartData,
                                       yAxisGridStyle     : gridStyle,
                                       yAxisLabelPosition : .leading,
                                       yAxisNumberOfLabels: 11,
                                       baseline: .minimumWithMaximum(of: 30),
                                       topLine: .maximum(of: 160))
        
        return RangedBarChartData(dataSets: data,
                                  metadata: ChartMetadata(title: "Heart Rate", subtitle: "Over 24 Hours"),
                                  xAxisLabels: ["00:00", "12:00", "00:00"],
                                  barStyle: BarStyle(barWidth: 0.75,
                                                     cornerRadius: CornerRadius(top: 10, bottom: 10),
                                                     colourFrom: .barStyle,
                                                     colour: ColourStyle(colours: [Color.init(red: 1, green: 0.25, blue: 0.25),
                                                                                       Color.init(red: 1, green: 0.5, blue: 0.5)],
                                                                             startPoint: .bottom, endPoint: .top)),
                                  chartStyle: chartStyle)
    }
}



struct RangedBarChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        RangedBarChartDemoView()
    }
}
