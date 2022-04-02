//
//  StackedBarChartDemoView.swift
//  SwiftUICharts Demo
//
//  Created by Will Dale on 12/02/2021.
//

import SwiftUI
import SwiftUICharts

struct StackedBarChartDemoView: View {
    
    let data = makeData()
    
    @State private var touchLocation: CGPoint?
    
    var body: some View {
        StackedBarChart(chartData: data)
//            .touch(chartData: data) { touchLocation = $0 }
            .vGrid()
//            .xAxisLabels(chartData: data, style: .standard)
//            .yAxisLabels(chartData: data, position: [.leading], data: .generated)
//            .infoDisplay(.verticle(chartData: data), style: .bordered)
//            .titleBox(chartData: data,
//                      title: HeaderBoxText(text: "Haggis Sales"),
//                      subtitle: HeaderBoxText(text: "Per Quarter"))
//            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .id(data.id)
            .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 500, maxHeight: 600, alignment: .center)
            .padding(.horizontal)
    }
}

struct StackedBarChartDemoView_Previews: PreviewProvider {
    static var previews: some View {
        StackedBarChartDemoView()
    }
}

extension StackedBarChartDemoView {
    static func makeData() -> StackedBarChartData {
        
        enum Group {
            case england
            case scotland
            case wales
            
            var data : GroupingData {
                switch self {
                case .england:
                    return GroupingData(title: "England" , colour: .colour(colour: .red))
                case .scotland:
                    return GroupingData(title: "Scotland", colour: .colour(colour: .blue))
                case .wales:
                    return GroupingData(title: "Wales"   , colour: .colour(colour: .green))
                }
            }
        }
        
        let groups : [GroupingData] = [Group.england.data, Group.scotland.data, Group.wales.data]

        let data = StackedBarDataSets(dataSets: [
            StackedBarDataSet(dataPoints: [
                StackedBarDataPoint(value: 100, description: "Q1 Sales", group: Group.england.data),
                StackedBarDataPoint(value: 500, description: "Q1 Sales", group: Group.scotland.data),
                StackedBarDataPoint(value: 300, description: "Q1 Sales", group: Group.wales.data),
            ], setTitle: "Q1"),
            
            StackedBarDataSet(dataPoints: [
                StackedBarDataPoint(value: 200, description: "Q2 Sales", group: Group.england.data),
                StackedBarDataPoint(value: 600, description: "Q2 Sales", group: Group.scotland.data),
                StackedBarDataPoint(value: 400, description: "Q2 Sales", group: Group.wales.data),
            ], setTitle: "Q2"),
            
            StackedBarDataSet(dataPoints: [
                StackedBarDataPoint(value: 300, description: "Q3 Sales", group: Group.england.data),
                StackedBarDataPoint(value: 700, description: "Q3 Sales", group: Group.scotland.data),
                StackedBarDataPoint(value: 300, description: "Q3 Sales", group: Group.wales.data),
            ], setTitle: "Q3"),
            
            StackedBarDataSet(dataPoints: [
                 StackedBarDataPoint(value: 400, description: "Q4 Sales", group: Group.england.data),
                 StackedBarDataPoint(value: 800, description: "Q4 Sales", group: Group.scotland.data),
                 StackedBarDataPoint(value: 200, description: "Q4 Sales", group: Group.wales.data),
            ], setTitle: "Q4")
        ])
        
        return StackedBarChartData(dataSets: data,
                                   groups: groups,
                                   barStyle: BarStyle(barWidth: 0.5))
    }
}
