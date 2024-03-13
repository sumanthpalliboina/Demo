//
//  SearchListView.swift
//  Demo
//
//  Created by Palliboina on 13/03/24.
//

import SwiftUI

struct SearchListView: View {
    @Environment(ApplicationData.self) private var appData
     @State private var searchTerm:String = ""

    var body: some View {
        NavigationStack{
            List(appData.filteredItems) { book in
                BookItem(book: book)
            }.navigationTitle(Text("Books"))
        }
        .searchable(text: $searchTerm,placement: .navigationBarDrawer(displayMode: .always),prompt: Text("Insert title"))
        .onChange(of: searchTerm, initial: false){ old, value in
            let search = value.trimmingCharacters(in: .whitespaces)
            appData.filterValues(search: search)
        }
        .searchSuggestions({
            ForEach(appData.filteredItems){ book in
                Text("\(book.title) - \(book.author)")
                    .searchCompletion(book.title)
            }
        })
    }
}

struct BookItem: View {
   let book: Book

   var body: some View {
      HStack(alignment: .top) {
         Image("IosImage")
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 100)
         VStack(alignment: .leading, spacing: 2) {
            Text(book.title).bold()
            Text(book.author)
            Text(book.displayYear).font(.caption)
            Spacer()
         }.padding(.top, 5)
         Spacer()
      }
   }
}

#Preview {
    SearchListView()
        .environment(ApplicationData())
}
