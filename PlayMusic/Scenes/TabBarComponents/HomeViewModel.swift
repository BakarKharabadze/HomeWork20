//
//  HomeViewModel.swift
//  PlayMusic
//
//  Created by Bakar Kharabadze on 5/10/24.
//

import Foundation

class HomeViewModel {
    var navigateToMusicPlayer: (() -> Void)?
    
    func goToMusicPlayer() {
        navigateToMusicPlayer?()
    }
}
