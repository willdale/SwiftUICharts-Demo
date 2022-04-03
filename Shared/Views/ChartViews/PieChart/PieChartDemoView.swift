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
    @State private var touchLocation: CGPoint?
    
    var body: some View {
        VStack {
            PieChart(chartData: data)
//                .touch(chartData: data) { touchLocation = $0 }
//                .infoDisplay(.verticle(chartData: data), style: .bordered)
//                .titleBox(chartData: data,
//                          title: HeaderBoxText(text: "Pie"),
//                          subtitle: HeaderBoxText(text: "mmm pie"))
//                .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())])
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
   
        let data = PieDataSet(
            dataPoints: [
                PieChartDataPoint(value: 7, description: "One",   colour: .blue  , label: .icon(systemName: "1.square", colour: .white, size: 30)),
                PieChartDataPoint(value: 2, description: "Two",   colour: .red   , label: .icon(systemName: "2.square", colour: .white, size: 30)),
                PieChartDataPoint(value: 9, description: "Three", colour: .purple, label: .icon(systemName: "3.square", colour: .white, size: 30)),
                PieChartDataPoint(value: 6, description: "Four",  colour: .green , label: .icon(systemName: "4.square", colour: .white, size: 30)),
                PieChartDataPoint(value: 4, description: "Five",  colour: .orange, label: .icon(systemName: "5.square", colour: .white, size: 30))
            ]
        )
        
        return PieChartData(dataSets: data)
    }
}
