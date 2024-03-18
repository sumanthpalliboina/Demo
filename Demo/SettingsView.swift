//
//  SettingsView.swift
//  Demo
//
//  Created by Palliboina on 18/03/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showPictures:Bool = false
    @State private var showYear:Bool = false
    var body: some View {
        Form{
            Toggle("Show pictures",isOn: $showPictures)
            Toggle("Show Year",isOn: $showYear)
        }.navigationTitle("Settings")
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement:.navigationBarLeading){
                    Button("Go Back"){
                        dismiss()
                    }
                }
            }
    }
}

#Preview {
    NavigationStack{
        SettingsView()
    }
}
