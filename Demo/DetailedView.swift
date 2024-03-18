//
//  DetailedView.swift
//  Demo
//
//  Created by Palliboina on 18/03/24.
//

import SwiftUI

struct DetailedView: View {
    @Environment(ApplicationData.self) private var appData
    @Environment(\.dismiss) var dismiss
    var book:Book
    
    var body: some View {
        VStack{
            Text(book.title).font(.title)
            Text(book.author)
            Image("IosImage")
                .resizable()
                .scaledToFit()
        }.navigationTitle(Text("Book"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Go Back"){
                        dismiss()
                    }
                }
            }
    }
}

#Preview {
    NavigationStack{
        DetailedView(book: ApplicationData().filteredItems[1])
            .environment(ApplicationData())
    }
}
