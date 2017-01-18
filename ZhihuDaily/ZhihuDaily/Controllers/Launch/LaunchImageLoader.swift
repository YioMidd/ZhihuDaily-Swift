//
//  LaunchImageLoader.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/14.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation

class LaunchImageLoader: NSObject {

    override init() {
        super.init()
    }
    
    func getLaunchImageDict() -> Dictionary<String, Any> {
        let imageData: Data? = UserDefaults.standard.data(forKey: UserDefaultLaunchImageKey)
        let copyRight: String? = UserDefaults.standard.string(forKey: UserDefaultLaunchImageCopyRightKey)
        var dict = Dictionary<String, Any>()
        if imageData == nil && copyRight == nil {
            dict[UserDefaultLaunchImageCopyRightKey] = " "
            dict[UserDefaultLaunchImageKey] = UIImage(named: "Splash_Image")
        }else {
            dict[UserDefaultLaunchImageCopyRightKey] = copyRight
            dict[UserDefaultLaunchImageKey] = UIImage(data: imageData!)
        }
        
        
        HTTPRequestClient().send(HTTPRequest(url: url_launchImage(750, 1334), method: .GET, parameters: nil)) { response in
            if let json = response.rawData {
                UserDefaults.standard.set(json["text"], forKey: UserDefaultLaunchImageCopyRightKey)
                let data: Data? = try? Data.init(contentsOf: URL(string: json["img"] as! String)!)
                UserDefaults.standard.set(data, forKey: UserDefaultLaunchImageKey)
                UserDefaults.standard.synchronize()
            }
        }
        
        return dict
    }
}
