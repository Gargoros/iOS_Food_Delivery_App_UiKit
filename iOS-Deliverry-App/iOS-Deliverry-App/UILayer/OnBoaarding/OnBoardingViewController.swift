//
//  OnBoardingViewController.swift
//  iOS-Deliverry-App
//
//  Created by MIKHAIL ZHACHKO on 5.10.24.
//

import UIKit

//MARK: - OnBoardingViewController
class OnBoardingViewController: UIViewController {
    //MARK: - Properties
    private var pages = [OnBoardingPartViewController]()
    
    //MARK: - Views
    private let pageViewController: UIPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl()
    private let bottomButtonView = UIButton()
    var viewOutput: OnBoardingViewOutput!
    
    init(
        pages: [OnBoardingPartViewController] = [OnBoardingPartViewController](),
        viewOutput: OnBoardingViewOutput!) {
            self.pages = pages
            self.viewOutput = viewOutput
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
    }
}
//MARK: - ACTIONS
private extension OnBoardingViewController {
    @objc func buttonPressed() {
        switch pageControl.currentPage {
        case 0:
            pageControl.currentPage = 1
            pageViewController.setViewControllers([pages[1]], direction: .forward, animated: true, completion: nil)
            bottomButtonView.setTitle(pages[1].buttonText, for: .normal)
        case 1:
            pageControl.currentPage = 2
            pageViewController.setViewControllers([pages[2]], direction: .forward, animated: true, completion: nil)
            bottomButtonView.setTitle(pages[2].buttonText, for: .normal)
        case 2:
            pageControl.currentPage = 3
            pageViewController.setViewControllers([pages[3]], direction: .forward, animated: true, completion: nil)
            bottomButtonView.setTitle(pages[3].buttonText, for: .normal)
        case 3:
            print("Exit")
            viewOutput.OnboardingFinish()
        default:
            break
        }
    }
}

//MARK: - LAYOUT
private extension OnBoardingViewController {
    func setupLayout(){
        setupPageViewController()
        setupPageControl()
        setupButton()
    }
    
    func setupPageViewController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.view.backgroundColor = AppColors.accentOrange
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        let page = pages[0]
        let title = page.buttonText
        bottomButtonView.setTitle(title, for: .normal)
        
        pageControl.isUserInteractionEnabled = false
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -45)
        ])
    }
    
    func setupButton() {
        view.addSubview(bottomButtonView)
        bottomButtonView.translatesAutoresizingMaskIntoConstraints = false
        bottomButtonView.backgroundColor = AppColors.gray
        bottomButtonView.setTitleColor(AppColors.black, for: .normal)
        bottomButtonView.titleLabel?.font = .Roboto.bold.size(of: 18)
        bottomButtonView.layer.cornerRadius = 16
        bottomButtonView.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            bottomButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomButtonView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            bottomButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomButtonView.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: -44),
            bottomButtonView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

//MARK: - UIPageViewControllerDataSource DELEGATES
extension OnBoardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnBoardingPartViewController), currentIndex > 0 else { return nil }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnBoardingPartViewController), currentIndex < pages.count - 1 else { return nil }
        return pages[currentIndex + 1]
    }
    
    
}

//MARK: - UIPageViewControllerDataSource DELEGATE
extension OnBoardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first! as! OnBoardingPartViewController) {
            pageControl.currentPage = index
            let page = pages[index]
            let title = page.buttonText
            bottomButtonView.setTitle(title, for: .normal)
            
        }
    }
}
