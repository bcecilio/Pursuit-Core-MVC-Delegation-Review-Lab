//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var fontSize : CGFloat = 17 {
        didSet {
            tableView.reloadData()
        }
    }
    
    var movies = [Movie]() {
        didSet { // property observer
            // reload our tableView
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        
    }
    
    func loadData() {
        movies = Movie.allMovies
    }
    
    @IBAction func viewChangedFont(segue: UIStoryboardSegue) {
        guard let FontViewController = segue.source as? FontViewController else {
            return
        }
        fontSize = FontViewController.font ?? 17
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        let movie = movies[indexPath.row]
        
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = movie.year.description
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: fontSize)
        cell.textLabel?.font = UIFont.systemFont(ofSize: fontSize)
        
        return cell
    }
}

