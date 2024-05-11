//
//  MusicPlayerDetailsViewModel.swift
//  PlayMusic
//
//  Created by Bakar Kharabadze on 5/10/24.
//

import Foundation

final class MusicPlayerDetailsViewModel {
    
    // MARK: - Properties
    private var playbackStartTime: TimeInterval?
    private var pausedTime: TimeInterval?
    private var playbackTimer: Timer?
    var isPlaying = false
    var totalDuration: TimeInterval = 195
    
    var playbackProgressChanged: ((Float) -> Void)?
    
    // MARK: - Play Control
    func togglePlay() {
        isPlaying.toggle()
        
        if isPlaying {
            if let pausedTime = pausedTime {
                playbackStartTime = Date().timeIntervalSince1970 - pausedTime
            } else {
                playbackStartTime = Date().timeIntervalSince1970
            }
            startPlaybackTimer()
        } else {
            pausedTime = Date().timeIntervalSince1970 - (playbackStartTime ?? 0)
            stopPlaybackTimer()
        }
    }
    
    // MARK: - Playback Timer
    private func startPlaybackTimer() {
        playbackTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.updatePlaybackProgress()
        }
    }
    
    private func stopPlaybackTimer() {
        playbackTimer?.invalidate()
        playbackTimer = nil
    }
    
    private func updatePlaybackProgress() {
        guard let startTime = playbackStartTime else { return }
        
        let currentTime = Date().timeIntervalSince1970 - startTime
        let progress = Float(currentTime / totalDuration)
        
        playbackProgressChanged?(progress)
    }
    
    // MARK: - Time Formatting
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}
