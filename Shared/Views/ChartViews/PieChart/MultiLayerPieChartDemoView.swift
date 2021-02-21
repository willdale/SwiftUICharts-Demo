//
//  MultiLayerPieChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 05/02/2021.
//

import SwiftUI
import SwiftUICharts

public struct MultilayerPieChartDemoView: View {
    
    public var data: MultiLayerPieChartData = makeData()
    
    public var body: some View {
        VStack {
            MultiLayerPie(chartData: data)
                
                
        }
    }
}

struct MultilayerPieChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        MultilayerPieChartDemoView()
    }
}

extension MultilayerPieChartDemoView {
    public static func makeData() -> MultiLayerPieChartData {
        let data = MultiPieDataSet(dataPoints: [
            
            MultiPieDataPoint(value: 60, pointDescription: "One", colour: Color(.red).opacity(0.5),
                              layerDataPoints: [MultiPieDataPoint(value: 5, colour: Color(.cyan),
                                                                  layerDataPoints: [MultiPieDataPoint(value: 30, colour: .red),
                                                                                    MultiPieDataPoint(value: 30, colour: .red)]
                              ),
                                                MultiPieDataPoint(value: 5, colour: Color(.yellow),
                                                                  layerDataPoints: [MultiPieDataPoint(value: 30, colour: .blue),
                                                                                    MultiPieDataPoint(value: 30, colour: .blue)])
                              ]),
            
            MultiPieDataPoint(value: 20, pointDescription: "Two", colour: Color(.blue).opacity(0.5),
                              layerDataPoints: [MultiPieDataPoint(value: 5, colour: Color(.magenta)),
                                                MultiPieDataPoint(value: 5, colour: Color(.red))]),
            
            MultiPieDataPoint(value: 30, pointDescription: "Three", colour: Color(.green).opacity(0.5),
                              layerDataPoints: [MultiPieDataPoint(value: 5, colour: Color(.blue)),
                                                MultiPieDataPoint(value: 5, colour: Color(.green))]),
            
            MultiPieDataPoint(value: 70, pointDescription: "Four", colour: Color(.blue).opacity(0.5),
                              layerDataPoints: [MultiPieDataPoint(value: 5, colour: Color(.cyan)),
                                                MultiPieDataPoint(value: 5, colour: Color(.yellow))])
        ])
        
        return MultiLayerPieChartData(dataSets: data,
                            metadata: ChartMetadata(title: "Pie", subtitle: "mmm pie"),
                            chartStyle: PieChartStyle(infoBoxPlacement: .header),
                            noDataText: Text("hello"))
    }
}
