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
    
    let data: LineChartData = weekOfData()
    
    var body: some View {
        LineChart(chartData: data)
            .extraLine(chartData: data,
                       legendTitle: "Test",
                       datapoints: extraLineData,
                       style: extraLineStyle)
            .pointMarkers(chartData: data)
            .touchOverlay(chartData: data,
                          formatter: numberFormatter)
            .yAxisPOI(chartData: data,
                      markerName: "Step Count Aim",
                      markerValue: 15_000,
                      labelPosition: .center(specifier: "%.0f",
                                             formatter: numberFormatter),
                      labelColour: Color.black,
                      labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
                      lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .yAxisPOI(chartData: data,
                      markerName: "Minimum Recommended",
                      markerValue: 10_000,
                      labelPosition: .center(specifier: "%.0f",
                                             formatter: numberFormatter),
                      labelColour: Color.white,
                      labelBackground: Color(red: 0.25, green: 0.75, blue: 1.0),
                      lineColour: Color(red: 0.25, green: 0.75, blue: 1.0),
                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .xAxisPOI(chartData: data,
                      markerName: "Worst",
                      markerValue: 2,
                      dataPointCount: data.dataSets.dataPoints.count,
                      lineColour: .red)
            .averageLine(chartData: data,
                         labelPosition: .yAxis(specifier: "",
                                               formatter: numberFormatter),
                         strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .xAxisGrid(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data,
                         formatter: numberFormatter,
                         colourIndicator: .style(size: 12))
            .extraYAxisLabels(chartData: data, colourIndicator: .style(size: 12))
            .infoBox(chartData: data, height: 140)
            .headerBox(chartData: data)
            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .id(data.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.horizontal)
            
            .navigationTitle("Week of Data")
    }
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var extraLineData: [ExtraLineDataPoint] {
        [ExtraLineDataPoint(value: 8000),
         ExtraLineDataPoint(value: 10000),
         ExtraLineDataPoint(value: 15000),
         ExtraLineDataPoint(value: 9000)]
    }
    private var extraLineStyle: ExtraLineStyle {
        ExtraLineStyle(lineColour: ColourStyle(colour: .blue),
                       lineType: .line,
                       yAxisTitle: "Another Axis")
    }
    
    static func weekOfData() -> LineChartData {
        let data = LineDataSet(dataPoints: [
            LineChartDataPoint(value: 12000, xAxisLabel: "M", description: "Monday"   ),
            LineChartDataPoint(value: 10000, xAxisLabel: "T", description: "Tuesday"  ),
            LineChartDataPoint(value: 8000 , xAxisLabel: "W", description: "Wednesday"),
            LineChartDataPoint(value: 17500, xAxisLabel: "T", description: "Thursday" ),
            LineChartDataPoint(value: 16000, xAxisLabel: "F", description: "Friday"   ),
            LineChartDataPoint(value: 11000, xAxisLabel: "S", description: "Saturday" ),
            LineChartDataPoint(value: 9000 , xAxisLabel: "S", description: "Sunday"   ),
        ],
        legendTitle: "Steps",
        pointStyle: PointStyle(),
        style: LineStyle(lineColour: ColourStyle(colour: .red), lineType: .curvedLine))
        
        let gridStyle = GridStyle(numberOfLines: 7,
                                   lineColour   : Color(.lightGray).opacity(0.5),
                                   lineWidth    : 1,
                                   dash         : [8],
                                   dashPhase    : 0)
        
        let chartStyle = LineChartStyle(infoBoxPlacement    : .infoBox(isStatic: false),
                                        infoBoxContentAlignment: .vertical,
                                        infoBoxBorderColour : Color.primary,
                                        infoBoxBorderStyle  : StrokeStyle(lineWidth: 1),
                                        
                                        markerType          : .vertical(attachment: .line(dot: .style(DotStyle()))),
                                        
                                        xAxisGridStyle      : gridStyle,
                                        xAxisLabelPosition  : .bottom,
                                        xAxisLabelColour    : Color.primary,
                                        xAxisLabelsFrom     : .dataPoint(rotation: .degrees(0)),
                                        xAxisTitle          : "xAxisTitle",
                                        
                                        yAxisGridStyle      : gridStyle,
                                        yAxisLabelPosition  : .leading,
                                        yAxisLabelColour    : Color.primary,
                                        yAxisNumberOfLabels : 7,
                                        
                                        baseline            : .minimumWithMaximum(of: 5000),
                                        topLine             : .maximum(of: 20000),
                                        
                                        globalAnimation     : .easeOut(duration: 1))
        
        
        
        let chartData = LineChartData(dataSets       : data,
                                      metadata       : ChartMetadata(title: "Step Count", subtitle: "Over a Week"),
                                      chartStyle     : chartStyle)
        
        defer {
            chartData.touchedDataPointPublisher
                .map(\.value)
                .sink { value in
                    var dotStyle: DotStyle
                    if value < 10_000 {
                        dotStyle = DotStyle(fillColour: .red)
                    } else if value >= 10_000 && value <= 15_000 {
                        dotStyle = DotStyle(fillColour: .blue)
                    } else {
                        dotStyle = DotStyle(fillColour: .green)
                    }
                    withAnimation(.linear(duration: 0.5)) {
                        chartData.chartStyle.markerType = .vertical(attachment: .line(dot: .style(dotStyle)))
                    }
                }
                .store(in: &chartData.subscription)
        }
        
        return chartData
        
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

#if os(iOS)
enum ActiveSheet: String, Identifiable {
    case photoLibrary, shareSheet
    var id: String {
        return self.rawValue
    }
}

struct ShareHomeView: View {
    
    var chartImageController = ChartImageController()
    @State var showImage = false
    @State var image = UIImage()
    @State var bag = Set<AnyCancellable>()
    
    @State private var shareCardAsImage: UIImage? = nil
    @State var activeSheet: ActiveSheet? = nil
    
    var shareCard: some View {
        DoughnutChartDemoView()
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height)
    }
    
    var body: some View {
        Button {
            let controller = ChartImageHostingController(rootView: shareCard)
            controller.finalImage
                .sink { completion in
                    self.chartImageController.controller = nil
                } receiveValue: { image in
                    self.shareCardAsImage = image
                    self.activeSheet = .shareSheet
                }
                .store(in: &bag)
            controller.start()
            chartImageController.controller = controller
            
        } label: {
            HStack {
                Image(systemName: "square.and.arrow.up")
                    .font(.system(size: 20))
                Text("Share")
                    .font(.headline)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
        .padding(.horizontal)
        .sheet(item: $activeSheet) { [shareCardAsImage] sheet in
            switch sheet {
            case .photoLibrary:
                Text("TODO")
            case .shareSheet:
                if let unwrappedImage = shareCardAsImage {
                    ShareSheet(photo: unwrappedImage)
                }
                
            }
        }
    }
}

struct RecoveryShareHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ShareHomeView().preferredColorScheme(.dark)
        ShareHomeView().preferredColorScheme(.light)
    }
}

import LinkPresentation

//This code is from https://gist.github.com/tsuzukihashi/d08fce005a8d892741f4cf965533bd56
struct ShareSheet: UIViewControllerRepresentable {
    let photo: UIImage
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityItems: [Any] = [photo]
        return UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: nil
        )
    }
    
    func updateUIViewController(_ vc: UIActivityViewController, context: Context) {
        
    }
}
#endif
