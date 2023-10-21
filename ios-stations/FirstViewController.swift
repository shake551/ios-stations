//
//  FirstViewController.swift
//  ios-stations
//

import UIKit

class FirstViewController: UIViewController {
    
    var books: [Book]?
    let completion: ([Book]?) -> Void = { (books) in
        let books = books
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        BookAPIClient().fetchBooks(offset: 0, completion: completion)
    }
}

extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}

extension FirstViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

