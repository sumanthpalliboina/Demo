//
//  ImagesTabView.swift
//  Demo
//
//  Created by Palliboina on 19/03/24.
//

import SwiftUI

struct ImagesTabView: View {
    @Environment(ApplicationData.self) private var appData
    var body: some View {
        VStack{
            TabView{
                ForEach(appData.userData){ book in
                    Image("IosImage")
                        .resizable()
                        .scaledToFit()
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
        }
    }
}

#Preview {
    ImagesTabView()
        .environment(ApplicationData())
}
