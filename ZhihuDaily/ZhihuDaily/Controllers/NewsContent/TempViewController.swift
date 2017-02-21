//
//  TempViewController.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/2/11.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit

class TempViewController: UIViewController {

    var modalTransition: ModalInteractiveTransition!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellow
        modalTransition = ModalInteractiveTransition(controller: self)
        // Do any additional setup after loading the view.
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
