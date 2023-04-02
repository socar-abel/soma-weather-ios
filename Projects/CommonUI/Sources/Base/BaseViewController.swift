//
//  BaseViewController.swift
//  CommonUI
//
//  Created by 김상우 on 2023/04/02.
//  Copyright © 2023 soma. All rights reserved.
//

import UIKit
import RxSwift

public protocol BaseViewItemProtocol: AnyObject {
    /// view property 설정 - ex ) view.backgroundColor = .white
    func setupViewProperty()
    
    /// 뷰 계층 구조 설정 - ex ) view.addSubview()
    func setupHierarchy()
    
    /// layout 설정 - ex ) snapkit
    func setupLayout()
}

public protocol BaseViewControllerProtocol: AnyObject, BaseViewItemProtocol {
    /// delegate 설정
    func setupDelegate()
    
    /// view binding 설정
    func setupBind()
}

open class BaseViewController: UIViewController, BaseViewControllerProtocol {
    public let disposeBag = DisposeBag()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable, message: "remove required init")
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViewProperty()
        setupDelegate()
        setupHierarchy()
        setupLayout()
        setupBind()
    }

    open func setupViewProperty() { }
    open func setupDelegate() { }
    open func setupHierarchy() { }
    open func setupLayout() { }
    open func setupBind() { }
}

