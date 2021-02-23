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
            MultiLayerPieChart(chartData: data)
                
                
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
            
            MultiPieDataPoint(value: 40, pointDescription: "One", colour: Color(.red).opacity(0.5),
                              layerDataPoints: [
                                MultiPieDataPoint(value: 5, colour: Color(.cyan),
                                                  layerDataPoints: [
                                                    MultiPieDataPoint(value: 70, colour: .red,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ]),
                                                    MultiPieDataPoint(value: 30, colour: .blue,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ])
                                                  ]),
                                MultiPieDataPoint(value: 5, colour: Color(.yellow),
                                                  layerDataPoints: [
                                                    MultiPieDataPoint(value: 50, colour: .green,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ]),
                                                    MultiPieDataPoint(value: 30, colour: .red,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ])
                                                  ])
                              ]),
            
            MultiPieDataPoint(value: 30, pointDescription: "Two", colour: Color(.blue).opacity(0.5),
                              layerDataPoints: [
                                MultiPieDataPoint(value: 10, colour: Color(.magenta),
                                                  layerDataPoints: [
                                                    MultiPieDataPoint(value: 70, colour: .blue,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ]),
                                                    MultiPieDataPoint(value: 40, colour: .green,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ])
                                                  ]),
                                MultiPieDataPoint(value: 6, colour: Color(.red),
                                                  layerDataPoints: [
                                                    MultiPieDataPoint(value: 20, colour: .red,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ]),
                                                    MultiPieDataPoint(value: 50, colour: .blue,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ])
                                                  ])
                              ]),
            
            MultiPieDataPoint(value: 50, pointDescription: "Three", colour: Color(.green).opacity(0.5),
                              layerDataPoints: [
                                MultiPieDataPoint(value: 9, colour: Color(.blue),
                                                  layerDataPoints: [
                                                    MultiPieDataPoint(value: 70, colour: .green,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ]),
                                                    MultiPieDataPoint(value: 60, colour: .red,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ])
                                                  ]),
                                MultiPieDataPoint(value: 15, colour: Color(.green),
                                                  layerDataPoints: [
                                                    MultiPieDataPoint(value: 40, colour: .blue,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ]),
                                                    MultiPieDataPoint(value: 10, colour: .green,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ])
                                                  ])
                              ]),
        
            MultiPieDataPoint(value: 60, pointDescription: "Four", colour: Color(.blue).opacity(0.5),
                              layerDataPoints: [
                                MultiPieDataPoint(value: 12, colour: Color(.cyan),
                                                  layerDataPoints: [
                                                    MultiPieDataPoint(value: 70, colour: .red,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ]),
                                                    MultiPieDataPoint(value: 90, colour: .blue,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ])
                                                  ]),
                                MultiPieDataPoint(value: 5, colour: Color(.yellow),
                                                  layerDataPoints: [
                                                    MultiPieDataPoint(value: 40, colour: .green,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ]),
                                                    MultiPieDataPoint(value: 30, colour: .blue,
                                                                      layerDataPoints: [
                                                                        MultiPieDataPoint(value: 30, colour: .gray),
                                                                        MultiPieDataPoint(value: 30, colour: .black)
                                                                      ])
                                                  ])
                              ])
        ])
        

        return MultiLayerPieChartData(dataSets: data,
                                      metadata: ChartMetadata(title: "Pie", subtitle: "mmm pie"),
                                      chartStyle: PieChartStyle(infoBoxPlacement: .header))
    }
}
