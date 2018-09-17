//
//  TestViewController.swift
//  SwiftDemoSet
//
//  Created by GT-iOS on 2018/2/10.
//  Copyright © 2018年 GT-iOS. All rights reserved.
//

import UIKit

enum VCType {
    case navi
}

class TestViewController: UIViewController {
    var type: VCType = .navi
    
    let btNext = UIButton(type: .custom).then {
        $0.setTitle("next", for: .normal)
        $0.backgroundColor = UIColor.random
        $0.frame = CGRect(x: 20, y: 200, width: 50, height: 20)
    }
    
    lazy var v: UIView = {
        let v = UIView(frame: view.bounds)
        //不会产生循环引用问题
        v.frame = self.view.bounds
        return v
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switch type {
        case .navi:
//            navigationController?.setNavigationBarHidden(true, animated: false)
            btNext.onTap {[weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        switch type {
        case .navi:
            break
//            navigationController?.setNavigationBarHidden(false, animated: false)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        view.addSubview(btNext)
    }
    deinit {
        NSLog("sffa")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
