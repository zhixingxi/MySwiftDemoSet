//
//  Bundle+Extension.swift
//  SwiftDemoSet
//
//  Created by GT-iOS on 2018/2/10.
//  Copyright © 2018年 GT-iOS. All rights reserved.
//

import Foundation

extension Bundle {
    /// 命名空间
    var nameSpace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
