//
//  ContentView.swift
//  watchOS Extension
//
//  Created by Will Dale on 16/01/2021.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    
    var body: some View {
        List {
            NavigationLink("Line Chart", destination: LineChartWatchDemo())
            NavigationLink("Bar Chart", destination: BarChartWatchDemo())
            NavigationLink("Multi Line Chart", destination: MultiLineChartWatchDemo())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
