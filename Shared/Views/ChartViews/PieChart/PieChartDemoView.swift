//
//  PieChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 24/01/2021.
//

import SwiftUI
import SwiftUICharts

struct PieChartDemoView: View {
    
    var data: PieChartData { makeData() }
    
    var body: some View {
        PieChart(chartData: data)
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

struct PieChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartDemoView()
    }
}

extension PieChartDemoView {
    
    func makeData() -> PieChartData {
        
        let data = PieDataSet(dataPoints: [PieChartDataPoint(value: 5, colour: .blue),
                                           PieChartDataPoint(value: 9, colour: .red),
                                           PieChartDataPoint(value: 2, colour: .purple),
                                           PieChartDataPoint(value: 4, colour: .green),
                                           PieChartDataPoint(value: 8, colour: .orange)],
                              legendTitle: "Data",
                              pointStyle: PointStyle(),
                              style: PieStyle())
        
        return PieChartData(dataSets: data,
                            metadata: ChartMetadata(title: "Pie", subtitle: "mmm pie"),
//                            xAxisLabels: [String]?,
                            chartStyle: PieChartStyle(),
                            noDataText: Text("hello")
    )
    }
    
}
