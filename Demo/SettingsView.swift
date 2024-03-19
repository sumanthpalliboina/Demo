//
//  SettingsView.swift
//  Demo
//
//  Created by Palliboina on 18/03/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(ApplicationData.self) private var appData
    @Environment(\.dismiss) var dismiss
    @State private var showPictures:Bool = false
    @State private var showYear:Bool = false
    var body: some View {
        Form{
            Section(header:Text("Settings"),footer:Text("Select what you want to see")){
                Toggle("Show pictures",isOn: Bindable(appData).showPictures)
                Toggle("Show Year",isOn: Bindable(appData).showYear)
            }.headerProminence(.increased)
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
            .environment(ApplicationData())
    }
}
