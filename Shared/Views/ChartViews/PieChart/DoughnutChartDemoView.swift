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
                .legends(chartData: data)
                .frame(minWidth: 300, maxWidth: 900, minHeight: 300, idealHeight: 450, maxHeight: 600, alignment: .center)
                .padding(.all, 24)
                .background(
                    ZStack {
                        DemoContainer()
                    }
                )
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
        let data = PieDataSet(dataPoints: [PieChartDataPoint(value: 7, pointDescription: "One",   colour: .blue),
                                           PieChartDataPoint(value: 2, pointDescription: "Two",   colour: .red),
                                           PieChartDataPoint(value: 9, pointDescription: "Three", colour: .purple),
                                           PieChartDataPoint(value: 6, pointDescription: "Four",  colour: .green),
                                           PieChartDataPoint(value: 4, pointDescription: "Five",  colour: .orange)],
                              legendTitle: "Data",
                              pointStyle: PointStyle(),
                              style: PieSegmentStyle())
    
        return DoughnutChartData(dataSets: data,
                                 metadata: ChartMetadata(title: "Pie", subtitle: "mmm pie"),
                                 chartStyle: DoughnutChartStyle(infoBoxPlacement: .header),
                                 noDataText: Text("hello"))
    }
}
