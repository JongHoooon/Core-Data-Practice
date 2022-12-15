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
    @State private var movies: [Movie] = [Movie]()
    
    private func populateMovies() {
        movies = coreDM.getAllMovies()
    }
    
    var body: some View {
        VStack {
            let textField = TextField("Enter movie name", text: $moviewName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Save") {
                coreDM.saveMovie(title: moviewName)
                populateMovies()
            }
            
            List(movies, id: \.self) { movie in
                Text(movie.title ?? "")
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            populateMovies()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
