//
//  ArticlesListController.swift
//  Most Viewed Articles
//
//  Created by Moustafa on 29/04/2023.
//

import UIKit

class ArticlesListController: UIViewController {
    
    
    @IBOutlet weak var articlesTb: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    
    func setupView(){
        setupNavItems()
        articlesTb.register(UINib(nibName: "articlesCell", bundle: nil), forCellReuseIdentifier: "articlesCell")
        articlesTb.dataSource = self
        articlesTb.delegate = self
    }
    
    func setupNavItems(){
        // Create the menu button
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu-icon"), style: .plain, target: self, action: #selector(menuButtonTapped))

        // Create the search button
        let searchButton = UIBarButtonItem(image: UIImage(named: "search-icon"), style: .plain, target: self, action: #selector(searchButtonTapped))

        // Create the dots button
        let dotsButton = UIBarButtonItem(image: UIImage(named: "dots-icon"), style: .plain, target: self, action: #selector(dotsButtonTapped))

        // Create the title label
        let titleLabel = UILabel()
        titleLabel.text = "NY Time Most Popular"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)

        // Add the buttons and title label to the navigation item
        navigationItem.leftBarButtonItem = menuButton
        navigationItem.rightBarButtonItems = [dotsButton, searchButton]
        navigationItem.titleView = titleLabel

        

    }
    
    // Handle button taps
    @objc func menuButtonTapped() {
        // Do something
    }

    @objc func searchButtonTapped() {
        // Do something
    }

    @objc func dotsButtonTapped() {
        // Do something
    }
}
extension ArticlesListController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "articlesCell", for: indexPath) as? articlesCell {
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    
}
