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
                .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())])
                .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
                .id(data.id)
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
   
        let data = PieDataSet(dataPoints: [
                                PieChartDataPoint(value: 7, description: "One",   colour: .blue),
                                PieChartDataPoint(value: 2, description: "Two",   colour: .red),
                                PieChartDataPoint(value: 9, description: "Three", colour: .purple),
                                PieChartDataPoint(value: 6, description: "Four",  colour: .green),
                                PieChartDataPoint(value: 4, description: "Five",  colour: .orange)],
                              legendTitle: "Data")
        
        return PieChartData(dataSets: data,
                            metadata: ChartMetadata(title: "Pie", subtitle: "mmm pie"),
                            chartStyle: PieChartStyle(infoBoxPlacement: .header))
    }
}
