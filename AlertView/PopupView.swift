//
//  PopupView.swift
//  AlertView
//
//  Created by patrick.kim on 2016. 6. 16..
//  Copyright © 2016년 patrick.kim. All rights reserved.
//

import UIKit


enum PopupViewStyle {
    case ToastStyle
    case AlertStyle
    case ConfirmStyle
    case SelectionStyle
    case ComplexStyle
}

enum ToastDurationTime: Double {
    case ShortTime = 1.0
    case NormalTime = 2.0
    case LongTime = 4.0
}


class PopupView: UIView {
    
    // MARK: - Instance variable
    var popupViewStyle: PopupViewStyle?
    var message: String?
    
    var backgroundView: UIView?
    
    var titleLabel: UILabel!
    var messageLabel: UILabel!
    
    var popupButtonTitle: Array<String>?
    
    var toastDurationTime: ToastDurationTime = .ShortTime
    
    
    // MARK: - Initailize
    init(popupViewStyle: PopupViewStyle, message: String) {
        super.init(frame: UIScreen.mainScreen().bounds)
        
        self.popupViewStyle = popupViewStyle
        self.message = message
        
        setPopupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Private methods
    private func setPopupView() {
        self.backgroundColor = UIColor.clearColor()
        
        switch (self.popupViewStyle! as PopupViewStyle) {
        case .ToastStyle:
            createToastView()
            break
            
        case .AlertStyle:
            createAlertView()
            break
            
        default:
            
            break
        }
    }
    
    @objc private func timerAction() {
        UIView.animateWithDuration(
            0.5,
            animations: { void in
                self.alpha = 0.0
            },
            completion: { finished in
                self.removeFromSuperview()
        })
    }
    
    func createToastView() {
        self.messageLabel = UILabel(frame: self.bounds)
        self.messageLabel.text = self.message
        self.messageLabel.font = UIFont.systemFontOfSize(15.0)
        self.messageLabel.textAlignment = .Center
        self.messageLabel.textColor = UIColor.whiteColor()
        
        let textSize = self.messageLabel.intrinsicContentSize()
        
        self.frame = CGRectMake(
            (self.frame.size.width - textSize.width) / 2.0,
            self.frame.size.height - textSize.height - 40.0,
            textSize.width + 20.0,
            textSize.height + 20.0)
        
        self.messageLabel.frame = CGRectMake(
            10.0,
            10.0,
            textSize.width,
            textSize.height)
        
        self.addSubview(self.messageLabel)
        
        self.alpha = 0.0
        self.layer.cornerRadius = 3.0
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 0.5
        self.backgroundColor = UIColor.darkGrayColor()
        
        print("\(self.frame) \n \(self.messageLabel.frame)")
    }
    
    func createAlertView() {
        self.backgroundView = UIView(frame: CGRectMake(
            10.0,
            50.0,
            self.bounds.size.width - 20.0,
            self.bounds.size.height - 100.0))
        self.backgroundView?.backgroundColor = UIColor.redColor()
        self.addSubview(self.backgroundView!)
    }
    
    func addView() {
        UIApplication.sharedApplication().delegate?.window??.addSubview(self)
    }
    
    
    // MARK: Instance methods
    internal func addButton(buttonTitle: String) {
        
    }
    
    internal func show() {
        addView()
        
        switch (self.popupViewStyle! as PopupViewStyle) {
        case .ToastStyle:
            UIView.animateWithDuration(
                0.5,
                animations: { void in
                    self.alpha = 1.0
                }, completion: { finished in
                    NSTimer.scheduledTimerWithTimeInterval(
                        self.toastDurationTime.rawValue,
                        target: self,
                        selector: #selector(self.timerAction),
                        userInfo: nil,
                        repeats: false)
                    
                    print("window : \(self.superview!.frame)\nself : \(self.frame)\nlabel : \(self.messageLabel.frame)")
                    })
            break
            
        case .AlertStyle:
            break;
            
        default:
            break
        }
    }
    
    internal func hide() {
        removeFromSuperview()
    }
}
