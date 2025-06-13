//
//  ViewController.swift
//  PracticeApp
//
//  Created by Yoon on 6/13/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //    let label = UILabel()
    
    //    let button = UIButton()
    
    let imageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureUI()
    }
    
    private func configureUI() {
        
        view.backgroundColor = .white
        
        //        label.text = "안녕하세요"
        //        label.textColor = .black
        //        //Snakit사용하면 이 구문 생략가능
        //        label.translatesAutoresizingMaskIntoConstraints = false
        //        view.addSubview(label)
        //        NSLayoutConstraint.activate([
        //            label.widthAnchor.constraint(equalToConstant: 80),
        //            label.heightAnchor.constraint(equalToConstant: 40),
        //            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        //        ])
        
        //        label.snp.makeConstraints {
        //            $0.width.height.equalTo(80)
        //            $0.height.equalTo(40)
        //            $0.center.equalToSuperview()
        //        }
        
        
        //        button.setTitle( "Click", for: .normal)
        //        button.setTitleColor( .white, for: .normal)
        //        button.backgroundColor = .red
        ////        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.layer.cornerRadius = 10
        //
        //        view.addSubview(button)
        //        NSLayoutConstraint.activate([
        //            button.widthAnchor.constraint(equalToConstant: 120),
        //            button.heightAnchor.constraint(equalToConstant: 60),
        //            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        //        ])
        
        //        button.snp.makeConstraints {
        //            $0.width.height.equalTo(120)
        //            $0.height.equalTo(60)
        //            $0.center.equalToSuperview()
        //        }
        
        
        imageView.image = UIImage(named: "inari")
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        
        //        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        //
        //        NSLayoutConstraint.activate([
        //            imageView.widthAnchor.constraint(equalToConstant: 300),
        //            imageView.heightAnchor.constraint(equalToConstant: 300),
        //            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        //        ])
        
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(300)
            $0.center.equalToSuperview()
        }
    }
    
    
}

