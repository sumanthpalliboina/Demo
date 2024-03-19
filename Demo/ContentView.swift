//
//  ContentView.swift
//  Demo
//
//  Created by Palliboina on 25/02/24.
//

import SwiftUI

/*(struct ContentView : View {
    @State private var selected :String = "No Value"
    
    @State private var selectedDate : Date = Date()
    @State private var selectedDates:Set<DateComponents> = []
    @State private var myDates : String = ""
    
    var listCities : [String] = ["Paris","Toronto","Belgium"]
    var body: some View {
        VStack{
            Text(selected)
            Picker("Cities: ",selection: $selected){
                ForEach(listCities,id: \.self){ value in
                    Text(value)
                }
            }.pickerStyle(.segmented)
            DatePicker("Date: ",selection: $selectedDate)
            DatePicker("Date Limit: ",selection: $selectedDate,in: Date()...,displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(.wheel)
            Spacer()
            MultiDatePicker("Date: ",selection: $selectedDates)
            Spacer()
            Text(myDates)
        }.padding()
            .onAppear{
                selected = "Please Select City"
            }
            .onChange(of: selectedDates, initial: false){ old, values in
                let days = values.map({value in String(value.day!)})
                myDates = days.joined(separator: ",")
            }
            
    }
}*/

/*struct MyModifiers: ViewModifier {
    let size : CGFloat
    init(size: CGFloat) {
        self.size = size
    }
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: size).weight(.semibold))
            .foregroundColor(Color.blue)
    }
}

struct ContentView: View {
    @State private var showInfo:Bool = false
    @State private var color = Color.clear
    @State private var btnDisabled = false
    @State private var titleInput:String = ""
    
    var body: some View {
        VStack(spacing:10){
            Text("Default Title")
                .padding()
                .background(color)
            Button("Show Info"){
                color = Color.green
                btnDisabled = true
                showInfo.toggle()
            }.padding()
                .disabled(btnDisabled)
            TextField("Insert",text:$titleInput)
            if showInfo {
                Text("This is the info")
            }
            Spacer()
        }.padding()
    }
}

struct MyLayout : Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        var totalWidth : CGFloat = 0
        var totalHeight : CGFloat = 0
        for (index,view) in subviews.enumerated(){
            if  index>0 {
                totalHeight += 10
            }
            let viewSize = view.sizeThatFits(.unspecified)
            totalWidth  += viewSize.width + CGFloat(30*index)
            totalHeight += viewSize.height
        }
        return CGSize(width: totalWidth, height: totalHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var posX :CGFloat =  bounds.origin.x
        var posY :CGFloat =  bounds.origin.y
        for(index,view) in subviews.enumerated(){
            if index > 0 {
                posY += 10
                posX += 30
            }
            view.place(at: CGPoint(x: posX, y: posY), proposal: .unspecified)
            posY += view.sizeThatFits(.unspecified).height
        }
    }
    
    
}

struct CustomLayout : View {
    @State private var selected : Bool = true
    var body: some View {
        let SelectedLayout = selected ? AnyLayout(MyLayout()) : AnyLayout(VStackLayout(alignment: .leading))
        
        VStack(alignment: .leading){
            Toggle(isOn: $selected, label: {
                Text(selected ? "Custom" : "Standard")
            }).padding(.bottom)
            SelectedLayout{
                Group{
                    Text("First")
                        .padding(10)
                        .background(.red)
                        .cornerRadius(10)
                    Text("Second")
                        .padding(10)
                        .background(.red)
                        .cornerRadius(10)
                    Text("Third")
                        .padding(10)
                        .background(.red)
                        .cornerRadius(10)
                }
            }
            EnvironmentChange()
            Spacer()
        }.padding()
            .font(.title)
    }
}

struct EnvironmentChange : View{
    @Environment(\.colorScheme) var mode
    
    var body: some View{
        Image(systemName: "trash")
            .font(Font.system(size: 100))
            .foregroundColor(mode == .dark ? Color.yellow : Color.blue)
            .symbolVariant(mode == .dark ? .fill : .circle)
    }
}*/

//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View{
//        ContentView()
//    }
//}

struct ContentView: View {
    @State private var selectedView:Int = 0

   var body: some View {
       TabView(selection: $selectedView){
           SearchListView()
           .tabItem({
               Label("Books",systemImage: "book.circle")
           }).tag(0)
           SettingsView()
               .tabItem({
                   Label("Settings",systemImage: "gear")
               }).tag(1)
               .badge(2)
       }
   }
}


#Preview("My Iphone 15 pro") {
    ContentView()
        .environment(ApplicationData())
}

