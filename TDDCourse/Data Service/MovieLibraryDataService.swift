//
//  MovieLibraryDataService.swift
//  TDDCourse
//
//  Created by Daniel Esteban Salinas on 09/10/20.
//

import UIKit

enum LibrarySection: Int {
    case MoviesToSee, MoviesSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager: MovieManager?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let movieManager = movieManager else { return 0 }
        guard let librarySection = LibrarySection(rawValue: section) else {
            fatalError()
        }
        
        switch librarySection {
        case .MoviesToSee:
            return movieManager.moviesToSeeCount
        case .MoviesSeen:
            return movieManager.moviesSeenCount
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: indexPath) as! MovieCell
        
        let movieData = librarySection.rawValue == 0 ? movieManager.movieAtIndex(index: indexPath.row) : movieManager.checkedOffMovieAtIndex(indexPath.row)
        
        cell.configMovieCell(movie: movieData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        if librarySection == .MoviesToSee {
            movieManager.checkOffMovieAtIndex(indexPath.row)
            tableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        let sectionTitle = librarySection.rawValue == 0 ? "Movies To See" : "Movies Seen"
        
        return sectionTitle
    }
    
}
