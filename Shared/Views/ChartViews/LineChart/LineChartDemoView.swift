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
                .averageLine(strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                .yAxisPOI(markerName: "50", markerValue: 50, lineColour: Color(red: 0.25, green: 0.25, blue: 1.0), strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                .xAxisGrid()
                .yAxisGrid()
                .xAxisLabels()
                .yAxisLabels()
                .headerBox()
                .legends()
                .environmentObject(data)
                .frame(minWidth: 300, maxWidth: 900, minHeight: 300, idealHeight: 400, maxHeight: 500, alignment: .center)
                .padding(.all, 24)
                .background(
                    ZStack {
                        DemoContainer()
                    }
                )
                .padding(.horizontal)
            Spacer()
            #if os(iOS)
            VStack {
                buttonOne
                buttonTwo
                buttonThree
            }
            #elseif os(macOS)
            HStack {
                buttonOne
                buttonTwo
                buttonThree
            }
            #elseif os(tvOS)
            HStack {
                buttonOne
                buttonTwo
                buttonThree
            }
            #endif
            Spacer()
        }
        .navigationTitle("Week of Data")
    }
    
    var buttonOne: some View {
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
    }
    var buttonTwo: some View {
        Button {
            withAnimation(Animation.linear(duration: 1)) {
                if data.lineStyle.colourType == .gradientColour {
                    data.lineStyle.colourType = .colour
                    data.lineStyle.colour = Color(red: 0.15, green: 0.15, blue: 1.0)
                } else if data.lineStyle.colourType == .colour {
                    data.lineStyle.colourType = .gradientColour
                    data.lineStyle.colours = [Color(red: 1.0, green: 0.15, blue: 0.15), Color(red: 1.0, green: 0.35, blue: 0.35)]
                }
            }
        } label: {
            Text("Toggle Colour")
                .modifier(CustomButton())
        }
    }
    var buttonThree: some View {
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
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartDemoView()
            .preferredColorScheme(.dark)
    }
}

extension LineChartDemoView {
    
    static func weekOfData() -> ChartData {
        
        let data : [ChartDataPoint] = [
            ChartDataPoint(value: 20,  xAxisLabel: "M", pointLabel: "Monday"),
            ChartDataPoint(value: 90,  xAxisLabel: "T", pointLabel: "Tuesday"),
            ChartDataPoint(value: 100, xAxisLabel: "W", pointLabel: "Wednesday"),
            ChartDataPoint(value: 75,  xAxisLabel: "T", pointLabel: "Thursday"),
            ChartDataPoint(value: 160, xAxisLabel: "F", pointLabel: "Friday"),
            ChartDataPoint(value: 110, xAxisLabel: "S", pointLabel: "Saturday"),
            ChartDataPoint(value: 90,  xAxisLabel: "S", pointLabel: "Sunday")
        ]
        
        let metadata   : ChartMetadata  = ChartMetadata(title       : "Test Data",
                                                        subtitle    : "A weeks worth",
                                                        lineLegend  : "Data")
        
        let labels      : [String]      = ["Mon", "Thu", "Sun"]

        let gridStyle   : GridStyle     = GridStyle(lineColour  : Color(.lightGray).opacity(0.25),
                                                    lineWidth   : 1,
                                                    dash: [CGFloat]())
        
        let chartStyle  : ChartStyle    = ChartStyle(infoBoxPlacement: .header,
                                                     xAxisGridStyle  : gridStyle,
                                                     yAxisGridStyle  : gridStyle,
                                                     xAxisLabels     : XAxisLabelSetup(labelPosition : .bottom,
                                                                                       labelsFrom    : .xAxisLabel),
                                                     yAxisLabels     : YAxisLabelSetup(labelPosition : .leading,
                                                                                  numberOfLabels: 7))
        
        let lineStyle   : LineStyle     = LineStyle(colours     : [Color(red: 1.0, green: 0.15, blue: 0.15), Color(red: 1.0, green: 0.35, blue: 0.35)],
                                                    startPoint  : .leading,
                                                    endPoint    : .trailing,
                                                    lineType    : .curvedLine,
                                                    strokeStyle : StrokeStyle(lineWidth: 3,
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

struct DemoContainer: View {
    
    var body: some View {
        #if os(iOS)
        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .shadow(color: Color(.gray), radius: 12, x: 0, y: 0)
        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .fill(Color(.systemBackground))
        #elseif os(macOS)
        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .shadow(color: Color(.lightGray), radius: 12, x: 0, y: 0)
        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
            .fill(Color(.windowBackgroundColor))
        #elseif os(tvOS)
//        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
//            .shadow(color: Color(.gray), radius: 12, x: 0, y: 0)
//        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
//            .fill(Color(.clear))
        #endif
    }
}
