//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Migue on 26/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemPink,
        .systemRed,
        .systemBlue,
        .systemCyan,
        .systemMint,
        .systemOrange,
        .systemGray
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colors.randomElement()
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x:0,y:0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        getRandomPhoto()
    }
    
    @objc func didTapButton (){
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55)
    }
    
    func getRandomPhoto (){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string:  urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }


}

