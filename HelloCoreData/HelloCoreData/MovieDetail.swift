//
//  MovieDetail.swift
//  HelloCoreData
//
//  Created by JongHoon on 2022/12/15.
//

import SwiftUI

struct MovieDetail: View {
    
    let movie: Movie
    let coreDM: CoreDataManager
    
    @State private var movieName: String = ""
    @Binding var needsRefresh: Bool
    
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Update") {
                if !movieName.isEmpty {
                    movie.title = movieName
                    coreDM.updateMovie()
                    needsRefresh.toggle()
                }
            }
        }
        .padding()
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let coreDM = CoreDataManager()
        let movie = Movie(context: coreDM.persistentContainer.viewContext)
        
        MovieDetail(movie: movie, coreDM: coreDM, needsRefresh: .constant(false))
    }
}
