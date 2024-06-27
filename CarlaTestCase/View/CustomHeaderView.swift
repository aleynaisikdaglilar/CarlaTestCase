//
//  CustomHeaderView.swift
//  CarlaTestCase
//
//  Created by Aleyna Işıkdağlılar on 27.06.2024.
//

import UIKit

class CustomHeaderView: UIView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose a Rover to Explore"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    private func setupView() {
        addSubview(titleLabel)
        
        // Set up constraints for titleLabel
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
    }
}
