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
    
    let data: BarChartData = weekOfData()
    
    var body: some View {
        VStack {
        BarChart(chartData: data)
            .touch(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data, style: .standard)
            .yAxisLabels(chartData: data)
            .infoDisplaySpacer(height: 75)
            .infoDisplay(.verticle(chartData: data),
                         style: .bordered,
                         shape: Rectangle())
            .titleBox(chartData: data,
                       title: HeaderBoxText(text: "Units Sold", font: .title),
                       subtitle: HeaderBoxText(text: "Last year", font: .body))
            .id(data.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.horizontal)
            
            Button("Values") {
                let newData: [BarChartDataPoint] = data.dataSets.dataPoints.enumerated().map {
                    let value = $0.element.value + Double.random(in: 100...200)
                    var dp = data.dataSets.dataPoints[$0.offset]
                    dp.value = value
                    return dp
                }
                
                self.data.dataSets.dataPoints = newData
            }
            
            Button("Width") {
                self.data.barStyle.barWidth += 0.1
            }
            
            Button("Colour") {
                let newData: [BarChartDataPoint] = data.dataSets.dataPoints.enumerated().map {
                    let colours: [Color] = [.purple, .blue, .green, .yellow, .yellow, .orange, .red]
                    var dp = data.dataSets.dataPoints[$0.offset]
                    dp.colour = .colour(colour: colours[Int.random(in: 0...colours.count-1)])
                    return dp
                }
                
                self.data.dataSets.dataPoints = newData
            }

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
            ],
            legendTitle: "Data")
        
        let barStyle = BarStyle(barWidth: 0.5,
                                cornerRadius: CornerRadius(top: 50, bottom: 0),
                                colourFrom: .dataPoints,
                                colour: .colour(colour: .blue))
        
        return BarChartData(dataSets: data,
                            xAxisLabels: ["One", "Two", "Three"],
                            barStyle: barStyle)
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartDemoView()
    }
}

/*
.infoDisplay(chartData: data, infoView: customInfoBox) { setBoxLocation($0, $1) }
private var customInfoBox: some InfoDisplayable {
    CustomInfoBox(chartData: data, boxFrame: $size)
}
private func setBoxLocation(_ touchLocation: CGPoint, _ chartSize: CGRect) -> CGPoint {
    CGPoint(x: data.setBoxLocation(touchLocation: touchLocation.x,
                                   boxFrame: size,
                                   chartSize: chartSize),
            y: 35)
}
struct CustomInfoBox<ChartData>: InfoDisplayable where ChartData: InfoData {

    @ObservedObject var chartData: ChartData
    @Binding var boxFrame: CGRect
    
    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(chartData.touchPointData, id: \.id) { point in
                chartData.infoDescription(info: point)
                    .font(chartData.chartStyle.infoBoxDescriptionFont)
                    .foregroundColor(chartData.chartStyle.infoBoxDescriptionColour)
                chartData.infoValueUnit(info: point)
                    .font(chartData.chartStyle.infoBoxValueFont)
                    .foregroundColor(chartData.chartStyle.infoBoxValueColour)
                chartData.infoLegend(info: point)
                    .foregroundColor(chartData.chartStyle.infoBoxDescriptionColour)
            }
        }
        .border(Color.accentColor, width: 1)
        .background(
            GeometryReader { geo in
                EmptyView()
                    .onChange(of: geo.frame(in: .local)) { frame in
                        self.boxFrame = frame
                    }
            }
        )
    }
}
*/
