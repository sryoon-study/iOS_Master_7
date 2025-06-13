//
//  ViewController.swift
//  PracticeApp
//
//  Created by Yoon on 6/13/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        
        view.backgroundColor = .white
        
        button.setTitle("Click", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonClicked), for: .touchDown)
        
        view.addSubview(button)
        
        button.snp.makeConstraints {
            $0.width.equalTo(120)
            $0.height.equalTo(60)
            $0.center.equalToSuperview()
        }
        
    }
    
    // #selector안에 넣으려면 @objc
    @objc
    private func buttonClicked() {
        print("Button Clicked")
        
    }
    
    
}

