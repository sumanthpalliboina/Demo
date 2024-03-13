//
//  DemoApp.swift
//  Demo
//
//  Created by Palliboina on 25/02/24.
//

import SwiftUI

@main
struct DemoApp: App {
    @State private var appData = ApplicationData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appData)
        }
    }
}
