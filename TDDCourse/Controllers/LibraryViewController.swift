//
//  LibraryViewController.swift
//  TDDCourse
//
//  Created by Daniel Esteban Salinas on 09/10/20.
//

import UIKit

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    
    var unused_var_for_linter_test: Int = 0
    
    var another_unused_var_for_linter_test: Int = 0
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(movie: Movie(title: "Action", releaseDate: "1999"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Horror", releaseDate: "1989"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Crime Thriller", releaseDate: "1979"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Indie Comedy"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Action Movie"))
        
        libraryTableView.reloadData()
    }


}

