//
//  ViewController.swift
//  TheDAO
//
//  Created by Chinh Pham N. on 7/2/19.
//  Copyright © 2019 Chinh Pham N. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Computed Properties

    private lazy var demoButton = UIButton({
        // Common
        let viewPoint = self.view.center
        let newPoint = CGPoint(
            x: viewPoint.x - (Config.buttonSize.width / 2),
            y: viewPoint.y)
        $0.frame = CGRect(origin: newPoint, size: Config.buttonSize)
        $0.setTitle("Tap Me!", for: .normal)
        $0.backgroundColor = .blue
    }, {
        // Layer
        $0.layer.cornerRadius = $0.bounds.height / 2
        $0.layer.borderWidth = Config.buttonBorderWidth
        $0.layer.borderColor = UIColor.lightGray.cgColor
    }, {
        // Target action
        $0.addTarget(self, action: #selector(self.handleTapped(_:)), for: .touchUpInside)
    })
    
    private lazy var demoLabel = UILabel({
        let buttonRect = self.demoButton.frame
        $0.frame = CGRect(
            x: buttonRect.minX,
            y: buttonRect.minY - buttonRect.height,
            width: buttonRect.width,
            height: Config.labelHeight)
        
        $0.textAlignment = .center
        $0.text = "Hello World"
    })

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(demoButton)
        view.addSubview(demoLabel)
    }

    // MARK: - Private Functions

    @objc private func handleTapped(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Hello Friend!",
            message: nil,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))

        present(alert, animated: true)
    }
}

// MARK: - Configure

private struct Config {
    static let buttonSize = CGSize(width: 100, height: 40)
    static let labelHeight: CGFloat = 40
    static let buttonBorderWidth: CGFloat = 0.3
}
