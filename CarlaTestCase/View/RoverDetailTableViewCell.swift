//
//  RoverDetailTableViewCell.swift
//  CarlaTestCase
//
//  Created by Aleyna Işıkdağlılar on 27.06.2024.
//

import UIKit

class RoverDetailTableViewCell: UITableViewCell {
    
    static let identifier = "RoverDetailTableViewCell"
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 82/255, green: 82/255, blue: 100/255, alpha: 1.0)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.backgroundColor = .orange
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 82/255, green: 82/255, blue: 100/255, alpha: 1.0)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 82/255, green: 82/255, blue: 100/255, alpha: 1.0)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.backgroundColor = .green
        return label
    }()
    
    private func prepareUI() {
        contentView.addSubview(image)
        contentView.addSubview(idLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            image.widthAnchor.constraint(equalToConstant: 180),
            
            idLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
            idLabel.topAnchor.constraint(equalTo: image.topAnchor),
            idLabel.widthAnchor.constraint(equalToConstant: 150),
            idLabel.heightAnchor.constraint(equalToConstant: 35),
            
            nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 150),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),

        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .gray
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with camera: Cameras) {
        nameLabel.text = camera.full_name
    }
}
