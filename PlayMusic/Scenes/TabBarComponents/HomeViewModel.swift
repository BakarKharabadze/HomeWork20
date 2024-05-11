//
//  HomeViewModel.swift
//  PlayMusic
//
//  Created by Bakar Kharabadze on 5/10/24.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func navigateToMusicPlayer()
}

final class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?

    func goToMusicPlayer() {
        delegate?.navigateToMusicPlayer()
    }
}
