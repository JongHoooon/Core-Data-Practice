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
        
        NavigationView {
            VStack {
                TextField("Enter movie name", text: $moviewName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Save") {
                    coreDM.saveMovie(title: moviewName)
                    populateMovies()
                }
                
                List {
                    ForEach(movies, id: \.self) { movie in
                        NavigationLink(destination: MovieDetail(movie: movie, coreDM: coreDM),
                                       label: { Text(movie.title ?? "") })
                    }.onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            let movie = movies[index]
                            coreDM.deleteMovie(movie: movie)
                            populateMovies()
                        }
                    })
                }
                .listStyle(PlainListStyle())
                
                Spacer()
            }
            .padding()
            .onAppear (perform: {
                populateMovies()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
