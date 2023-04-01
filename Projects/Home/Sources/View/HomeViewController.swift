//
//  HomeViewController.swift
//  Home
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import UIKit

public class HomeViewController: UIViewController {
    let viewModel: HomeViewModel
    
    public init(homeViewModel: HomeViewModel) {
        self.viewModel = homeViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}
