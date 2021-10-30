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
        BarChart(chartData: data)
            .touchOverlay(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data, colourIndicator: .custom(colour: ColourStyle(colour: .red), size: 12))
            .infoDisplaySpacer(height: 75)
            .infoDisplay(.verticle(chartData: data), style: .bordered, shape: Rectangle())
            .headerBox(chartData: data)
            .id(data.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.horizontal)
    }
    
    static func weekOfData() -> BarChartData {
                
        let data : BarDataSet =
            BarDataSet(dataPoints: [
                BarChartDataPoint(value: 200, xAxisLabel: "Laptops"   , description: "Laptops"   , colour: ColourStyle(colour: .purple)),
                BarChartDataPoint(value: 90 , xAxisLabel: "Desktops"  , description: "Desktops"  , colour: ColourStyle(colour: .blue)),
                BarChartDataPoint(value: 700, xAxisLabel: "Phones"    , description: "Phones"    , colour: ColourStyle(colour: .green)),
                BarChartDataPoint(value: 175, xAxisLabel: "Tablets"   , description: "Tablets"   , colour: ColourStyle(colour: .yellow)),
                BarChartDataPoint(value: 60 , xAxisLabel: "Watches"   , description: "Watches"   , colour: ColourStyle(colour: .yellow)),
                BarChartDataPoint(value: 100, xAxisLabel: "Monitors"  , description: "Monitors"  , colour: ColourStyle(colour: .orange)),
                BarChartDataPoint(value: 600, xAxisLabel: "Headphones", description: "Headphones", colour: ColourStyle(colour: .red))
            ],
            legendTitle: "Data")
        
        let metadata   = ChartMetadata(title: "Units Sold", subtitle: "Last year")
        
        let gridStyle  = GridStyle(numberOfLines: 7,
                                   lineColour   : Color(.lightGray).opacity(0.25),
                                   lineWidth    : 1)
        
        let chartStyle = BarChartStyle(markerType         : .bottomLeading(),
                                       xAxisGridStyle     : gridStyle,
                                       xAxisLabelPosition : .bottom,
                                       xAxisLabelsFrom    : .dataPoint(rotation: .degrees(-90)),
                                       xAxisTitle         : "Categories",
                                       yAxisGridStyle     : gridStyle,
                                       yAxisLabelPosition : .leading,
                                       yAxisNumberOfLabels: 5,
                                       yAxisTitle         : "Units sold (x 1000)",
                                       baseline           : .zero,
                                       topLine            : .maximumValue)
        
        return BarChartData(dataSets  : data,
                            metadata  : metadata,
                            xAxisLabels: ["One", "Two", "Three"],
                            barStyle  : BarStyle(barWidth: 0.5,
                                                 cornerRadius: CornerRadius(top: 50, bottom: 0),
                                                 colourFrom: .dataPoints,
                                                 colour: ColourStyle(colour: .blue)),
                            chartStyle: chartStyle)
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
