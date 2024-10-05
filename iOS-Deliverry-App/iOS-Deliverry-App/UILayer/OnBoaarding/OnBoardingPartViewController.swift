//
//  OnBoardingPartViewController.swift
//  iOS-Deliverry-App
//
//  Created by MIKHAIL ZHACHKO on 5.10.24.
//

import UIKit

class OnBoardingPartViewController: UIViewController {
    //MARK: - Properties
    var imageToShow: UIImage? {
        didSet{
            imageView.image = imageToShow
        }
    }
    var titleText: String? {
        didSet{
            titleView.text = titleText
        }
    }
    var descriptionText: String? {
        didSet {
            descriptionView.text = descriptionText
        }
    }
    var buttonText: String?

    
    //MARK: - Views
    private let imageView = UIImageView()
    private let titleView = UILabel()
    private let descriptionView = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()

    }
}

private extension OnBoardingPartViewController {
    
    func setupImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    func setupTitleView() {
        view.addSubview(titleView)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.font = .Roboto.bold.size(of: 24)
        titleView.textColor = AppColors.white
        titleView.textAlignment = .center
        titleView.numberOfLines = 0
        
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    func setupDescriptionView() {
        view.addSubview(descriptionView)
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.font = .Roboto.regular.size(of: 14)
        descriptionView.textColor = AppColors.white
        descriptionView.textAlignment = .center
        descriptionView.numberOfLines = 0
        
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 23),
            descriptionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 71),
            descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -72)
        ])
    }
    
    func setupView() {
        view.backgroundColor = AppColors.accentOrange
    }
    
    func setupLayout() {
        setupView()
        setupImageView()
        setupTitleView()
        setupDescriptionView()
        
        
    }
}
