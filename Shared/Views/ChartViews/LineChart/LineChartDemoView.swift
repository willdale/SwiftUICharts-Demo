//
//  LineChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 23/01/2021.
//

import SwiftUI
import SwiftUICharts
import Combine

final class ChartModels {
    
}

struct LineChartDemoView: View {
    
    @StateObject private var chartData = weekOfData()
    @StateObject private var stateObject = ChartStateObject()
        
    var body: some View {
        LineChart()
            .axisBorder(edges: edges)
            .grid(vLines: 5, hLines: 10, style: .lightGreyNoEdges)
            .yAxisMarker(value: 16_000, position: .bottom, style: .amber, dataSetInfo: chartData.dataSetInfo, label: yAxisPOIText)
        
            .pointMarkers(datapoints: chartData.dataSets.dataPoints,
                          dataSetInfo: chartData.dataSetInfo,
                          animation: pointMarkerAnimation,
                          pointMaker: pointMaker)
            .touch(stateObject: stateObject, chartData: chartData)
                    

//            .xAxisPOI(chartData: data,
//                      label: "Local_Worst",
//                      value: 2,
//                      total: data.dataSets.dataPoints.count,
//                      position: .top,
//                      style: .amber)
        
//            .yAxisPOI(chartData: data, label: "Minimum Recommended", value: 10_000, position: .center, style: .red)
//            .xAxisPOI(chartData: data,
//                      markerName: "Worst",
//                      markerValue: 2,
//                      dataPointCount: data.dataSets.dataPoints.count,
//                      lineColour: .red)
//            .averageLine(chartData: data, label: "Average", position: .center, style: .red)
        
        
            .xAxisLabels(labels: chartData.dataSets.dataLabels, positions: [.bottom], style: .standard, data: chartData.xAxisData)
            .yAxisLabels(position: [.leading], data: .generated, style: .standard, dataSetInfo: chartData.dataSetInfo)
        
            .axisTitles(edges: [.top(text: "Top"), .leading(text: "Leading"), .bottom(text: "Bottom"), .trailing(text: "Trailing")], style: .standard)
        
            

            .infoDisplay(datapoints: chartData.touchPointData, infoView: .vertical(style: .bordered)) { boxSize in
                boxLocation(touchLocation: stateObject.touchLocation, boxFrame: boxSize, chartSize: stateObject.chartSize)
            }
        
//            .titleBox(chartData: data,
//                      title: HeaderBoxText(text: "Step Count"),
//                      subtitle: HeaderBoxText(text: "Over a Week"))
//            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
        
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
        legendTitle: "Steps",
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
