//
//  SwiftUICharts_DemoApp.swift
//  watchOS Extension
//
//  Created by Will Dale on 16/01/2021.
//

import SwiftUI

@main
struct SwiftUICharts_DemoApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
