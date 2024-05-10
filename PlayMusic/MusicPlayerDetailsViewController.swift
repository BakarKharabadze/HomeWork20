//
//  MusicPlayerDetailsViewController.swift
//  PlayMusic
//
//  Created by Bakar Kharabadze on 5/10/24.
//

import UIKit

class MusicPlayerDetailsViewController: UIViewController {
    
    private let mainStackView = UIStackView()
    private let heartProgressView = HeartProgressView()
    private let songImageStackView = UIStackView()
    private let songImage = UIImageView()
    private let songNameLabel = UILabel()
    private let singersName = UILabel()
    private let progressSlider = UISlider()
    private let songDurationStackView = UIStackView()
    private let durationLabel = UILabel()
    private let progressTimeLabel = UILabel()
    private let componentsStackView = UIStackView()
    private let shuffleImage = UIImageView()
    private let backImage = UIImageView()
    private let playButton = UIButton()
    private let forwardImage = UIImageView()
    private let repeatImage = UIImageView()
    private let circularProgressView = CircularProgressView()
    private var isPlaying = false
    private var playbackStartTime: TimeInterval?
    private var playbackTimer: Timer?
    private var totalDuration: TimeInterval = 0
    private var pausedTime: TimeInterval?
    private var songImageWidthConstraint = NSLayoutConstraint()
    private var songImageHeightConstraint = NSLayoutConstraint()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setup()
        totalDuration = 195
    }
    
    private func setup() {
        setupMainStackView()
        setupHeartProgressView()
        setupSongImageStackView()
        setupSongImage()
        setupLoadingAnimation()
        setupSongNameLabel()
        setupSingersName()
        setupProgressSlider()
        setupSongDurationStackView()
        setupProgressTimeLabel()
        setupDurationLabel()
        setupComponentsStackView()
        setupShuffleImage()
        setupBackImage()
        setupPlayButton()
        setupForwardImage()
        setupRepeatImage()
        
        
        setupCustomSpacing()
    }
    
    private func setupCustomSpacing() {
        mainStackView.setCustomSpacing(34, after: songImageStackView)
        mainStackView.setCustomSpacing(8, after: songNameLabel)
        mainStackView.setCustomSpacing(34, after: singersName)
        mainStackView.setCustomSpacing(1, after: progressSlider)
    }
    
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        
    }
    
    private func setupHeartProgressView() {
        heartProgressView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(heartProgressView)
        
        heartProgressView.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    private func setupSongImageStackView() {
        mainStackView.addArrangedSubview(songImageStackView)
        
        songImageStackView.alignment = .center
        songImageStackView.axis = .vertical
        songImageStackView.isLayoutMarginsRelativeArrangement = true
        songImageStackView.layoutMargins = UIEdgeInsets(top: 34, left: 36, bottom: 0, right: 36)
        songImageStackView.spacing = 15
    }
    
    private func setupSongImage() {
        songImageStackView.addArrangedSubview(songImage)
        
        songImage.image = UIImage(named: "songImage")
        
        songImageWidthConstraint = songImage.widthAnchor.constraint(equalToConstant: 304)
        songImageHeightConstraint = songImage.heightAnchor.constraint(equalToConstant: 320)
        
        songImage.translatesAutoresizingMaskIntoConstraints = false
        songImageWidthConstraint.isActive = true
        songImageHeightConstraint.isActive = true
    }
    
    private func setupSongNameLabel() {
        songNameLabel.text = "So Long, London"
        songNameLabel.textColor = .white
        songNameLabel.textAlignment = .center
        songNameLabel.font = .systemFont(ofSize: 24)
        
        mainStackView.addArrangedSubview(songNameLabel)
    }
    
    private func setupSingersName() {
        singersName.text = "Taylor Swift"
        singersName.textColor = UIColor(named: "Color")
        singersName.textAlignment = .center
        singersName.font = .systemFont(ofSize: 18)
        
        mainStackView.addArrangedSubview(singersName)
    }
    
    private func setupProgressSlider() {
        progressSlider.minimumValue = 0.0
        progressSlider.maximumValue = 1.0
        progressSlider.value = 0.0
        progressSlider.thumbTintColor = .clear
        progressSlider.minimumTrackTintColor = .white
        progressSlider.maximumTrackTintColor = .gray
        
        mainStackView.addArrangedSubview(progressSlider)
    }
    
    private func setupSongDurationStackView() {
        mainStackView.addArrangedSubview(songDurationStackView)
        
        songDurationStackView.isLayoutMarginsRelativeArrangement = true
        songDurationStackView.layoutMargins.top = -12
        songDurationStackView.distribution = .equalSpacing
    }
    
    private func setupProgressTimeLabel() {
        progressTimeLabel.text = "0:00"
        progressTimeLabel.textColor = .white
        progressTimeLabel.font = .systemFont(ofSize: 14)
        
        songDurationStackView.addArrangedSubview(progressTimeLabel)
    }
    
    private func setupDurationLabel() {
        durationLabel.text = "3:15"
        durationLabel.textColor = .white
        durationLabel.font = .systemFont(ofSize: 14)
        songDurationStackView.addArrangedSubview(durationLabel)
        
    }
    
    private func setupComponentsStackView() {
        mainStackView.addArrangedSubview(componentsStackView)
        
        componentsStackView.alignment = .center
        componentsStackView.distribution = .fillProportionally
        componentsStackView.isLayoutMarginsRelativeArrangement = true
        componentsStackView.layoutMargins.top = 34
        componentsStackView.spacing = 40
        
    }
    
    private func setupShuffleImage() {
        shuffleImage.image = UIImage(named: "shuffle")
        shuffleImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        shuffleImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        componentsStackView.addArrangedSubview(shuffleImage)
        
    }
    
    private func setupBackImage() {
        backImage.image = UIImage(named: "skipBack")
        backImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        backImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        componentsStackView.addArrangedSubview(backImage)
        
    }
    
    private func setupPlayButton() {
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.widthAnchor.constraint(equalToConstant: 74).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 74).isActive = true
        playButton.layer.cornerRadius = 37
        playButton.clipsToBounds = true
        
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
        componentsStackView.addArrangedSubview(playButton)
        
        updatePlayButtonAppearance()
    }
    
    private func updatePlayButtonAppearance() {
        let iconImage = isPlaying ? UIImage(systemName: "pause.fill") : UIImage(systemName: "play.fill")
        let iconImageView = UIImageView(image: iconImage)
        iconImageView.tintColor = .white
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        playButton.backgroundColor = .blue
        
        playButton.subviews.forEach { $0.removeFromSuperview() }
        playButton.addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: playButton.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc private func playButtonTapped() {
        isPlaying.toggle()
        
        if isPlaying {
            if let pausedTime = pausedTime {
                playbackStartTime = Date().timeIntervalSince1970 - pausedTime
            } else {
                playbackStartTime = Date().timeIntervalSince1970
            }
            
            animateSongImageSize(to: CGSize(width: 200, height: 200))
            
            circularProgressView.isHidden = false
            circularProgressView.setProgressWithAnimation(duration: 0.5, value: 100)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.circularProgressView.isHidden = true
                self.startProgressBarAnimation()
                self.animateSongImageSize(to: CGSize(width: 304, height: 320))
            }
            
            startPlaybackTimer()
        } else {
            pausedTime = Date().timeIntervalSince1970 - (playbackStartTime ?? 0)
            stopPlaybackTimer()
            animateSongImageSize(to: CGSize(width: 200, height: 200))
        }
        
        updatePlayButtonAppearance()
    }
    
    private func startProgressBarAnimation() {
        let duration = totalDuration - (pausedTime ?? 0)
        UIView.animate(withDuration: duration) {
            self.progressSlider.value = 1.0
        }
    }
    
    private func animateSongImageSize(to size: CGSize) {
        UIView.animate(withDuration: 0.3) {
            self.songImageWidthConstraint.constant = size.width
            self.songImageHeightConstraint.constant = size.height
            self.view.layoutIfNeeded()
        }
    }
    
    private func setupLoadingAnimation() {
        circularProgressView.translatesAutoresizingMaskIntoConstraints = false
        circularProgressView.isHidden = true
        songImageStackView.addArrangedSubview(circularProgressView)
        
        circularProgressView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        circularProgressView.widthAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
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
        progressSlider.value = Float(currentTime / totalDuration)
        
        let progressTimeText = formatTime(currentTime)
        progressTimeLabel.text = progressTimeText
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    private func setupForwardImage() {
        forwardImage.image = UIImage(named: "forward")
        forwardImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        forwardImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        componentsStackView.addArrangedSubview(forwardImage)
    }
    
    private func setupRepeatImage() {
        repeatImage.image = UIImage(named: "repeat")
        repeatImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        repeatImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        componentsStackView.addArrangedSubview(repeatImage)
        
    }
    
}

#Preview {
    MusicPlayerDetailsViewController()
}
