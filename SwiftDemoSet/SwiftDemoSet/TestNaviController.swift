//
//  TestNaviController.swift
//  SwiftDemoSet
//
//  Created by IT A on 2018/9/17.
//  Copyright © 2018年 GT-iOS. All rights reserved.
//

import UIKit
import Closures

class TestNaviController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.random
        self.title = "测试导航条"
        
        let btNext = UIButton(type: .custom).then {
            $0.setTitle("next", for: .normal)
            $0.backgroundColor = UIColor.random
            $0.frame = CGRect(x: 20, y: 200, width: 50, height: 20)
        }
        view.addSubview(btNext)
        btNext.onTap {[weak self] in
            let vc = TestViewController()
            vc.navigationController?.setNavigationBarHidden(true, animated: false)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
