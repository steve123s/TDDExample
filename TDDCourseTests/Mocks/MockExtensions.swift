//
//  MockExtensions.swift
//  TDDCourseTests
//
//  Created by Daniel Esteban Salinas on 10/10/20.
//

import Foundation
import UIKit
@testable import TDDCourse

extension MovieLibraryDataServiceTests {
    
    // We want to check if cells dequeue properly
    class TableViewMock: UITableView {
        
        var cellDequeuedProperly = false
        
        // Dependency Injection Initializer
        class func initMock(dataSource: MovieLibraryDataService) -> TableViewMock {
            let mock = TableViewMock(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
            mock.dataSource = dataSource
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellID")
            
            return mock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MovieCellMock: MovieCell {
        var movieData: Movie?
        
        override func configMovieCell(movie: Movie) {
            movieData = movie
        }
    }
    
}

extension MovieCellTests {
    
    class MockCellDataSource: NSObject, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
    }
    
}
