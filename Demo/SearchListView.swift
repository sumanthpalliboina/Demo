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
    @State private var showSheet : Bool = false
    @State private var inspectorPresented : Bool = false
    @State private var editItem : Book?

    var body: some View {
        NavigationStack{
            SearchableView(editItem: $editItem)
                .navigationTitle(Text("Books"))
                .toolbar{
                    ToolbarItem(placement:.navigationBarTrailing){
                        NavigationLink(destination: ImagesTabView(), label: {
                            Image(systemName: "photo.fill")
                        })
                    }
                    ToolbarItem(placement:.navigationBarTrailing){
                        Button(action: {
                            showSheet = true
                        }, label: {
                            Image(systemName: "book")
                        })
                    }
                    ToolbarItem(placement:.navigationBarTrailing){
                        Button(action: {
                            inspectorPresented.toggle()
                        }, label: {
                            Image(systemName: "person.circle")
                        })
                    }
                }
                .sheet(isPresented:$showSheet){
                    AddBookView()
                        .interactiveDismissDisabled(true)
                        .presentationDetents([.height(350)])
                        .presentationBackground(.ultraThinMaterial)
                }
                .inspector(isPresented: $inspectorPresented){
                    InspectorView()
                }
                .sheet(item: $editItem){ item in
                    AddBookView(book:item)
                        .interactiveDismissDisabled(true)
                        //.presentationDetents([.height(350)])
                        //.presentationBackground(.ultraThinMaterial)
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
    @Binding var editItem : Book?
    var body: some View {
        List{
            if isSearching {
                Button("Dismiss"){
                    dismissSearch()
                }
            }
            if appData.filteredItems.isEmpty {
                EmptyBooksView()
                    .frame(height:500)
            }else{
                ForEach(appData.filteredItems){book in
                    NavigationLink(destination: {
                        DetailedView(book: book)
                    }, label: {
                        BookItem(editItem: $editItem,book:book)
                    })
                }.onDelete{_ in
                    ///
                }
            }
        }
    }
}

struct BookItem: View {
    @Environment(ApplicationData.self) private var appData
    @Binding var editItem : Book?
    let book: Book

   var body: some View {
      HStack(alignment: .top) {
          if appData.showPictures {
              Image("IosImage")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 80, height: 100)
          }
         VStack(alignment: .leading, spacing: 2) {
            Text(book.title).bold()
                 .onTapGesture {
                     editItem = book
                 }
            Text(book.author)
             if appData.showYear {
                 Text(book.displayYear).font(.caption)
             }
            Spacer()
         }.padding(.top, 5)
         Spacer()
          Button(action:{
              removeBook(book:book)
              print("delete")
          },label: {
              Image(systemName: "trash")
                  .padding([.top,.trailing],9)
                  .foregroundColor(.red)
          }).padding([.top,.trailing],6)
              .buttonStyle(.plain)
      }
   }
    
    func removeBook(book:Book){
        var indexes = IndexSet()
        if let index = appData.userData.firstIndex(where: {$0.id == book.id}) {
            indexes.insert(index)
        }
        appData.userData.remove(atOffsets: indexes)
    }
}

#Preview {
    SearchListView()
        .environment(ApplicationData())
}
