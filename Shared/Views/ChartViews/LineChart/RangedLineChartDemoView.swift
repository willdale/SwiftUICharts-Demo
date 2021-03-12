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
                .touchOverlay(chartData: data, specifier: "%.0f", unit: .prefix(of: "$"))
                .averageLine(chartData: data,
                             labelPosition: .center(specifier: "%.0f"),
                             strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                .xAxisGrid(chartData: data)
                .yAxisGrid(chartData: data)
                .xAxisLabels(chartData: data)
                .yAxisLabels(chartData: data)
                .infoBox(chartData: data)
                .headerBox(chartData: data)
                .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
                .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 250, maxHeight: 400, alignment: .center)
                .padding(.all, 24)
//                .background(
//                    ZStack {
//                        DemoContainer()
//                    }
//                )
                .padding(.horizontal)
        }
        .navigationTitle("Week of Data")
    }
}


extension RangedLineChartDemoView {
    
    static func weekOfData() -> RangedLineChartData {

        let data = RangedLineDataSet(dataPoints: [
            RangedLineChartDataPoint(value: 11_0000, upperValue: 12_0000, lowerValue: 10_0000, xAxisLabel: "16", description: "2016"),
            RangedLineChartDataPoint(value: 13_5000, upperValue: 13_5000, lowerValue: 11_5000, xAxisLabel: "17", description: "2017"),
            RangedLineChartDataPoint(value: 11_0000, upperValue: 12_3000, lowerValue: 10_3000, xAxisLabel: "18", description: "2018"),
            RangedLineChartDataPoint(value: 12_4000, upperValue: 13_4000, lowerValue: 11_4000, xAxisLabel: "19", description: "2019"),
            RangedLineChartDataPoint(value: 12_8000, upperValue: 14_6000, lowerValue: 12_6000, xAxisLabel: "20", description: "2020")
        ],
        legendTitle: "Profits",
        legendFillTitle: "Expected",
        pointStyle: PointStyle(),
        style: RangedLineStyle(lineColour: ColourStyle(colour: .red),
                               fillColour: ColourStyle(colour: Color(.blue).opacity(0.25)),
                               lineType: .curvedLine))
        
        let metadata    = ChartMetadata(title: "Profits", subtitle: "with Expected")
                
        let gridStyle   = GridStyle(numberOfLines: 7,
                                    lineColour   : Color(.lightGray).opacity(0.5),
                                    lineWidth    : 1,
                                    dash         : [8],
                                    dashPhase    : 0)
        
        let chartStyle = LineChartStyle(infoBoxPlacement    : .fixed,
                                        
                                        markerType          : .vertical(attachment: .line(dot: .style(DotStyle()))),
                                        
                                        xAxisGridStyle      : gridStyle,
                                        xAxisLabelPosition  : .bottom,
                                        xAxisLabelColour    : Color.primary,
                                        xAxisLabelsFrom     : .dataPoint(rotation: .degrees(0)),
                                       
                                        yAxisGridStyle      : gridStyle,
                                        yAxisLabelPosition  : .leading,
                                        yAxisLabelColour    : Color.primary,
                                        yAxisNumberOfLabels : 7,
                                        
                                        baseline: .minimumValue,
                                        topLine: .maximumValue,
        
                                        
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
