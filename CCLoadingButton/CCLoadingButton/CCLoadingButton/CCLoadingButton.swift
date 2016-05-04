//
//  CCLoadingButton.swift
//  animate
//
//  Created by CatStandInTheCorner on 16/5/4.
//  Copyright © 2016年 chart. All rights reserved.
//

import UIKit

enum CCLoadingButtonState{
    case Default, Info, Success, Warning, Error, Color(UIColor), Blur(UIBlurEffectStyle)
    var backgroundColor: UIColor? {
        switch self {
        case Default: return UIColor(red: 41/255.0, green: 128/255.0, blue: 185/255.0, alpha: 0.9)
        case Info: return UIColor(red: 52/255.0, green: 152/255.0, blue: 219/255.0, alpha: 0.9)
        case Success: return UIColor(red: 39/255.0, green: 174/255.0, blue: 96/255.0, alpha: 0.9)
        case Warning: return UIColor(red: 241/255.0, green: 196/255.0, blue: 15/255.0, alpha: 0.9)
        case Error: return UIColor(red: 192/255.0, green: 57/255.0, blue: 43/255.0, alpha: 0.9)
        case Color(let color): return color
        case Blur: return nil
        }
    }
}

class CCLoadingButton: UIButton {
    
    // MARK: - Public Property
    
    var buttonState:CCLoadingButtonState = .Default{
        didSet{
            self.backgroundColor = buttonState.backgroundColor;
        }
    }
    
    var loadingPaddingRight:CGFloat = 15
    var isLoading = false;
    
    // MARK: - Private Property
    private var loadingView:CCLoadingView!
    private var textLabel: UILabel!
    private var textLabelOriginX:CGFloat!
    init(frame: CGRect, title:String) {
        super.init(frame: frame);
        self.textLabel = UILabel()
        self.textLabel.text = title;
        self.textLabel.textColor = UIColor.whiteColor();
        self.backgroundColor = buttonState.backgroundColor;
        self.addSubview(self.textLabel)
    }
    
    
    func startLoading(text:String? = nil){
        if self.isLoading == true{return}
        self.isLoading = true;
        let loadingWidthHeight = self.frame.height * 0.6;
        if text != nil{
            self.textLabel.text = text;
            self.layoutTextLabel();
        }
        if self.textLabelOriginX == nil{
            textLabelOriginX = self.textLabel.frame.origin.x
        }
        let decidedLabelLayerWidth = loadingWidthHeight + self.textLabel.frame.size.width + self.loadingPaddingRight
        let decidedLoadingOriginX = ( self.frame.width - decidedLabelLayerWidth ) / 2
        let decidedLabelOriginX  = decidedLoadingOriginX + loadingWidthHeight + self.loadingPaddingRight;
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.textLabel.frame.origin = CGPointMake(decidedLabelOriginX, self.textLabel.frame.origin.y)
            }, completion: nil)
        if self.loadingView == nil{
            self.loadingView = CCLoadingView(frame: CGRectMake(decidedLoadingOriginX, (self.frame.height - loadingWidthHeight) / 2, loadingWidthHeight, loadingWidthHeight))
            self.loadingView.strockColor = UIColor.whiteColor();
            self.loadingView.lineWidth   = self.frame.height * 0.03
            self.addSubview(self.loadingView);
        }
        self.loadingView.hidden = false;
        self.loadingView.startAnimate();
    }
    
    func stopLoading(text:String? = nil){
        if self.isLoading == false{return}
        self.isLoading = false
        if text != nil{
            self.textLabel.text = text;
            self.textLabel.sizeToFit();
        }
        let decidedLoadingOriginX = ( self.frame.width - self.textLabel.frame.width ) / 2
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.textLabel.frame.origin = CGPointMake(decidedLoadingOriginX, self.textLabel.frame.origin.y)
            }, completion: nil)
        self.loadingView.stopAnimate()
        self.loadingView.hidden = true;
    }
    
    private var layoutDispatchOnceT:dispatch_once_t = 0;
    override func layoutSubviews() {
        super.layoutSubviews();
        dispatch_once(&layoutDispatchOnceT) {
            self.layoutTextLabel();
        }
    }
    
    private func layoutTextLabel(){
        self.textLabel.font = UIFont.systemFontOfSize(self.frame.height * 0.5);
        self.textLabel.sizeToFit();
        self.textLabel.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
