//
//  LineChartWideDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 13/01/2021.
//

import SwiftUI
import SwiftUICharts

struct LineChartWideDemoView: View {
    
    let data : ChartData = yearOfData()
    
    @State private var pointSize: Double = 0.5
    
    var body: some View {
        
        VStack {
            ScrollView(.horizontal) {
                LineChart()
                    .pointMarkers()
                    .yAxisPOI(markerName: "0", markerValue: 0, lineColour: Color.primary)
                    .xAxisGrid()
                    .yAxisGrid()
                    .xAxisLabels()
                    .yAxisLabels()
                    .headerBox()
                    .legends()
                    .environmentObject(data)
                    .frame(width: 3650, height: 400)
                    .padding(.all, 24)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                                .shadow(color: Color(.systemGray3), radius: 12, x: 0, y: 0)
                            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                                .fill(Color(.systemBackground))
                        }
                    )
                    .padding()
            }
            Button {
                withAnimation(Animation.linear(duration: 1)) {
                    if data.pointStyle.borderColour == Color.primary {
                        data.pointStyle.borderColour = Color(.systemTeal)
                    } else if data.pointStyle.borderColour == Color(.systemTeal) {
                        data.pointStyle.borderColour = Color.primary
                    }
                }
            } label: {
                Text("Toggle Point Colour")
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
        .navigationTitle("Year of Data")
    }
}

struct LineChartWideView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartWideDemoView()
    }
}

extension LineChartWideDemoView {
    static func yearOfData() -> ChartData {
        
        var data : [ChartDataPoint] = []
        
        for _ in 1...365 {
            let value: Double = Double(Int.random(in: -100...100))
            data.append(ChartDataPoint(value: value))
        }
        
        let metadata   : ChartMetadata  = ChartMetadata(title       : "Test Data",
                                                        subtitle    : "A years worth",
                                                        lineLegend  : "Data")
        
        let labels      : [String]      = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        let xGridStyle   : GridStyle     = GridStyle(numberOfLines: 11,
                                                    lineColour  : Color(.systemFill),
                                                    lineWidth   : 1)
        
        let yGridStyle   : GridStyle     = GridStyle(numberOfLines: 3,
                                                    lineColour  : Color(.systemFill),
                                                    lineWidth   : 1)
        
        let chartStyle  : ChartStyle    = ChartStyle(infoBoxPlacement: .floating,
                                                     xAxisGridStyle  : xGridStyle,
                                                     yAxisGridStyle  : yGridStyle)
        
        let lineStyle   : LineStyle     = LineStyle(colour: Color(.systemGreen),
                                                    lineType: .curvedLine,
                                                    strokeStyle: StrokeStyle(lineWidth: 3,
                                                                             lineCap: .round,
                                                                             lineJoin: .round))
        let pointStyle : PointStyle = PointStyle(pointSize: 10, borderColour: Color.primary, lineWidth: 3)

        return ChartData(dataPoints     : data,
                         metadata       : metadata,
                         xAxisLabels: labels,
                         chartStyle     : chartStyle,
                         lineStyle      : lineStyle,
                         pointStyle     : pointStyle)
    }
}
