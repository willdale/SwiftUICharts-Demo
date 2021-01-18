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
            Spacer()
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
                .frame(minWidth: 300, maxWidth: 900, minHeight: 300, idealHeight: 400, maxHeight: 500, alignment: .center)
                .padding(.all, 24)
                .background(
                    ZStack {
                        DemoContainer()
                    }
                )
                .padding()
            Spacer()
            #if os(iOS)
            VStack {
                buttonOne
                buttonTwo
                slider
            }
            #elseif os(macOS)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    buttonOne
                    Spacer()
                    buttonTwo
                    Spacer()
                }
                Spacer()
                slider
                Spacer()
            }
            #elseif os(tvOS)
            HStack {
                buttonOne
                buttonTwo
                slider
            }
            #endif
            Spacer()
        }
        .navigationTitle("Year of Data")
    }
    var buttonOne: some View {
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
    }
    var buttonTwo: some View {
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
    }
   @ViewBuilder var slider: some View {
        #if !os(tvOS)
        Text("Change point Size")
        Slider(value: $pointSize) {
            Text("Point Size")
        }
        .labelsHidden()
        .frame(minWidth: 200, idealWidth: 300, maxWidth: 400)
        .padding(.horizontal)
        .onChange(of: pointSize) { (value) in
            data.pointStyle.pointSize = CGFloat(value * 20)
        }
        #else
        VStack {
            Text("Point Size")
            HStack {
                Button(action: {
                    data.pointStyle.pointSize += 1
                }, label: {
                    Image(systemName: "plus")
                })
                Button(action: {
                    data.pointStyle.pointSize -= 1
                }, label: {
                    Image(systemName: "minus")
                })
            }
        }
        #endif
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
                                                    lineColour  : Color(.lightGray),
                                                    lineWidth   : 1)
        
        let yGridStyle   : GridStyle    = GridStyle(numberOfLines: 3,
                                                    lineColour  : Color(.lightGray),
                                                    lineWidth   : 1)
        
        let chartStyle  : ChartStyle    = ChartStyle(infoBoxPlacement   : .floating,
                                                     xAxisGridStyle     : xGridStyle,
                                                     yAxisGridStyle     : yGridStyle,
                                                     yAxisNumberOfLabels: 5)
        
        let lineStyle   : LineStyle     = LineStyle(colour: Color(.systemGreen),
                                                    lineType: .curvedLine,
                                                    strokeStyle: StrokeStyle(lineWidth: 3,
                                                                             lineCap: .round,
                                                                             lineJoin: .round))
        let pointStyle : PointStyle     = PointStyle(pointSize: 10,
                                                     borderColour: Color.primary,
                                                     fillColour: Color.blue,
                                                     lineWidth: 3)

        return ChartData(dataPoints     : data,
                         metadata       : metadata,
                         xAxisLabels    : labels,
                         chartStyle     : chartStyle,
                         lineStyle      : lineStyle,
                         pointStyle     : pointStyle)
    }
}
