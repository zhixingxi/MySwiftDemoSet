//
//  YKNavigationController.swift
//  YinKe
//
//  Created by Allen on 2018/7/26.
//  Copyright © 2018年 Manta. All rights reserved.
//
    

import UIKit

class YKNavigationController: UINavigationController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        let count = childViewControllers.count
        if count > 0 {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(back))
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    //返回
    @objc private func back() {
        self.popViewController(animated: true)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return childViewControllers.count != 1
    }

}
