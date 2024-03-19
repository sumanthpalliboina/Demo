import SwiftUI
import Observation

struct Book: Identifiable, Hashable {
   let id = UUID()
   var title: String
   var author: String
   var cover: String
   var year: Int
   var selected: Bool
   
   var displayYear: String {
      get {
         return String(year)
      }
   }
}
@Observable class ApplicationData {
    var userData: [Book] {
        didSet{
            filterValues(search:"")
        }
    }
    
    var showPictures:Bool = true
    var showYear:Bool = true
    
    var filteredItems : [Book] = []
    
    func filterValues(search:String,scope:Scopes = .title){
        print("sorted")
        if search.isEmpty {
            filteredItems = userData.sorted(by: {$0.title < $1.title})
        }else{
            let list = userData.filter({ item in
                let value = scope == .title ? item.title : item.author
                return value.localizedStandardContains(search)
            })
            filteredItems = list.sorted(by: {$0.title < $1.title})
        }
    }
 
   init() {
      userData = [
         Book(title: "Steve Jobs", author: "Walter Isaacson", cover: "book1", year: 2011, selected: false),
         Book(title: "HTML5 for Masterminds", author: "J.D Gauchat", cover: "book2", year: 2017, selected: false),
         Book(title: "The Road Ahead", author: "Bill Gates", cover: "book3", year: 1995, selected: false),
         Book(title: "The C Programming Language", author: "Brian W. Kernighan", cover: "book4", year: 1988, selected: false),
         Book(title: "Being Digital", author: "Nicholas Negroponte", cover: "book5", year: 1996, selected: false),
         Book(title: "Only the Paranoid Survive", author: "Andrew S. Grove", cover: "book6", year: 1999, selected: false),
         Book(title: "Accidental Empires", author: "Robert X. Cringely", cover: "book7", year: 1996, selected: false),
         Book(title: "Bobby Fischer Teaches Chess", author: "Bobby Fischer", cover: "book8", year: 1982, selected: false),
         Book(title: "New Guide to Science", author: "Isaac Asimov", cover: "book9", year: 1993, selected: false),
         Book(title: "Christine", author: "Stephen King", cover: "book10", year: 1983, selected: false),
         Book(title: "IT", author: "Stephen King", cover: "book11", year: 1987, selected: false),
         Book(title: "Ending Aging", author: "Aubrey de Grey", cover: "book12", year: 2007, selected: false)
      ]
       
       filterValues(search:"")
   }
    
}
