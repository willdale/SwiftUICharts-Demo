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
            .touch(chartData: data)
//            .yAxisPOI(chartData: data,
//                      markerName: "Upper Limit",
//                      markerValue: 100,
//                      labelPosition: .center(specifier: "%.0f"),
//                      labelColour: Color.black,
//                      labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
//                      lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
//                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
//            .yAxisPOI(chartData: data,
//                      markerName: "Lower Limit",
//                      markerValue: 50,
//                      labelPosition: .center(specifier: "%.0f"),
//                      labelColour: Color.white,
//                      labelBackground: Color(red: 0.25, green: 0.75, blue: 1.0),
//                      lineColour: Color(red: 0.25, green: 0.75, blue: 1.0),
//                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
//            .averageLine(chartData: data,
//                         strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .xAxisGrid(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data, style: xAxisLabelStyle)
            .yAxisLabels(chartData: data)
            .infoDisplay(.verticle(chartData: data), style: .bordered)
            .titleBox(chartData: data,
                      title: HeaderBoxText(text: "Heart Rate"),
                      subtitle: HeaderBoxText(text: "Over 24 Hours"))
            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .id(data.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.horizontal)
            .navigationTitle("Week of Data")
    }
    
    var xAxisLabelStyle: XAxisLabelStyle {
        XAxisLabelStyle(rotation: .degrees(90))
    }
    
    static func weekOfData() -> RangedBarChartData {
        
        let data : RangedBarDataSet =
            RangedBarDataSet(dataPoints: [
                RangedBarDataPoint(lowerValue: 66, upperValue: 75 , xAxisLabel: "00:00 - 01:00", description: "00:00 - 01:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 90 , xAxisLabel: "01:00 - 02:00", description: "01:00 - 02:00"),
                RangedBarDataPoint(lowerValue: 55, upperValue: 79 , xAxisLabel: "02:00 - 03:00", description: "02:00 - 03:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 130, xAxisLabel: "03:00 - 04:00", description: "03:00 - 04:00"),
                RangedBarDataPoint(lowerValue: 70, upperValue: 84 , xAxisLabel: "04:00 - 05:00", description: "04:00 - 05:00"),
                RangedBarDataPoint(lowerValue: 63, upperValue: 119, xAxisLabel: "05:00 - 06:00", description: "05:00 - 06:00"),
                RangedBarDataPoint(lowerValue: 57, upperValue: 98 , xAxisLabel: "06:00 - 07:00", description: "06:00 - 07:00"),
                RangedBarDataPoint(lowerValue: 66, upperValue: 75 , xAxisLabel: "07:00 - 08:00", description: "07:00 - 08:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 90 , xAxisLabel: "08:00 - 09:00", description: "08:00 - 09:00"),
                RangedBarDataPoint(lowerValue: 55, upperValue: 79 , xAxisLabel: "09:00 - 10:00", description: "09:00 - 10:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 130, xAxisLabel: "10:00 - 11:00", description: "10:00 - 11:00"),
                RangedBarDataPoint(lowerValue: 70, upperValue: 84 , xAxisLabel: "11:00 - 12:00", description: "11:00 - 12:00"),
                RangedBarDataPoint(lowerValue: 63, upperValue: 119, xAxisLabel: "12:00 - 13:00", description: "12:00 - 13:00"),
                RangedBarDataPoint(lowerValue: 57, upperValue: 98 , xAxisLabel: "13:00 - 14:00", description: "13:00 - 14:00"),
                RangedBarDataPoint(lowerValue: 66, upperValue: 75 , xAxisLabel: "15:00 - 16:00", description: "15:00 - 16:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 90 , xAxisLabel: "16:00 - 17:00", description: "16:00 - 17:00"),
                RangedBarDataPoint(lowerValue: 55, upperValue: 79 , xAxisLabel: "17:00 - 18:00", description: "17:00 - 18:00"),
                RangedBarDataPoint(lowerValue: 55, upperValue: 79 , xAxisLabel: "18:00 - 19:00", description: "18:00 - 19:00"),
                RangedBarDataPoint(lowerValue: 63, upperValue: 119, xAxisLabel: "19:00 - 20:00", description: "19:00 - 20:00"),
                RangedBarDataPoint(lowerValue: 57, upperValue: 98 , xAxisLabel: "20:00 - 21:00", description: "20:00 - 21:00"),
                RangedBarDataPoint(lowerValue: 66, upperValue: 75 , xAxisLabel: "22:00 - 23:00", description: "22:00 - 23:00"),
                RangedBarDataPoint(lowerValue: 60, upperValue: 90 , xAxisLabel: "23:00 - 24:00", description: "23:00 - 24:00")
            ],
            legendTitle: "BPM")
        
        return RangedBarChartData(dataSets: data,
                                  xAxisLabels: ["00:00", "12:00", "00:00"],
                                  barStyle: BarStyle(barWidth: 0.75,
                                                     cornerRadius: CornerRadius(top: 10, bottom: 10),
                                                     colourFrom: .barStyle,
                                                     colour: .gradient(colours: [Color.init(red: 1, green: 0.25, blue: 0.25),
                                                                                 Color.init(red: 1, green: 0.5, blue: 0.5)],
                                                                       startPoint: .bottom, endPoint: .top)))
    }
}



struct RangedBarChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        RangedBarChartDemoView()
    }
}
