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
            .touchOverlay(chartData: data, specifier: "%.0f")
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
            .padding(.all, 24)
            .background(
                ZStack {
                    DemoContainer()
                }
            )
            .padding(.horizontal)
            .navigationTitle("Week of Data")
    }
    
    static func weekOfData() -> RangedBarChartData {
        
        let data : RangedBarDataSet =
            RangedBarDataSet(dataPoints: [
                
                RangedBarDataPoint(lowerValue: 66, upperValue: 75 , pointLabel: "00:00 - 01:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 90 , pointLabel: "01:00 - 02:00"),
                RangedBarDataPoint(lowerValue: 55, upperValue: 79 , pointLabel: "02:00 - 03:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 130, pointLabel: "03:00 - 04:00"),
                RangedBarDataPoint(lowerValue: 70, upperValue: 84 , pointLabel: "04:00 - 05:00"),
                RangedBarDataPoint(lowerValue: 63, upperValue: 119, pointLabel: "05:00 - 06:00"),
                RangedBarDataPoint(lowerValue: 57, upperValue: 98 , pointLabel: "06:00 - 07:00"),
                RangedBarDataPoint(lowerValue: 66, upperValue: 75 , pointLabel: "07:00 - 08:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 90 , pointLabel: "08:00 - 09:00"),
                RangedBarDataPoint(lowerValue: 55, upperValue: 79 , pointLabel: "09:00 - 10:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 130, pointLabel: "10:00 - 11:00"),
                RangedBarDataPoint(lowerValue: 70, upperValue: 84 , pointLabel: "11:00 - 12:00"),
                RangedBarDataPoint(lowerValue: 63, upperValue: 119, pointLabel: "12:00 - 13:00"),
                RangedBarDataPoint(lowerValue: 57, upperValue: 98 , pointLabel: "13:00 - 14:00"),
                RangedBarDataPoint(lowerValue: 66, upperValue: 75 , pointLabel: "15:00 - 16:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 90 , pointLabel: "16:00 - 17:00"),
                RangedBarDataPoint(lowerValue: 55, upperValue: 79 , pointLabel: "17:00 - 18:00"),
                RangedBarDataPoint(lowerValue: 55, upperValue: 79 , pointLabel: "18:00 - 19:00"),
                RangedBarDataPoint(lowerValue: 63, upperValue: 119, pointLabel: "19:00 - 20:00"),
                RangedBarDataPoint(lowerValue: 57, upperValue: 98 , pointLabel: "20:00 - 21:00"),
                RangedBarDataPoint(lowerValue: 66, upperValue: 75 , pointLabel: "22:00 - 23:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 90 , pointLabel: "23:00 - 24:00")
            ],
            legendTitle: "Data")
                        
        let gridStyle  = GridStyle(numberOfLines: 11,
                                   lineColour  : Color(.lightGray).opacity(0.25),
                                   lineWidth   : 1)
        
        let chartStyle = BarChartStyle(infoBoxPlacement   : .header,
                                       xAxisGridStyle     : gridStyle,
                                       xAxisLabelPosition : .bottom,
                                       xAxisLabelsFrom    : .chartData,
                                       yAxisGridStyle     : gridStyle,
                                       yAxisLabelPosition : .leading,
                                       yAxisNumberOfLabels: 11,
                                       baseline: .minimumWithMaximum(of: 30),
                                       topLine: .maximum(of: 160))
        
        return RangedBarChartData(dataSets: data,
                                  metadata: ChartMetadata(title: "Test Data", subtitle: "A weeks worth"),
                                  xAxisLabels: ["00:00", "12:00", "00:00"],
                                  barStyle: BarStyle(barWidth: 0.75,
                                                     cornerRadius: CornerRadius(top: 10, bottom: 10),
                                                     colourFrom: .barStyle,
                                                     fillColour: ColourStyle(colours: [Color.init(red: 1, green: 0.25, blue: 0.25),
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
