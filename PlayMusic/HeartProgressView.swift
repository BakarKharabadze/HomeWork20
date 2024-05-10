//
//  HeartProgressView.swift
//  PlayMusic
//
//  Created by Bakar Kharabadze on 5/10/24.
//

import UIKit

final class HeartProgressView: UIView {
    private var heartIcons = [UIImageView]()
    private let totalHearts = 5
    private let spacing: CGFloat = 12
    private let heartStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setupHeartStackView()
        setupHearts()
    }
    
    private func setupHeartStackView() {
        heartStackView.distribution = .equalSpacing
        heartStackView.alignment = .center
        heartStackView.spacing = 12
        heartStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(heartStackView)
        
        NSLayoutConstraint.activate([
            heartStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            heartStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func setupHearts() {
        for _ in 0..<totalHearts {
            let imageView = UIImageView(image: UIImage(systemName: "heart"))
            imageView.contentMode = .scaleAspectFit
            heartIcons.append(imageView)
            addSubview(imageView)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for icon in heartIcons {
            heartStackView.addArrangedSubview(icon)
        }
    }
    
    private func updateHearts(for touchLocation: CGPoint) {
        let heartWidth = (frame.width - (spacing * CGFloat(totalHearts - 1))) / CGFloat(totalHearts)
        let index = Int(touchLocation.x / (heartWidth + spacing))
        
        for (i, icon) in heartIcons.enumerated() {
            icon.image = UIImage(systemName: (i <= index) ? "heart.fill" : "heart")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            updateHearts(for: location)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            updateHearts(for: location)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            updateHearts(for: location)
        }
    }
}
