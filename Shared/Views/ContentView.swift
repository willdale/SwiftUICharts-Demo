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
                    NavigationLink(destination: LineChartWideDemoView()) {
                        Text("Line Chart - Year")
                    }
                    NavigationLink(destination: LineChartMonthlyAveragedDemoView()) {
                        Text("Line Chart - Month Average")
                    }
                    NavigationLink(destination: LineChartWeeklyAveragedDemoView()) {
                        Text("Line Chart - Week Average")
                    }
                    NavigationLink(destination: LineChartDailyAverageDemoView()) {
                        Text("Line Chart - Day Average")
                    }
                    NavigationLink(destination: LineChartCustomCalculationDemoView()) {
                        Text("Line Chart - Day Total")
                    }
                }
                Section(header: Text("Bar Chart")) {
                    NavigationLink(destination: BarChartDemoView()) {
                        Text("Bar Chart - Week")
                    }
                    NavigationLink(destination: BarChartYearDemoView()) {
                        Text("Bar Chart - Year")
                    }
                }
            }
            .listStyle(SidebarListStyle())
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
