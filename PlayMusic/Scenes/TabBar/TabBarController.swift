//
//  TabBarController.swift
//  PlayMusic
//
//  Created by Bakar Kharabadze on 5/10/24.
//

import UIKit

final class TabBarController: UITabBarController {
    private let customTabBarView = UIView()
    private var tabButtons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isHidden = true
        setupCustomTabBar()
        setupViewControllers()
    }
    
    private func setupCustomTabBar() {
        customTabBarView.backgroundColor = UIColor(hex: "#0A091E")
        customTabBarView.layer.cornerRadius = 20
        customTabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        customTabBarView.layer.shadowColor = UIColor.black.cgColor
        customTabBarView.layer.shadowOffset = CGSize(width: 0, height: -5)
        customTabBarView.layer.shadowOpacity = 0.1
        customTabBarView.layer.shadowRadius = 20
        
        view.addSubview(customTabBarView)
        customTabBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customTabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            customTabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            customTabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customTabBarView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        setupTabButtons()
    }
    
    private func setupTabButtons() {
        let images = ["house", "music.note", "heart"]
        
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        
        for (index, image) in images.enumerated() {
            let button = UIButton(type: .system)
            button.setImage(UIImage(systemName: image), for: .normal)
            button.tintColor = UIColor(hex: "#A8BACF")
            button.tag = index
            button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
            tabButtons.append(button)
            stackView.addArrangedSubview(button)
        }
        
        customTabBarView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: customTabBarView.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: customTabBarView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: customTabBarView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: customTabBarView.bottomAnchor)
        ])
    }
    
    @objc private func tabButtonTapped(_ sender: UIButton) {
        selectedIndex = sender.tag
        animateIcon(sender)
    }
    
    private func animateIcon(_ button: UIButton) {
        tabButtons.forEach { $0.transform = .identity }
        
        UIView.animate(withDuration: 0.25) {
            button.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
    }
    
    private func setupViewControllers() {
        let homeViewController = HomeViewController()
        let musicViewController = MusicPlayerDetailsViewController()
        let heartViewController = HomeViewController()
        
        homeViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 0)
        musicViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "music.note"), tag: 1)
        
        heartViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "heart"), tag: 2)
        
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let musicNavigationController = UINavigationController(rootViewController: musicViewController)
        let heartNavigationViewController = UINavigationController(rootViewController: heartViewController)
        
        viewControllers = [homeNavigationController, musicNavigationController, heartNavigationViewController]
    }
}


