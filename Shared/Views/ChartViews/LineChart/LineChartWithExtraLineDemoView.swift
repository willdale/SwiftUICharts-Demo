//
//  LineChartWithExtraLineDemoView.swift
//  LineChartWithExtraLineDemoView
//
//  Created by Will Dale on 17/09/2021.
//

import SwiftUI
import SwiftUICharts

struct LineChartWithExtraLineDemoView: View {
    
    let data: LineChartData = weekOfData()
    
    @State private var touchLocation: CGPoint?
    @State private var chartSize: CGRect = .zero
    
    var body: some View { EmptyView()
//        LineChart(chartData: data) { chartSize = $0 }
//            .extraLine(chartData: data,
//                       legendTitle: "Test",
//                       datapoints: extraLineData,
//                       style: extraLineStyle)
//            .pointMarkers(chartData: data)
////            .touch(chartData: data) { touchLocation = $0 }
//            .xAxisLabels(chartData: data)
////            .yAxisLabels(chartData: data, position: [.leading], data: .generated)
//        
//            .extraYAxisLabels(chartData: data, colourIndicator: .style(size: 12))
////            .infoDisplay(.verticle(chartData: data), style: .bordered)
//            .titleBox(chartData: data,
//                      title: HeaderBoxText(text: "Step Count"),
//                      subtitle: HeaderBoxText(text: "Over a Week"))
//            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .id(data.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.horizontal)
            
            .navigationTitle("Week of Data")
    }
    
    
    private var extraLineData: [ExtraLineDataPoint] {
        [ExtraLineDataPoint(value: 8000, description: "Something 1"),
         ExtraLineDataPoint(value: 10000, description: "Something 2"),
         ExtraLineDataPoint(value: 15000, description: "Something 3"),
         ExtraLineDataPoint(value: 9000, description: "Something 4")]
    }
    
    private var extraLineStyle: ExtraLineStyle {
        ExtraLineStyle(lineColour: .colour(colour: .blue),
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
        style: LineStyle(lineColour: .colour(colour: .red), lineType: .curvedLine))
        
        return LineChartData(dataSets: data)
    }

}

struct LineChartWithExtraLineDemoView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartWithExtraLineDemoView()
    }
}
