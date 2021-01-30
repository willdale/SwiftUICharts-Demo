//
//  TabViewView.swift
//  SwiftUICharts Demo (iOS)
//
//  Created by Will Dale on 30/01/2021.
//

import SwiftUI
import SwiftUICharts

struct TabViewView: View {
    
    let dataOne = weekOfDataOne()
    let dataTwo = weekOfDataTwo()
    
    var body: some View {
        TabView {
            LineChart()
                .xAxisGrid()
                .yAxisGrid()
                .xAxisLabels()
                .yAxisLabels()
                .environmentObject(dataOne)
                .frame(height: 200, alignment: .center)
                .padding()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            BarChart()
                .xAxisGrid()
                .yAxisGrid()
                .xAxisLabels()
                .yAxisLabels()
                .environmentObject(dataTwo)
                .frame(height: 200, alignment: .center)
                .padding()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Second")
                }
        }
    }
    static func weekOfDataOne() -> ChartData {
        
        let data : [ChartDataPoint] = [
            ChartDataPoint(value: 20, xAxisLabel: "Jun 18"),
            ChartDataPoint(value: 90),
            ChartDataPoint(value: 100),
            ChartDataPoint(value: 75),
            ChartDataPoint(value: 160),
            ChartDataPoint(value: 110),
            ChartDataPoint(value: 90, xAxisLabel: "Sep 20")
        ]
        
        let gridStyle = GridStyle(numberOfLines : 6,
                                  lineColour    : Color(.lightGray).opacity(0.25),
                                  dash          : [4])
        
        let chartStyle = ChartStyle(xAxisGridStyle      : gridStyle,
                                    yAxisGridStyle      : gridStyle,
                                    yAxisNumberOfLabels : 1)
        
        let lineStyle = LineStyle(colour      : .red,
                                  lineType    : .line,
                                  strokeStyle : StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
        
        return ChartData(dataPoints : data,
                         chartStyle : chartStyle,
                         lineStyle  : lineStyle)
    }
    static func weekOfDataTwo() -> ChartData {
        
        let data : [ChartDataPoint] = [
            ChartDataPoint(value: 20, xAxisLabel: "Jun 18"),
            ChartDataPoint(value: 90),
            ChartDataPoint(value: 100),
            ChartDataPoint(value: 75),
            ChartDataPoint(value: 160),
            ChartDataPoint(value: 110),
            ChartDataPoint(value: 90, xAxisLabel: "Sep 20")
        ]
        
        let gridStyle = GridStyle(numberOfLines : 6,
                                  lineColour    : Color(.lightGray).opacity(0.25),
                                  dash          : [4])
        
        let chartStyle = ChartStyle(xAxisGridStyle      : gridStyle,
                                    yAxisGridStyle      : gridStyle,
                                    yAxisNumberOfLabels : 1)
        
        let lineStyle = LineStyle(colour      : .red,
                                  lineType    : .line,
                                  strokeStyle : StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
        
        return ChartData(dataPoints : data,
                         chartStyle : chartStyle,
                         lineStyle  : lineStyle)
    }
}

struct TabViewView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewView()
    }
}
