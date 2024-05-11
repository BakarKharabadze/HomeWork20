//
//  HomeViewController.swift
//  PlayMusic
//
//  Created by Bakar Kharabadze on 5/10/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: Properties
    private let viewModel = HomeViewModel()
    private let goToMusicButton = UIButton(type: .system)
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        view.backgroundColor = UIColor(hex: "#161411")
        setupGoToMusicButton()
    }
    
    // MARK: Setup Methods
    private func setupGoToMusicButton() {
            goToMusicButton.setTitle("Go to Music Player", for: .normal)
            goToMusicButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            goToMusicButton.setTitleColor(.white, for: .normal)
            goToMusicButton.backgroundColor = .blue
            goToMusicButton.layer.cornerRadius = 25
            goToMusicButton.addTarget(self, action: #selector(goToMusicButtonTapped), for: .touchUpInside)
            goToMusicButton.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(goToMusicButton)
            NSLayoutConstraint.activate([
                goToMusicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                goToMusicButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                goToMusicButton.widthAnchor.constraint(equalToConstant: 400),
                goToMusicButton.heightAnchor.constraint(equalToConstant: 80)
            ])
        }
        
    // MARK: Button Action
    @objc private func goToMusicButtonTapped() {
        viewModel.goToMusicPlayer()
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func navigateToMusicPlayer() {
        let musicPlayerDetailsViewController = MusicPlayerDetailsViewController()
        navigationController?.pushViewController(musicPlayerDetailsViewController, animated: true)
    }
}
