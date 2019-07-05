//
//  ViewController.swift
//  ImageAnimateMemory
//
//  Created by 公平 on 2019/7/4.
//  Copyright © 2019 ppy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var magicView :MagicView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        magicView = MagicView.init(CGRect.init(x: 50, y: 100, width: 260, height: 260),true )
        self.view.addSubview(magicView!)
        magicView!.startAnimations(0)
        
        let btn = UIButton.init(type: .custom)
        btn.setTitle("stop", for: .normal)
        self.view.addSubview(btn)
        btn.frame = CGRect.init(x: 100, y: 300, width: 100, height: 50)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(stopAction), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }


    @objc func stopAction(){
       
        magicView!.mg_stopAnimation()
        
    }
}

