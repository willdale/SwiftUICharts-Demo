//
//  LineChartInScrollView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 21/06/2021.
//

import SwiftUI

import SwiftUI
import SwiftUICharts

struct LineChartInScrollView: View {
    
    let data: LineChartData = weekOfData()
    
    @State private var touchLocation: CGPoint?
    @State private var chartSize: CGRect = .zero
    
    var body: some View { EmptyView()
//        ScrollView {
//            LineChart(chartData: data) { chartSize = $0 }
//                .pointMarkers(chartData: data)
////                .touch(chartData: data) { touchLocation = $0 }
////                .yAxisPOI(chartData: data,
////                          markerName: "Step Count Aim",
////                          markerValue: 15_000,
////                          labelPosition: .center(specifier: "%.0f"),
////                          labelColour: Color.black,
////                          labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
////                          lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
////                          strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
////                .averageLine(chartData: data,
////                             strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
//                .xAxisLabels(chartData: data)
////                .yAxisLabels(chartData: data)
//            
////                .infoDisplay(.verticle(chartData: data), style: .bordered)
//                .titleBox(chartData: data,
//                          title: HeaderBoxText(text: "Step Count"),
//                          subtitle: HeaderBoxText(text: "Over a Week"))
//                .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
//                .id(data.id)
//                .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
//                .padding(.horizontal)
//                
//                .navigationTitle("Week of Data")
//                .padding(.bottom)
//            Divider()
//            ForEach(data.dataSets.dataPoints, id: \.id) { point in
//                HStack {
//                    VStack(alignment: .leading) {
//                        Text("\(point.wrappedDescription)")
//                            .font(.title)
//                            .padding(.bottom)
//                        HStack {
//                            Text("Steps:")
//                            Text("\(point.value, specifier: "%.0f")")
//                        }.font(.body)
//                    }
//                    Spacer()
//                    VStack(alignment: .leading) {
//                        Text(point.value >= 12_000 ? "Well Done" : "Do Better")
//                            .font(.title)
//                            .padding(.bottom)
//                        Text(point.value >= 12_000 ? "Now do it again" : "Keep Up")
//                            .font(.body)
//                    }
//                    
//                }
//                .padding(.horizontal)
//                Divider()
//            }
//        }
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
        style: LineStyle(lineColour: .colour(colour: .red), lineType: .curvedLine))
        
        return LineChartData(dataSets: data)
    }
    
}

struct LineChartInScrollView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartInScrollView()
    }
}
