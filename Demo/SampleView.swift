//
//  SampleView.swift
//  Demo
//
//  Created by Palliboina on 02/03/24.
//

import SwiftUI

struct SampleView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("CustomColor"))
            .padding()
    }
}

#Preview {
    SampleView()
        .environment(\.colorScheme, .dark)
}
