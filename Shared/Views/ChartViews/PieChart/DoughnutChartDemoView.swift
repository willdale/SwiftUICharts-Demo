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
    
    var body: some View {
        VStack {
            DoughnutChart(chartData: data)
                .touchOverlay(chartData: data)
                .headerBox(chartData: data)
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
        let data = PieDataSet(dataPoints: [
                                PieChartDataPoint(value: 7, description: "One",   colour: .blue),
                                PieChartDataPoint(value: 2, description: "Two",   colour: .red),
                                PieChartDataPoint(value: 9, description: "Three", colour: .purple),
                                PieChartDataPoint(value: 6, description: "Four",  colour: .green),
                                PieChartDataPoint(value: 4, description: "Five",  colour: .orange)],
                              legendTitle: "Data")
        
        return DoughnutChartData(dataSets: data,
                                 metadata: ChartMetadata(title: "Doughnut", subtitle: "mmm doughnuts"),
                                 chartStyle: DoughnutChartStyle(infoBoxPlacement: .header),
                                 noDataText: Text("hello"))
    }
}
