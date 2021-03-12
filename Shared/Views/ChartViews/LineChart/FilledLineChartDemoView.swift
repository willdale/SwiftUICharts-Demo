//
//  FilledLineChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 26/01/2021.
//

import SwiftUI
import SwiftUICharts

struct FilledLineChartDemoView: View {

    @State var data : LineChartData = weekOfData()
    
    var body: some View {
        VStack {
            
//            infoView
//                .frame(minWidth: 300, maxWidth: 900, minHeight: 60, alignment: .center)
//                .padding(.all, 8)
//                .background(
//                    ZStack {
//                        DemoContainer()
//                    }
//                )
//                .padding(.horizontal)
            
            
            chartView
                .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 250, maxHeight: 400, alignment: .center)
                .padding(.all, 24)
//                .background(
//                    ZStack {
//                        DemoContainer()
//                    }
//                )
                .padding(.horizontal)
            
//            legendsView
//                .frame(minWidth: 300, maxWidth: 900, alignment: .center)
//                .padding(.all, 24)
//                .background(
//                    ZStack {
//                        DemoContainer()
//                    }
//                )
//                .padding(.horizontal)
        }
        .navigationTitle("Filled Line")
    }
    
    var infoView: some View {
        HStack {
            Spacer()
            InfoValue(chartData: data)
                .font(.subheadline)
            InfoExtra(chartData: data, text: "on")
            InfoDescription(chartData: data)
                .font(.subheadline)
            Spacer()
        }
    }
    
    var chartView: some View {
        FilledLineChart(chartData: data)
            .touchOverlay(chartData: data, unit: .suffix(of: "Steps"))
            .pointMarkers(chartData: data)
            .yAxisPOI(chartData: data,
                      markerName: "Step Count Aim",
                      markerValue: 15_000,
                      labelPosition: .center(specifier: "%.0f"),
                      labelColour: Color.black,
                      labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
                      lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .yAxisPOI(chartData: data,
                      markerName: "Minimum Recommended",
                      markerValue: 10_000,
                      labelPosition: .center(specifier: "%.0f"),
                      labelColour: Color.white,
                      labelBackground: Color(red: 0.25, green: 0.75, blue: 1.0),
                      lineColour: Color(red: 0.25, green: 0.75, blue: 1.0),
                      strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .averageLine(chartData: data,
                         strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
            .xAxisGrid(chartData: data)
            .yAxisGrid(chartData: data)
            .xAxisLabels(chartData: data)
            .yAxisLabels(chartData: data)
            .headerBox(chartData: data)
            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
    }
    
    var legendsView: some View {
        VStack(alignment: .leading) {
            ForEach(data.legends, id: \.self) { legend in
                legend.getLegend(textColor: .primary)
            }
        }
    }
    
}

struct FilledLineChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        FilledLineChartDemoView()
    }
}

extension FilledLineChartDemoView {
    
    static func weekOfData() -> LineChartData {
        
        let data = LineDataSet(dataPoints: [
            LineChartDataPoint(value: 12000, xAxisLabel: "M", description: "Monday"),
            LineChartDataPoint(value: 10000, xAxisLabel: "T", description: "Tuesday"),
            LineChartDataPoint(value: 8000,  xAxisLabel: "W", description: "Wednesday"),
            LineChartDataPoint(value: 17500, xAxisLabel: "T", description: "Thursday"),
            LineChartDataPoint(value: 16000, xAxisLabel: "F", description: "Friday"),
            LineChartDataPoint(value: 11000, xAxisLabel: "S", description: "Saturday"),
            LineChartDataPoint(value: 9000,  xAxisLabel: "S", description: "Sunday")
        ],
        legendTitle: "Test One",
        pointStyle: PointStyle(),
        style: LineStyle(lineColour: ColourStyle(colours: [Color.red,
                                                           Color.red.opacity(0.25)],
                                                 startPoint: .top,
                                                 endPoint: .bottom)))
        
        let metadata = ChartMetadata(title: "Some Data", subtitle: "A Week")
        let labels = ["Monday", "Thursday", "Sunday"]
        
        return LineChartData(dataSets: data,
                             metadata: metadata,
                             xAxisLabels: labels,
                             chartStyle: LineChartStyle(infoBoxPlacement: .header,
                                                        markerType: .full(attachment: .point),
                                                        xAxisLabelsFrom: .chartData,
                                                        baseline: .zero))
    }
}
