//
//  InspectorView.swift
//  Demo
//
//  Created by Palliboina on 18/03/24.
//

import SwiftUI

struct InspectorView: View {
    var body: some View {
        VStack{
            Text("Sumanth Palliboina").font(.title)
            Text("The Frontend Dveloper").font(.caption)
            Image("IosImage")
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    InspectorView()
}
