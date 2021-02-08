//
//  PieChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 24/01/2021.
//

import SwiftUI
import SwiftUICharts

struct PieChartDemoView: View {
    
    var data: PieChartData = makeData()
    
    var body: some View {
        VStack {
            PieChart(chartData: data)
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

struct PieChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartDemoView()
    }
}

extension PieChartDemoView {
    static func makeData() -> PieChartData {
        let data = PieDataSet(dataPoints: [PieChartDataPoint(value: 7, pointDescription: "One", colour: .blue),
                                           PieChartDataPoint(value: 2, pointDescription: "Two", colour: .red),
                                           PieChartDataPoint(value: 9, pointDescription: "Three", colour: .purple),
                                           PieChartDataPoint(value: 6, pointDescription: "Four", colour: .green),
                                           PieChartDataPoint(value: 4, pointDescription: "Five", colour: .orange)],
                              legendTitle: "Data",
                              pointStyle: PointStyle(),
                              style: PieSegmentStyle())
        
        return PieChartData(dataSets: data,
                            metadata: ChartMetadata(title: "Pie", subtitle: "mmm pie"),
                            chartStyle: PieChartStyle(infoBoxPlacement: .header),
                            noDataText: Text("hello"))
    }
}