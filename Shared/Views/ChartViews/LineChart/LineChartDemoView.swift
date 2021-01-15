//
//  LineChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 13/01/2021.
//

import SwiftUI
import SwiftUICharts

struct LineChartDemoView: View {
    
    let data : ChartData = weekOfData()
    
    var body: some View {
        VStack {
            Spacer()
            LineChart()
                .touchOverlay()
                .pointMarkers()
                .averageLine()
                .yAxisPOI(markerName: "50", markerValue: 50, lineColour: Color(.systemRed))
                .xAxisGrid()
                .yAxisGrid()
                .xAxisLabels()
                .yAxisLabels()
                .headerBox()
                .legends()
                .environmentObject(data)
                .frame(width: 300, height: 400)
                .padding(.all, 24)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .shadow(color: Color(.systemGray3), radius: 12, x: 0, y: 0)
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .fill(Color(.systemBackground))
                    }
                )
                .padding(.horizontal)
            Button {
                if data.chartStyle.infoBoxPlacement == .floating {
                    data.chartStyle.infoBoxPlacement = .header
                } else if data.chartStyle.infoBoxPlacement == .header {
                    data.chartStyle.infoBoxPlacement = .floating
                }
            } label: {
                Text("Change Touch Overlay position")
                    .modifier(CustomButton())
            }
            Spacer()
            Button {
                withAnimation(Animation.linear(duration: 1)) {
                    if data.lineStyle.colourType == .gradientColour {
                        data.lineStyle.colourType = .colour
                        data.lineStyle.colour = Color(.systemBlue)
                    } else if data.lineStyle.colourType == .colour {
                        data.lineStyle.colourType = .gradientColour
                        data.lineStyle.colours = [Color(.systemBlue), Color(.systemRed)]
                    }
                }
            } label: {
                Text("Toggle Colour")
                    .modifier(CustomButton())
            }
            Spacer()
            Button {
                withAnimation(Animation.linear(duration: 1)) {
                    if data.chartStyle.xAxisGridStyle.numberOfLines == 10 {
                        data.chartStyle.xAxisGridStyle.numberOfLines = 3
                        data.chartStyle.yAxisGridStyle.numberOfLines = 6
                    } else {
                        data.chartStyle.xAxisGridStyle.numberOfLines = 10
                        data.chartStyle.yAxisGridStyle.numberOfLines = 10
                    }
                }
            } label: {
                Text("Toggle Grid")
                    .modifier(CustomButton())
            }
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
    
    static func weekOfData() -> ChartData {
        
        let data : [ChartDataPoint] = [
            ChartDataPoint(value: 20,  xAxisLabel: "M", pointLabel: "Monday"   , colour: Color(.systemRed)   ),
            ChartDataPoint(value: 90,  xAxisLabel: "T", pointLabel: "Tuesday"  , colour: Color(.systemBlue)  ),
            ChartDataPoint(value: 100, xAxisLabel: "W", pointLabel: "Wednesday", colour: Color(.systemGreen) ),
            ChartDataPoint(value: 75,  xAxisLabel: "T", pointLabel: "Thursday" , colour: Color(.systemOrange)),
            ChartDataPoint(value: 160, xAxisLabel: "F", pointLabel: "Friday"   , colour: Color(.systemTeal)  ),
            ChartDataPoint(value: 110, xAxisLabel: "S", pointLabel: "Saturday" , colour: Color(.systemPurple)),
            ChartDataPoint(value: 90,  xAxisLabel: "S", pointLabel: "Sunday"   , colour: Color(.systemYellow))
        ]
        
        let metadata   : ChartMetadata  = ChartMetadata(title       : "Test Data",
                                                        subtitle    : "A weeks worth",
                                                        lineLegend  : "Data")
        
        let labels      : [String]      = ["Mon", "Thu", "Sun"]
        
        let gridStyle   : GridStyle     = GridStyle(lineColour  : Color(.systemFill),
                                                    lineWidth   : 1,
                                                    dash        : [CGFloat](),
                                                    dashPhase   : 0)
        
        let chartStyle  : ChartStyle    = ChartStyle(infoBoxPlacement: .header,
                                                     xAxisGridStyle  : gridStyle,
                                                     yAxisGridStyle  : gridStyle,
                                                     xAxisLabels: XAxisLabelSetup(labelPosition: .bottom,
                                                                                  labelsFrom: .xAxisLabel),
                                                     yAxisLabels: YAxisLabelSetup(labelPosition: .leading,
                                                                                  numberOfLabels: 7))
        
        let lineStyle   : LineStyle     = LineStyle(colours: [Color(.systemBlue), Color(.systemRed)],
                                                    startPoint: .bottom,
                                                    endPoint: .top,
                                                    lineType: .curvedLine,
                                                    strokeStyle: StrokeStyle(lineWidth: 3,
                                                                             lineCap: .round,
                                                                             lineJoin: .round))
        
        let pointStyle : PointStyle     = PointStyle(pointSize: 9, borderColour: Color.primary, lineWidth: 2, pointType: .outline, pointShape: .circle)
        
        return ChartData(dataPoints     : data,
                         metadata       : metadata,
                         xAxisLabels: labels,
                         chartStyle     : chartStyle,
                         lineStyle      : lineStyle,
                         pointStyle     : pointStyle
        )
    }
    
}
