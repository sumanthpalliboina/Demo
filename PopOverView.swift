//
//  PopOverView.swift
//  Demo
//
//  Created by Palliboina on 18/03/24.
//

import SwiftUI

struct PopOverView: View {
    @Environment(\.dismiss)  var dismiss
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button("X"){
                    dismiss()
                }.padding()
            }
            Text("You need to select help for getting context")
                .font(.title)
        }.frame(width:260,height: 260)
    }
}

#Preview {
    PopOverView()
}
