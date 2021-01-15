//
//  LineChartYearAveragedDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 13/01/2021.
//

import SwiftUI
import SwiftUICharts

struct LineChartMonthlyAveragedDemoView: View {
    
    var data : ChartData = yearOfDataMonthlyAverage()
    
    @State private var pointSize: Double = 0.5
    
    var body: some View {
        VStack {
            LineChart()
                .touchOverlay(specifier: "%.2f")
                .pointMarkers()
                .yAxisPOI(markerName: "0", markerValue: 0, lineColour: Color.primary)
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
                        #if !os(macOS)
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .shadow(color: Color(.systemGray3), radius: 12, x: 0, y: 0)
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .fill(Color(.systemBackground))
                        #elseif os(macOS)
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .shadow(color: Color(.lightGray), radius: 12, x: 0, y: 0)
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .fill(Color(.windowBackgroundColor))
                        #endif
                    }
                )
                .padding()
            
            Button {
                withAnimation(Animation.linear(duration: 1)) {
                    if data.pointStyle.pointType == .outline {
                        data.pointStyle.pointType = .filledOutLine
                    } else if data.pointStyle.pointType == .filledOutLine {
                        data.pointStyle.pointType = .filled
                    } else if data.pointStyle.pointType == .filled {
                        data.pointStyle.pointType = .outline
                    }
                }
            } label: {
                Text("Toggle Point Style")
                    .modifier(CustomButton())
            }
            Button {
                if data.pointStyle.pointShape == .circle {
                    data.pointStyle.pointShape = .roundSquare
                } else if data.pointStyle.pointShape == .roundSquare {
                    data.pointStyle.pointShape = .square
                } else if data.pointStyle.pointShape == .square {
                    data.pointStyle.pointShape = .circle
                }
            } label: {
                Text("Toggle Point Shape")
                    .modifier(CustomButton())
            }
            Spacer()
            Text("Change point Size")
            Slider(value: $pointSize) {
                Text("Point Size")
            }.padding(.horizontal)
            .onChange(of: pointSize) { (value) in
                data.pointStyle.pointSize = CGFloat(value * 20)
            }
            
        }
        .navigationTitle("Monthly Average")
    }
}

struct LineChartMonthlyAveragedDemoView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartMonthlyAveragedDemoView()
    }
}



extension LineChartMonthlyAveragedDemoView {
    static func yearOfDataMonthlyAverage() -> ChartData {
        
        var data : [ChartDataPoint] = []
        
        let calendar = Calendar.current
        
        let date = Date()
        
        for index in 1...365 {
            let value: Double = Double(Int.random(in: -100...100))
            let date = calendar.date(byAdding: .day, value: index, to: date)
            data.append(ChartDataPoint(value: value, date: date))
        }
        
        let metadata   : ChartMetadata  = ChartMetadata(title       : "Test Data",
                                                        subtitle    : "A years worth - Monthly Average",
                                                        lineLegend  : "Data")
        
        let labels      : [String]      = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        #if !os(macOS)
        let gridColour = Color(.systemFill)
        #elseif os(macOS)
        let gridColour = Color(.gridColor)
        #endif
        
        let gridStyle   : GridStyle     = GridStyle(lineColour  : gridColour,
                                                    lineWidth   : 1,
                                                    dash        : [CGFloat](),
                                                    dashPhase   : 0)
        
        let chartStyle  : ChartStyle    = ChartStyle(infoBoxPlacement: .header,
                                                     xAxisGridStyle  : gridStyle,
                                                     yAxisGridStyle  : gridStyle)
        
        let lineStyle   : LineStyle     = LineStyle(colours: [Color(.systemBlue), Color(.systemRed)],
                                                    startPoint: .bottom,
                                                    endPoint: .top,
                                                    lineType: .curvedLine,
                                                    strokeStyle: StrokeStyle(lineWidth: 3,
                                                                             lineCap: .round,
                                                                             lineJoin: .round))
        
        let pointStyle : PointStyle     = PointStyle(pointSize: 9,
                                                     borderColour: Color.primary,
                                                     fillColour: Color(.systemRed),
                                                     lineWidth: 2,
                                                     pointType: .outline,
                                                     pointShape: .circle)
        
        return ChartData(dataPoints     : data,
                         metadata       : metadata,
                         xAxisLabels    : labels,
                         chartStyle     : chartStyle,
                         lineStyle      : lineStyle,
                         pointStyle     : pointStyle,
                         calculations   : .averageMonth)
    }
}
