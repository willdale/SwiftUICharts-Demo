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
                        Text("Line Chart - Week")
                    }
                    NavigationLink(destination: FilledLineChartDemoView()) {
                        Text("Filled Line Chart - Week")
                    }
                    NavigationLink(destination: MultiLineChartDemoView()) {
                        Text("Multi Line Chart - Week")
                    }
                    NavigationLink(destination: RangedLineChartDemoView()) {
                        Text("Ranged Line Chart - Week")
                    }
                }
                Section(header: Text("Bar Chart")) {
                    NavigationLink(destination: BarChartDemoView()) {
                        Text("Bar Chart - Week")
                    }
                    NavigationLink(destination: GroupedBarChartDemoView()) {
                        Text("Grouped Bar Chart")
                    }
                    NavigationLink(destination: StackedBarChartDemoView()) {
                        Text("Stacked Bar Chart")
                    }
                    
                }
                Section(header: Text("Pie Chart")) {
                    NavigationLink(destination: PieChartDemoView()) {
                        Text("Pie Chart - Week")
                    }
                    NavigationLink(destination: DoughnutChartDemoView()) {
                        Text("Doughnut Chart - Week")
                    }
                }
                Section(header: Text("Test")) {
                    NavigationLink(destination: TestMainView()) {
                        Text("Test")
                    }
                }
            }
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
