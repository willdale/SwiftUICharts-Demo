//
//  BarDemoChart.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 13/01/2021.
//
//
import SwiftUI
import SwiftUICharts

struct BarChartDemoView: View {
    
    private var chartData = weekOfData()
    private var stateObject = ChartStateObject()
        
    var body: some View {
        VStack {
            BarChart(chartData: chartData, stateObject: stateObject)
//                .touch(chartData: data) { touchLocation = $0 }
            .hGrid()
            
            .yAxisMarker(chartData: chartData, value: 200, position: .leading, style: .amber) {
                Text("Y Axis")
            }
            .xAxisMarker(chartData: chartData, value: 1, total: chartData.dataSets.dataWidth, position: .bottom, style: .amber) {
                Text("X Axis")
            }
            
//            .xAxisLabels(chartData: data, style: .standard90)
//            .yAxisLabels(chartData: data, position: [.leading], data: .generated)
//            .infoDisplay(.verticle(chartData: data),
//                         style: .bordered,
//                         shape: Rectangle())
//            .titleBox(chartData: data,
//                       title: HeaderBoxText(text: "Units Sold", font: .title),
//                       subtitle: HeaderBoxText(text: "Last year", font: .body))
            .environmentObject(stateObject)
            .environmentObject(chartData)
            .id(chartData.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.horizontal)
            
//            Button("Values") {
//                let newData: [BarChartDataPoint] = data.dataSets.dataPoints.enumerated().map {
//                    let value = $0.element.value + Double.random(in: 100...200)
//                    var dp = data.dataSets.dataPoints[$0.offset]
//                    dp.value = value
//                    return dp
//                }
//                
//                self.data.dataSets.dataPoints = newData
//            }
//            
//            Button("Width") {
//                self.data.barStyle.barWidth += 0.1
//            }
//            
//            Button("Colour") {
//                let newData: [BarChartDataPoint] = data.dataSets.dataPoints.enumerated().map {
//                    let colours: [Color] = [.purple, .blue, .green, .yellow, .yellow, .orange, .red]
//                    var dp = data.dataSets.dataPoints[$0.offset]
//                    dp.colour = .colour(colour: colours[Int.random(in: 0...colours.count-1)])
//                    return dp
//                }
//                
//                self.data.dataSets.dataPoints = newData
//            }

        }
    }
    
    static func weekOfData() -> BarChartData {
        let data: BarDataSet = BarDataSet(dataPoints: [
                BarChartDataPoint(value: 200, xAxisLabel: "Laptops"   , description: "Laptops"   , colour: .colour(colour: .purple)),
                BarChartDataPoint(value: 90 , xAxisLabel: "Desktops"  , description: "Desktops"  , colour: .colour(colour: .blue)),
                BarChartDataPoint(value: 700, xAxisLabel: "Phones"    , description: "Phones"    , colour: .colour(colour: .green)),
                BarChartDataPoint(value: 175, xAxisLabel: "Tablets"   , description: "Tablets"   , colour: .colour(colour: .yellow)),
                BarChartDataPoint(value: 60 , xAxisLabel: "Watches"   , description: "Watches"   , colour: .colour(colour: .yellow)),
                BarChartDataPoint(value: 100, xAxisLabel: "Monitors"  , description: "Monitors"  , colour: .colour(colour: .orange)),
                BarChartDataPoint(value: 600, xAxisLabel: "Headphones", description: "Headphones", colour: .colour(colour: .red))
            ])
        
        let barStyle = BarStyle(barWidth: 0.5,
                                cornerRadius: CornerRadius(top: 50, bottom: 0),
                                colourFrom: .dataPoints,
                                colour: .colour(colour: .blue))
        
        return BarChartData(dataSets: data, barStyle: barStyle)
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartDemoView()
    }
}
