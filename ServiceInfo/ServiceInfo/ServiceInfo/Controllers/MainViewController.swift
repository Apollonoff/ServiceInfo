//
//  ViewController.swift
//  ServiceInfo
//
//  Created by Arseniy Apollonov on 29.03.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private var networkManager = NetworkManager()
    
    private var apps: [Result] = [] {
        didSet {
            infoTableView.reloadData()
        }
    }
    
    private let infoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        // setup TableView
        setupTableView()
        infoTableView.dataSource = self
        infoTableView.delegate = self
        infoTableView.separatorStyle = .singleLine
        // register Cell
        infoTableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.identifier)
        // setup Navigation Bar
        navigationItem.title = "Сервисы"
        navigationItem.titleView?.tintColor = UIColor(named: "TextColor")
        navigationItem.titleView?.backgroundColor = UIColor(named: "BackgroundColor")
        // get apps data
        networkManager.getAllApps({(apps) in
            DispatchQueue.main.async {
                self.apps = apps.body.services
            }
        })
    }
}
// MARK: - TableView Data Source and Delegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: InfoCell.identifier, for: indexPath) as?  InfoCell else {
            return InfoCell()
        }
        
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        
        let appData = self.apps[indexPath.row]
        if let url = URL(string: appData.icon_url) {
            cell.configureInfoCell(
                title: appData.name,
                description: appData.description,
                image_url: url)
        }
        return cell
    }
    
    // MARK: Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let appURL = URL(string: self.apps[indexPath.row].link) else { return }
        UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
    }
}
// MARK: - Layouts
private extension MainViewController {
    func setupTableView() {
        view.addSubview(infoTableView)
        NSLayoutConstraint.activate([
            infoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            infoTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            infoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            infoTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

