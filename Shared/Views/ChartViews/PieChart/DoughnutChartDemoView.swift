//
//  DoughnutChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 01/02/2021.
//

import SwiftUI
import SwiftUICharts

struct DoughnutChartDemoView: View {
    
    var data: DoughnutChartData = makeData()
    @State private var touchLocation: CGPoint?
    
    var body: some View {
        VStack {
            DoughnutChart(chartData: data)
//                .touch(chartData: data) { touchLocation = $0 }
                .infoDisplay(.verticle(chartData: data), style: .bordered)
                .titleBox(chartData: data,
                          title: HeaderBoxText(text: "Doughnut"),
                          subtitle: HeaderBoxText(text: "mmm doughnuts"))
                .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())])
                .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
                .id(data.id)
                .padding(.horizontal)
        }
    }
}

struct DoughnutChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        DoughnutChartDemoView()
    }
}

extension DoughnutChartDemoView {
    static func makeData() -> DoughnutChartData {
        let data = PieDataSet(
            dataPoints: [
                PieChartDataPoint(value: 7, description: "One"  , colour: .blue  , label: .label(text: "One"  , rFactor: 0.8)),
                PieChartDataPoint(value: 2, description: "Two"  , colour: .red   , label: .label(text: "Two"  , rFactor: 0.8)),
                PieChartDataPoint(value: 9, description: "Three", colour: .purple, label: .label(text: "Three", rFactor: 0.8)),
                PieChartDataPoint(value: 6, description: "Four" , colour: .green , label: .label(text: "Four" , rFactor: 0.8)),
                PieChartDataPoint(value: 4, description: "Five" , colour: .orange, label: .label(text: "Five" , rFactor: 0.8))],
            legendTitle: "Data")
        
        return DoughnutChartData(dataSets: data,
                                 noDataText: Text("hello"))
    }
}
