//
//  SearchListView.swift
//  Demo
//
//  Created by Palliboina on 13/03/24.
//

import SwiftUI

enum Scopes{
    case title,author
}

struct SearchListView: View {
    @Environment(ApplicationData.self) private var appData
     @State private var searchTerm:String = ""
    @State private var searchScope:Scopes = .title

    var body: some View {
        NavigationStack{
            SearchableView()
                .navigationTitle(Text("Books"))
                .toolbar{
                    ToolbarItem(placement:.navigationBarTrailing){
                        NavigationLink(destination: SettingsView(), label: {
                            Image(systemName: "gearshape")
                        })
                    }
                }
        }
        .searchable(text: $searchTerm,placement: .navigationBarDrawer(displayMode: .always),prompt: Text("Insert title"))
        .searchScopes($searchScope, scopes: {
            Text("Title").tag(Scopes.title)
            Text("Author").tag(Scopes.author)
        })
        .onChange(of: searchTerm, initial: false){ old, value in
            performSearch()
        }
        .onChange(of: searchScope, initial: false){
            performSearch()
        }
        .searchSuggestions({
            ForEach(appData.filteredItems){ book in
                Text("\(book.title) - \(book.author)")
                    .searchCompletion(book.title)
            }
        })
    }
    
    func performSearch(){
        let search = searchTerm.trimmingCharacters(in: .whitespaces)
        appData.filterValues(search: search,scope:searchScope)
    }
}

struct SearchableView:View {
    @Environment(ApplicationData.self) private var appData
    @Environment(\.isSearching) private var isSearching
    @Environment(\.dismissSearch) private var dismissSearch
    var body: some View {
        List{
            if isSearching {
                Button("Dismiss"){
                    dismissSearch()
                }
            }
            ForEach(appData.filteredItems){book in
                NavigationLink(destination: {
                    DetailedView(book: book)
                }, label: {
                    BookItem(book:book)
                })
            }
        }
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
