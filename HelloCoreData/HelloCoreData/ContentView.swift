//
//  ContentView.swift
//  HelloCoreData
//
//  Created by JongHoon on 2022/12/15.
//

import SwiftUI

struct ContentView: View {
    
    let coreDM: CoreDataManager
    @State private var moviewName: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter movie name", text: $moviewName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Save") {
                coreDM.saveMovie(title: moviewName)
            }
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
