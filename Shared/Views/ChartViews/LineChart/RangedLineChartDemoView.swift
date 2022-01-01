//
//  RangedLineChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 01/03/2021.
//

import SwiftUI
import SwiftUICharts

struct RangedLineChartDemoView: View {
    
    let data: RangedLineChartData = weekOfData()
    
    @State var size: CGRect = .zero
    
    var body: some View {
        VStack {
            
            RangedLineChart(chartData: data)
                .pointMarkers(chartData: data)
                .touchOverlay(chartData: data, specifier: "%.0f", unit: .prefix(of: "$"))
                .averageLine(chartData: data,
                             labelPosition: .center(specifier: "%.0f"),
                             strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                .xAxisGrid(chartData: data)
                .yAxisGrid(chartData: data)
                .xAxisLabels(chartData: data)
                .yAxisLabels(chartData: data)

                .infoDisplay(chartData: data, infoView: customInfoBox) { setBoxLocation($0, $1) }
                .titleBox(chartData: data,
                          title: HeaderBoxText(text: "Profits"),
                          subtitle: HeaderBoxText(text: "with Expected"))
                .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
                .id(data.id)
                .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
                .padding(.horizontal)
        }
        .navigationTitle("Week of Data")
    }
    
    private var customInfoBox: some InfoDisplayable {
        RangedLineCustomInfoBox(chartData: data, numberFormat: numberFormat, boxFrame: $size)
    }
    private func setBoxLocation(_ touchLocation: CGPoint, _ chartSize: CGRect) -> CGPoint {
        CGPoint(x: data.setBoxLocation(touchLocation: touchLocation.x,
                                       boxFrame: size,
                                       chartSize: chartSize),
                y: 35)
    }
    
    private var numberFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.currencySymbol = "€"
        formatter.locale = Locale.current
        
        formatter.usesGroupingSeparator = true
        formatter.generatesDecimalNumbers = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}


extension RangedLineChartDemoView {
    
    static func weekOfData() -> RangedLineChartData {

        let data = RangedLineDataSet(dataPoints: [
            RangedLineChartDataPoint(value: 11_0000, upperValue: 12_0000, lowerValue: 10_0000, xAxisLabel: "2016", description: "2016", ignore: true),
            RangedLineChartDataPoint(value: 13_5000, upperValue: 13_5000, lowerValue: 11_5000, xAxisLabel: "2017", description: "2017", ignore: false),
            RangedLineChartDataPoint(value: 11_0000, upperValue: 12_3000, lowerValue: 10_3000, xAxisLabel: "2018", description: "2018", ignore: false),
            RangedLineChartDataPoint(value: 12_4000, upperValue: 13_4000, lowerValue: 11_4000, xAxisLabel: "2019", description: "2019", ignore: true),
            RangedLineChartDataPoint(value: 12_8000, upperValue: 14_6000, lowerValue: 12_6000, xAxisLabel: "2020", description: "2020", ignore: true)
        ],
        legendTitle: "Profits",
        legendFillTitle: "Expected",
        pointStyle: PointStyle(),
        style: RangedLineStyle(lineColour: .colour(colour: .red),
                               fillColour: .colour(colour: Color(.blue).opacity(0.25)),
                               lineType: .curvedLine))
                        
        let gridStyle   = GridStyle(numberOfLines: 7,
                                    lineColour   : Color(.lightGray).opacity(0.5),
                                    lineWidth    : 1,
                                    dash         : [8],
                                    dashPhase    : 0)
        
        let chartStyle = LineChartStyle(markerType          : .vertical(attachment: .line(dot: .style(DotStyle()))),
                                        
                                        xAxisGridStyle      : gridStyle,
                                        xAxisLabelPosition  : .bottom,
                                        xAxisLabelColour    : Color.primary,
                                        xAxisLabelsFrom     : .dataPoint(rotation: .degrees(0)),
                                       
                                        yAxisGridStyle      : gridStyle,
                                        yAxisLabelPosition  : .leading,
                                        yAxisLabelColour    : Color.primary,
                                        yAxisNumberOfLabels : 7,
                                        
                                        baseline: .minimumValue,
                                        topLine: .maximumValue,
                                        
                                        globalAnimation     : .easeOut(duration: 1))
        
        return RangedLineChartData(dataSets: data,
                                   chartStyle: chartStyle)
        
    }
}

struct RangedLineChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        RangedLineChartDemoView()
    }
}

struct RangedLineCustomInfoBox: InfoDisplayable {

    @ObservedObject internal var chartData: RangedLineChartData
    private var numberFormat: NumberFormatter
    
    @Binding private var boxFrame: CGRect
    
    internal init(
        chartData: RangedLineChartData,
        numberFormat: NumberFormatter,
        boxFrame: Binding<CGRect>
    ) {
        self.chartData = chartData
        self._boxFrame = boxFrame
        self.numberFormat = numberFormat
    }
    
    @ViewBuilder
    var content: some View {
        if chartData.infoView.isTouchCurrent {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(chartData.touchPointData, id: \.id) { point in
                    Text(point.wrappedDescription)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text(point.formattedValue(from: numberFormat))
                        .font(.body)
                        .foregroundColor(.primary)
                }
            }
            .padding()
            .border(Color.primary, width: 1)
            .background(Color.systemsBackground)
            .background(
                GeometryReader { geo in
                    EmptyView()
                        .onAppear {
                            self.boxFrame = geo.frame(in: .local)
                        }
                        .onChange(of: geo.frame(in: .local)) { frame in
                            self.boxFrame = frame
                        }
                }
            )
        }
    }
}
