//
//  ContentView.swift
//  Shared
//
//  Created by Will Dale on 10/01/2021.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {

    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("Line Chart")) {
                    NavigationLink(destination: LineChartDemoView()) {
                        Text("Line Chart")
                    }
                    NavigationLink(destination: FilledLineChartDemoView()) {
                        Text("Filled Line Chart")
                    }
                    NavigationLink(destination: MultiLineChartDemoView()) {
                        Text("Multi Line Chart")
                    }
                    NavigationLink(destination: RangedLineChartDemoView()) {
                        Text("Ranged Line Chart")
                    }
                    NavigationLink(destination: LineChartWithExtraLineDemoView()) {
                        Text("Line Chart With Extra Line Demo")
                    }
                }
                Section(header: Text("Bar Chart")) {
                    NavigationLink(destination: BarChartDemoView()) {
                        Text("Bar Chart")
                    }
                    NavigationLink(destination: HorizontalBarChartDemoView()) {
                        Text("Horizontal Bar Chart")
                    }
                    NavigationLink(destination: GroupedBarChartDemoView()) {
                        Text("Grouped Bar Chart")
                    }
                    NavigationLink(destination: StackedBarChartDemoView()) {
                        Text("Stacked Bar Chart")
                    }
                    NavigationLink(destination: RangedBarChartDemoView()) {
                        Text("Ranged Bar Chart")
                    }
                }
                Section(header: Text("Pie Chart")) {
                    NavigationLink(destination: PieChartDemoView()) {
                        Text("Pie Chart")
                    }
                    NavigationLink(destination: DoughnutChartDemoView()) {
                        Text("Doughnut Chart")
                    }
                }
                Section(header: Text("Other")) {
                    NavigationLink(destination: LocalizationDemoView()) {
                        Text("Localization View")
                    }
                    NavigationLink(destination: LineChartInScrollView()) {
                        Text("Line Chart in Scroll View")
                    }
                    NavigationLink(destination: FilteredDemo()) {
                        Text("Filtered Demo")
                    }
                }
            }
            // breaks in tvOS
//            .listStyle(SidebarListStyle())
            .navigationTitle("SwiftUICharts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
