//
//  AddBookView.swift
//  Demo
//
//  Created by Palliboina on 18/03/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(ApplicationData.self) private var appData
    @Environment(\.dismiss) var dismiss
    @State private var titleInput:String = ""
    @State private var authorInput:String = ""
    @State private var yearinput:String = ""
    
    var book : Book?
    
    var body: some View {
        VStack(alignment:.trailing,spacing: 15){
            HStack{
                Spacer()
                Button("Close"){
                    dismiss()
                }.padding([.top,.bottom],10)
                    
            }
            TextField("Insert title",text: $titleInput)
                .textFieldStyle(.roundedBorder)
            TextField("Insert author",text: $authorInput)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.alphabet)
            TextField("Insert year",text: $yearinput)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            Button("Save"){
                storeBook()
                dismiss()
            }.buttonStyle(.borderedProminent)
            Spacer()
        }.padding()
            .navigationTitle(Text(book == nil ? "Add Book" : "Edit Book").foregroundColor(Color.green))
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                titleInput = book?.title ?? ""
                authorInput = book?.author ?? ""
                yearinput = book?.displayYear ?? ""
            }
    }
    
    func storeBook(){
        let title = titleInput.trimmingCharacters(in: .whitespaces)
        let author = authorInput.trimmingCharacters(in: .whitespaces)
        if let year = Int(yearinput), !title.isEmpty && !author.isEmpty {
            let book = Book(title: title, author: author, cover: "IosImage", year: year, selected: false)
            appData.userData.append(book)
        }
    }
}

#Preview {
    NavigationStack{
        AddBookView(book: ApplicationData().filteredItems[0])
            .environment(ApplicationData())
    }
}
