//
//  MagicView.swift
//  Astrology
//
//  Created by 公平 on 2019/6/27.
//  Copyright © 2019 ppy. All rights reserved.
//

import UIKit
import Masonry

enum MagicViewType {
    case MagicBall
    case Cookies
}
class MagicView: UIView {

    var count = 0
    var timer:Timer?
    var imgView:UIImageView?
    var isAnimating = false
    var magicType:MagicViewType?
    var isRepeat = true
    var bundlePath = Bundle.init()
    
    static let Cookie_AnimationTime = 5
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    init(_ frame:CGRect, _ animRepeat:Bool ) {
        count = 15
        isRepeat = animRepeat
        super.init(frame: frame)
        bundlePath = self.getBundlePath("mgicResource")

        initSubviews()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()

    }
    func initSubviews()  {
        
        self.imgView = UIImageView()
        self.addSubview(self.imgView!)
        self.imgView!.mas_makeConstraints { (make) in
            make?.edges.equalTo()(self)
        }
    }
    // MARK: ---- cookie动画
    func startAnimations(_ repeatCount:Int) {
        var stringCount = ""
        var imgArr = [UIImage]()
        var imag:UIImage?

        for index in 15..<107{
            stringCount =  index < 100 ? String(format: "000%d", index) : String(format: "00%d", index)
            let imagePath =    bundlePath.path(forResource: "load_\(stringCount)", ofType: "png")
            imag = UIImage.init(contentsOfFile: imagePath ?? "")
//             imag = UIImage.init(named:"load_\(stringCount)" )
            imgArr.append(imag!)
        }
        self.beginAnimate(imgArr, TimeInterval(MagicView.Cookie_AnimationTime),repeatCount)
    }
    
    
    func beginAnimate(_ imgArr:Array<UIImage>,_ animateTime:TimeInterval,_ repeatCount:Int)  {
        self.imgView?.animationImages = imgArr
        self.imgView?.animationDuration = animateTime
        self.imgView?.animationRepeatCount = repeatCount
        self.imgView?.startAnimating()
    }
    
    //动画结束
    func mg_stopAnimation() {
        self.imgView?.stopAnimating()
        self.imgView?.animationImages = nil
    }
    
    
    
    func getBundlePath(_ pathName:String) -> Bundle {
        let bundlePath = Bundle.main.path(forResource: pathName, ofType: "bundle")
        guard let resourceBundle = Bundle.init(path: bundlePath!) else { return Bundle.init() }
        return resourceBundle
    }
}



