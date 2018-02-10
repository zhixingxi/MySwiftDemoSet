//
//  ViewController.swift
//  SwiftDemoSet
//
//  Created by GT-iOS on 2018/2/10.
//  Copyright © 2018年 GT-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let cellId = "cellId"
    private let demoTitle = "demoTitle"
    private let desController = "desController"
    private var dataArray: NSMutableArray = NSMutableArray()
    lazy var tableView: UITableView = {
        let tab: UITableView = UITableView(frame: self.view.bounds, style: .plain)
        tab.delegate = self;
        tab.dataSource = self;
        return tab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "demo列表"
        dataArray.addObjects(from: getData() as! [Any])
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        cell?.selectionStyle = .none
        let dict = dataArray[indexPath.row] as? NSDictionary
        cell?.textLabel?.text = dict?[demoTitle] as? String
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dict = dataArray[indexPath.row] as? NSDictionary,
            let clsName = dict[desController] as? String,
            let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? UIViewController.Type else {return}
        let vc = cls.init()
        navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - data
extension ViewController {
    fileprivate func getData() -> NSArray {
        guard let dataPath = Bundle.main.path(forResource: "MyInfoList", ofType: "plist") else {return NSArray()}
        return NSArray(contentsOfFile: dataPath) ?? NSArray();
    }
}

