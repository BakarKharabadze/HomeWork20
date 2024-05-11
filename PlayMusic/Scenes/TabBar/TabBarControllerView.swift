//
//  TabBarControllerView.swift
//  PlayMusic
//
//  Created by Bakar Kharabadze on 5/11/24.
//

import UIKit

final class TabBarContainerView: UIView {
    let customTabBar = UITabBar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(customTabBar)
        setupConstraints()
        customizeTabBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customTabBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            customTabBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            customTabBar.bottomAnchor.constraint(equalTo: bottomAnchor),
            customTabBar.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
    }
    
    private func customizeTabBar() {
        customTabBar.tintColor = .white
        customTabBar.unselectedItemTintColor = UIColor(hex: "#A8BACF")
        customTabBar.backgroundColor = UIColor(hex: "#0A091E")
        customTabBar.layer.cornerRadius = 40
        customTabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        customTabBar.layer.shadowColor = UIColor(hex: "#A8BACF", alpha: 0.1).cgColor
        customTabBar.layer.shadowOffset = CGSize(width: 0, height: -5)
        customTabBar.layer.shadowOpacity = 1
        customTabBar.layer.shadowRadius = 20
    }
}
