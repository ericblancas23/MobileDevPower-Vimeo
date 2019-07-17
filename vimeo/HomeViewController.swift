//
//  ViewController.swift
//  vimeo
//
//  Created by Eric Blancas on 7/17/19.
//  Copyright © 2019 Eric Blancas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)

    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myFeed", for: indexPath) as? MyFeedTableViewCell else {return UITableViewCell()}
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "myRecent", for: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}

