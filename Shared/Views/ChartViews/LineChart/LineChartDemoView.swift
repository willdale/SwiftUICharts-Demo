//
//  LineChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 23/01/2021.
//

import SwiftUI
import SwiftUICharts
import Combine

struct LineChartDemoView: View {
        
    private var chartData = weekOfData()
    private var stateObject = ChartStateObject()
        
    var body: some View {
        LineChart()
            .touch(chartData: chartData)
            .axisBorder(edges: edges)
            .grid(vLines: 5, hLines: 10, style: .lightGreyNoEdges)
        
            .yAxisMarker(value: 16_000, position: .leading, style: .amber, dataSetInfo: chartData.dataSetInfo, label: yAxisPOIText)
            .xAxisMarker(value: 2, total: chartData.dataSets.dataWidth, position: .top, style: .amber, chartName: chartData.chartName, label: xAxisPOIText)
        
            .pointMarkers(datapoints: chartData.dataSets.dataPoints,
                          dataSetInfo: chartData.dataSetInfo,
                          animation: pointMarkerAnimation,
                          pointMaker: pointMaker)
        
            .touchMarker(chartData: chartData)
        
            .xAxisLabels(labels: chartData.dataSets.dataLabels, positions: [.bottom], style: .standard, data: chartData.xAxisData)
            .yAxisLabels(position: [.leading], data: .generated, style: .standard, dataSetInfo: chartData.dataSetInfo)
        
            .axisTitles(edges: axisTitles, style: .standard)

            .infoDisplay(chartData: chartData, infoView: .vertical(style: .bordered)) { boxSize in
                boxLocation(touchLocation: stateObject.touchLocation, boxFrame: boxSize, chartSize: stateObject.chartSize)
            }
        
            .titleBox(title: "A Title", subtitle: "A subtitle")
            .legends(legends: [Legend(chartType: .line, text: "One"), Legend(chartType: .line, text: "Two", shapeColour: .colour(colour: .blue))], style: .standard)
        
            .environmentObject(stateObject)
            .environmentObject(chartData)
            .id(chartData.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 400, maxHeight: 400, alignment: .center)
            .padding(.horizontal)
            .navigationTitle("Week of Data")
    }
    
    private func boxLocation(touchLocation: CGPoint, boxFrame: CGRect, chartSize: CGRect) -> CGPoint {
        let returnPoint: CGFloat
        if touchLocation.x < chartSize.minX + (boxFrame.width / 2) {
            returnPoint = chartSize.minX + (boxFrame.width / 2)
        } else if touchLocation.x > chartSize.maxX - (boxFrame.width / 2) {
            returnPoint = chartSize.maxX - (boxFrame.width / 2)
        } else {
            returnPoint = touchLocation.x
        }
        return CGPoint(x: returnPoint,
                       y: boxFrame.midY)
    }
    
    private func pointMaker(_ index: Int) -> some View {
        ZStack {
            Circle()
                .stroke(Color.primary, style: StrokeStyle(lineWidth: 1))
                .frame(width: 8, height: 8)
            Text("\(chartData.dataSets.dataPoints[index].value, specifier: "%.0f")")
                .font(.caption)
                .padding(4)
                .background(Color.systemsBackground.opacity(0.5))
        }
    }
    
    private func pointMarkerAnimation(_ index: Int) -> Animation {
        .linear(duration: 1).delay(Double(0.2 * Double(index)))
    }

    private static func edgeStyle(_ delay: Double) -> BorderStyle {
        BorderStyle(colour: .gray, style: StrokeStyle(lineWidth: 1), animation: .linear(duration: 1).delay(delay))
    }
    
    private var edges: BorderSet = [
        .leading(direction: .up, style: Self.edgeStyle(0)),
        .top(direction: .trailing, style: Self.edgeStyle(1)),
        .trailing(direction: .down, style: Self.edgeStyle(2)),
        .bottom(direction: .leading, style: Self.edgeStyle(3)),
    ]
    
    private var axisTitles: Set<AxisTitleStyle.Edge> = [
        .top(text: "Top"),
        .leading(text: "Leading"),
        .bottom(text: "Bottom"),
        .trailing(text: "Trailing"),
    ]
    
    var yAxisPOIText: some View {
        Text(LocalizedStringKey("Step Count Aim"))
            .font(.caption)
            .foregroundColor(.primary)
            .padding([.leading, .top, .bottom], 2)
            .padding(.trailing, 12)
            .background(Color.systemsBackground)
        
            .clipShape(LeadingLabelShape())
            .overlay(LeadingLabelShape().stroke(Color(red: 1.0, green: 0.75, blue: 0.25)))
        
            .accessibilityLabel(LocalizedStringKey("P-O-I-Marker"))
            .accessibilityValue(LocalizedStringKey(String(format: NSLocalizedString("Step Count",
                                                                                    comment: "Shows the number of of steps the user should aim to do in a day"))))
    }
    
    var xAxisPOIText: some View {
        Text(LocalizedStringKey("Rest Day"))
            .font(.caption)
            .foregroundColor(.primary)
            .padding([.leading, .top, .trailing], 2)
            .padding(.bottom, 12)
            .background(Color.systemsBackground)
        
            .clipShape(TopLabelShape())
            .overlay(TopLabelShape().stroke(Color(red: 1.0, green: 0.75, blue: 0.25)))
        
            .accessibilityLabel(LocalizedStringKey("P-O-I-Marker"))
            .accessibilityValue(LocalizedStringKey(String(format: NSLocalizedString("Rest Day",
                                                                                    comment: "The day of the week the user should rest"))))
    }
    
    static func weekOfData() -> LineChartData {
        let data = LineDataSet(dataPoints: [
            LineChartDataPoint(value: 12000, xAxisLabel: "M", description: "Monday"   , ignore: false),
            LineChartDataPoint(value: 10000, xAxisLabel: "T", description: "Tuesday"  , ignore: false),
            LineChartDataPoint(value: 8000 , xAxisLabel: "W", description: "Wednesday", ignore: false),
            LineChartDataPoint(value: 17500, xAxisLabel: "T", description: "Thursday" , ignore: false),
            LineChartDataPoint(value: 16000, xAxisLabel: "F", description: "Friday"   , ignore: false),
            LineChartDataPoint(value: 11000, xAxisLabel: "S", description: "Saturday" , ignore: false),
            LineChartDataPoint(value: 9000 , xAxisLabel: "S", description: "Sunday"   , ignore: false),
        ],
        style: LineStyle(lineColour: .colour(colour: .red), lineType: .curvedLine))
        
        return LineChartData(dataSets: data)
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartDemoView()
    }
}

extension Color {
    public static var myBackground: Color {
        #if os(iOS)
        return Color(.systemBackground)
        #elseif os(tvOS)
        return Color(.darkGray)
        #elseif os(macOS)
        return Color(.windowBackgroundColor)
        #endif
    }
}
