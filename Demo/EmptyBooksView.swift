//
//  EmptyBooksView.swift
//  Demo
//
//  Created by Palliboina on 19/03/24.
//

import SwiftUI

struct EmptyBooksView: View {
    @Environment(ApplicationData.self) private var appData
    @State private var showSheet:Bool = false
    
    var body: some View {
        VStack(spacing:17){
            Image(systemName: "book.pages.fill")
                .font(.largeTitle)
            Text("Oops! Seems to be empty books store")
            Button("Add Your Book"){
                showSheet = true
            }.buttonStyle(.borderedProminent)
        }
        .sheet(isPresented: $showSheet){
            AddBookView()
                .interactiveDismissDisabled(true)
                .presentationDetents([.height(350)])
                .presentationBackground(.ultraThinMaterial)
        }
    }
}

#Preview {
    EmptyBooksView()
        .environment(ApplicationData())
}
