//
//  ViewController.swift
//  CarlaTestCase
//
//  Created by Aleyna Işıkdağlılar on 26.06.2024.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel = RoversListViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemBackground
        tableView.showsVerticalScrollIndicator = false
        tableView.register(RoverTableViewCell.self, forCellReuseIdentifier: RoverTableViewCell.identifier)
        return tableView
    }()
    
    private func prepareUI() {
        title = "Rovers"

        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
        
        let headerView = CustomHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        tableView.tableHeaderView = headerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.fetchRovers()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rovers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoverTableViewCell.identifier, for: indexPath) as? RoverTableViewCell else {
            return UITableViewCell()
        }
        let rover = viewModel.rovers[indexPath.row]
        cell.configure(with: rover)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        let detailVC = RoverDetailViewController()
//        let selectedItem = viewModel.rovers[indexPath.row]
//        detailVC.selectedItem = selectedItem
//        navigationController?.pushViewController(detailVC, animated: true)
//        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
