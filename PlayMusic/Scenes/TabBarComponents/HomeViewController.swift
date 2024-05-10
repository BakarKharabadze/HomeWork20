//
//  HomeViewController.swift
//  PlayMusic
//
//  Created by Bakar Kharabadze on 5/10/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Properties
    private let viewModel = HomeViewModel()
    
    private let goToMusicButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to Music Player", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(goToMusicButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#161411")
        setupGoToMusicButton()
        navigateToMusicPage()
    }
    
    // MARK: Setup Methods
    func setupGoToMusicButton() {
        view.addSubview(goToMusicButton)
        NSLayoutConstraint.activate([
            goToMusicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goToMusicButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            goToMusicButton.widthAnchor.constraint(equalToConstant: 400),
            goToMusicButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    // MARK: Navigation Methods
    func navigateToMusicPage() {
        viewModel.navigateToMusicPlayer = { [weak self] in
            guard let self = self else { return }
            let musicPlayerDetailsViewController = MusicPlayerDetailsViewController()
            self.navigationController?.pushViewController(musicPlayerDetailsViewController, animated: true)
        }
    }
    
    // MARK: Button Action
    @objc private func goToMusicButtonTapped() {
        viewModel.goToMusicPlayer()
    }
}

