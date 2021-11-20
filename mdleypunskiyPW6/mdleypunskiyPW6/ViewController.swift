//
//  ViewController.swift
//  mdleypunskiyPW6
//
//  Created by Maksim on 20.11.2021.
//

import UIKit
import MyLogger1

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setupButtons()
    }
    
    var buttons: [UIButton] = []
    let texts = ["Log (framework)", "Log (swift package)", "Log (pod)", "Log (carthage)"]
    private func setupButtons() {
        var top = view.frame.height / 2 - 90
        for i in 0..<4 {
            let button = UIButton()
            view.addSubview(button)
            button.setTitle(texts[i], for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(top)).isActive = true
            button.widthAnchor.constraint(equalToConstant: 200).isActive = true
            button.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: view.frame.width / 2 - 100
            ).isActive = true
            button.heightAnchor.constraint(equalToConstant: 30).isActive = true
            self.buttons.append(button)
            top += 40
        }
        buttons[0].addTarget(self, action: #selector(logFromFramework), for: .touchUpInside)
    }
    
    @objc
    private func buttonPressed(sender: UIButton) {
        print(sender.titleLabel?.text ?? "Error")
    }
    
    @objc func logFromFramework(_ sender: Any) {
        MyLogger1.log("Hello, World!")
    }


}

