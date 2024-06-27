//
//  RoverDetailViewController.swift
//  CarlaTestCase
//
//  Created by Aleyna Işıkdağlılar on 26.06.2024.
//

import UIKit

class RoverDetailViewController: UIViewController {
    
    var cameraCount: Int = 0
    var rover: Rovers?
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private lazy var numberOfCamerasLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 82/255, green: 82/255, blue: 100/255, alpha: 1.0)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var numberOfPhotosLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 82/255, green: 82/255, blue: 100/255, alpha: 1.0)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.register(RoverDetailTableViewCell.self, forCellReuseIdentifier: RoverDetailTableViewCell.identifier)
        return tableView
    }()
    
    private func prepareUI() {
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = .systemBackground
        view.addSubview(image)
        view.addSubview(numberOfCamerasLabel)
        view.addSubview(numberOfPhotosLabel)
        view.addSubview(tableView)
        
        let safeGuide = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
            image.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            image.heightAnchor.constraint(equalToConstant: 200),
            
            numberOfCamerasLabel.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 30),
            numberOfCamerasLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            
            numberOfPhotosLabel.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 30),
            numberOfPhotosLabel.topAnchor.constraint(equalTo: numberOfCamerasLabel.bottomAnchor, constant: 10),
            
            tableView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 30),
            tableView.topAnchor.constraint(equalTo: numberOfPhotosLabel.bottomAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        viewModel.
    }
    
    private func formatTotalPhotos(totalPhotos: Int) -> NSAttributedString {
        let mediumFont = UIFont.systemFont(ofSize: 15, weight: .medium)
        let boldFont = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        let attributedString = NSMutableAttributedString(string: "Number Of Photos: ", attributes: [.font: mediumFont])
        attributedString.append(NSAttributedString(string: String(totalPhotos), attributes: [.font: boldFont]))
        
        return attributedString
    }
    
    private func formatTotalCameras(totalCameras: Int) -> NSAttributedString {
        let mediumFont = UIFont.systemFont(ofSize: 15, weight: .medium)
        let boldFont = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        let attributedString = NSMutableAttributedString(string: "Number Of Cameras: ", attributes: [.font: mediumFont])
        attributedString.append(NSAttributedString(string: String(totalCameras), attributes: [.font: boldFont]))
        
        return attributedString
    }
    
    public func configure(with rovers: Rovers) {
        self.rover = rovers
        cameraCount = rovers.cameras.count
        numberOfPhotosLabel.attributedText = formatTotalPhotos(totalPhotos: rovers.total_photos)
        numberOfCamerasLabel.attributedText = formatTotalCameras(totalCameras: rovers.cameras.count)
    }
}

extension RoverDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cameraCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoverDetailTableViewCell.identifier, for: indexPath) as? RoverDetailTableViewCell else {
            return UITableViewCell()
        }
        if let rover = rover {
            let camera = rover.cameras[indexPath.row]
            cell.configure(with: camera)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
