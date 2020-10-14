//
//  MovieManager.swift
//  TDDCourse
//
//  Created by Daniel Esteban Salinas on 09/10/20.
//

import Foundation

class MovieManager {
    
    var moviesToSeeCount: Int { return moviesToSeeArray.count }
    var moviesSeenCount: Int { return moviesSeenArray.count }
    
    private var moviesToSeeArray: [Movie] = []
    private var moviesSeenArray: [Movie] = []
    
    func addMovie(movie: Movie) {
        if !moviesToSeeArray.contains(movie) {
            moviesToSeeArray.append(movie)
        }
    }
    
    func movieAtIndex(index: Int) -> Movie {
        return moviesToSeeArray[index]
    }
    
    func checkOffMovieAtIndex(_ index: Int) {
        guard index < moviesToSeeCount else { return }
        
        let checkedMovie = moviesToSeeArray.remove(at: index)
        moviesSeenArray.append(checkedMovie)
    }
    
    func checkedOffMovieAtIndex(_ index: Int) -> Movie {
        return moviesSeenArray[index]
    }
    
    func clearArrays() {
        moviesToSeeArray.removeAll()
        moviesSeenArray.removeAll()
    }
    
}
