//
//  RoverTableViewCell.swift
//  CarlaTestCase
//
//  Created by Aleyna Işıkdağlılar on 26.06.2024.
//

import UIKit

class RoverTableViewCell: UITableViewCell {

    private enum Constant {
        static let titleLabelClr = UIColor(red: 83/255, green: 41/255, blue: 40/255, alpha: 1.0)
        static let activeButtonBorderClr = UIColor(red: 94/255, green: 168/255, blue: 123/255, alpha: 1.0).cgColor
        static let activeButtonBackgroundClr = UIColor(red: 220/255, green: 247/255, blue: 233/255, alpha: 1.0)
        static let dateColor = UIColor(red: 82/255, green: 82/255, blue: 100/255, alpha: 1.0)
        static let activeButtonTitle = UIColor(red: 94/255, green: 168/255, blue: 123/255, alpha: 1.0)
        static let completeButtonTitle = UIColor(red: 177/255, green: 54/255, blue: 52/255, alpha: 1.0)
        static let completeButtonBackgrounClr = UIColor(red: 249/255, green: 230/255, blue: 229/255, alpha: 1.0)
        static let cornerRadius = CGFloat(10)
    }

    static let identifier = "RoverTableViewCell"
    
    private let roverCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Constant.cornerRadius
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var image: CachedImageView = {
        let imageView = CachedImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Constant.cornerRadius
        imageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        return imageView
    }()
    
    private lazy var stackViewVertical: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.cornerRadius = Constant.cornerRadius
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 1
        label.textColor = Constant.titleLabelClr
        return label
    }()
    
    private let stackViewHorizontalForDates: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    private let stackViewHorizontalForDatesData: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var landingDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constant.dateColor
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.numberOfLines = 1
        label.text = "Landing Date:"
        return label
    }()
    
    private lazy var landingDateDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constant.dateColor
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var launchDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constant.dateColor
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.numberOfLines = 1
        label.text = "Launch Date: "
        return label
    }()
    
    private lazy var launchDateDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constant.dateColor
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    private let stackViewHorizontalBottom: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private lazy var statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
        button.layer.cornerRadius = 7
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        button.tintColor = Constant.titleLabelClr
        button.contentHorizontalAlignment = .right
        return button
    }()
    
    
    private func prepareUI() {
        contentView.addSubview(roverCell)
        roverCell.addSubview(image)
        roverCell.addSubview(stackViewVertical)
        
        stackViewVertical.addArrangedSubview(titleLabel)
        stackViewVertical.addArrangedSubview(stackViewHorizontalForDates)
        stackViewVertical.addArrangedSubview(stackViewHorizontalForDatesData)
        
        stackViewHorizontalForDates.addArrangedSubview(landingDateLabel)
        stackViewHorizontalForDates.addArrangedSubview(launchDateLabel)
        
        stackViewHorizontalForDatesData.addArrangedSubview(landingDateDataLabel)
        stackViewHorizontalForDatesData.addArrangedSubview(launchDateDataLabel)
        
        stackViewVertical.addArrangedSubview(stackViewHorizontalBottom)
        
        stackViewHorizontalBottom.addArrangedSubview(statusButton)
        stackViewHorizontalBottom.addArrangedSubview(nextButton)
        
        NSLayoutConstraint.activate([
            roverCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            roverCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            roverCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            roverCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            image.topAnchor.constraint(equalTo: roverCell.topAnchor),
            image.leadingAnchor.constraint(equalTo: roverCell.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: roverCell.bottomAnchor),
            image.widthAnchor.constraint(equalToConstant: 130),
            
            stackViewVertical.topAnchor.constraint(equalTo: roverCell.topAnchor),
            stackViewVertical.leadingAnchor.constraint(equalTo: image.trailingAnchor),
            stackViewVertical.bottomAnchor.constraint(equalTo: roverCell.bottomAnchor),
            stackViewVertical.trailingAnchor.constraint(equalTo: roverCell.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: stackViewVertical.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor, constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: stackViewHorizontalForDates.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),

            stackViewHorizontalForDates.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            stackViewHorizontalForDates.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor, constant: 5),
            stackViewHorizontalForDates.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor, constant: -5),
            stackViewHorizontalForDates.heightAnchor.constraint(equalToConstant: 40),

            stackViewHorizontalForDatesData.topAnchor.constraint(equalTo: stackViewHorizontalForDates.bottomAnchor, constant: -20),
            stackViewHorizontalForDatesData.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor, constant: 5),
            stackViewHorizontalForDatesData.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor, constant: -5),
            stackViewHorizontalForDatesData.heightAnchor.constraint(equalToConstant: 40),
            
            landingDateLabel.leadingAnchor.constraint(equalTo: stackViewHorizontalForDates.leadingAnchor),
            landingDateLabel.topAnchor.constraint(equalTo: stackViewHorizontalForDates.topAnchor),

            launchDateLabel.trailingAnchor.constraint(equalTo: stackViewHorizontalForDates.trailingAnchor, constant: -15),
            launchDateLabel.topAnchor.constraint(equalTo: stackViewHorizontalForDates.topAnchor),
            
            landingDateDataLabel.leadingAnchor.constraint(equalTo: stackViewHorizontalForDatesData.leadingAnchor),
            landingDateDataLabel.topAnchor.constraint(equalTo: stackViewHorizontalForDatesData.topAnchor),

            launchDateDataLabel.trailingAnchor.constraint(equalTo: stackViewHorizontalForDatesData.trailingAnchor, constant: -15),
            launchDateDataLabel.topAnchor.constraint(equalTo: stackViewHorizontalForDatesData.topAnchor),
            
            stackViewHorizontalBottom.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor, constant: 5),
            stackViewHorizontalBottom.bottomAnchor.constraint(equalTo: stackViewVertical.bottomAnchor, constant: -10),
            stackViewHorizontalBottom.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor),
            stackViewHorizontalBottom.topAnchor.constraint(equalTo: stackViewHorizontalForDatesData.bottomAnchor, constant: 10)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateButtonColor(for title: String) {
            switch title.lowercased() {
            case "active":
                statusButton.layer.borderColor = Constant.activeButtonTitle.cgColor
                statusButton.backgroundColor = Constant.activeButtonBackgroundClr
                statusButton.setTitleColor(Constant.activeButtonTitle, for: .normal)
            case "complete":
                statusButton.layer.borderColor = Constant.completeButtonTitle.cgColor
                statusButton.backgroundColor = Constant.completeButtonBackgrounClr
                statusButton.setTitleColor(Constant.completeButtonTitle, for: .normal)
            default:
                statusButton.backgroundColor = .gray
            }
        }
    
    public func configure(with rovers: Rovers) {
        titleLabel.text = rovers.name
        landingDateDataLabel.text = rovers.landing_date
        launchDateDataLabel.text = rovers.launch_date
        updateButtonColor(for: rovers.status)
        statusButton.setTitle(rovers.status, for: .normal)
        image.loadImage(from: "https://mars-photos.herokuapp.com/explore/images/" + rovers.name + "_rover.jpg", placeholder: UIImage(named: "placeholder"))
    }
}
