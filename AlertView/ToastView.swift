//
//  ToastView.swift
//  AlertView
//
//  Created by Dong Joon Lee on 2016. 6. 20..
//  Copyright © 2016년 patrick.kim. All rights reserved.
//

import UIKit

enum ToastViewTimeInterval: Double {
    case ShortTimeInterval = 1.0
    case NormalTimeInterval = 2.0
    case LongTimeInterval = 4.0
}


class ToastView: UIView {
    // MARK: - Variable
    private  var message: String!
    private  var messageLabel: UILabel!
    
    internal var toastViewTimeInterval: ToastViewTimeInterval = .ShortTimeInterval
    

    // MARK: - Initailize
    init(message: String) {
        super.init(frame: UIScreen.mainScreen().bounds)

        self.message = message
        
        setToastView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private
    private func setConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let views: Dictionary<String, AnyObject> = [
            "toastView" : self,
            "messageLabel" : self.messageLabel,
            ]
        
        let padding: CGFloat = 10.0
        let messageLabelSize = self.messageLabel.intrinsicContentSize()
        let matrics: Dictionary<String, CGFloat> = [
            "toastViewWidth" : (messageLabelSize.width + (padding * 2.0)),
            "toastViewHeight" : (messageLabelSize.height + (padding * 2.0)),
            "padding" : padding
        ]
        
        var contraints = [NSLayoutConstraint]()
        
        
        
        
        let messageLabelHorizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-padding-[messageLabel]-padding-|",
            options: [],
            metrics: matrics,
            views: views)
        contraints += messageLabelHorizontalConstraint
        
        let messageLabelVertivalConstraint = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-padding-[messageLabel]-padding-|",
            options: [],
            metrics: matrics,
            views: views)
        contraints += messageLabelVertivalConstraint
        
        let toastViewHorizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[toastView]",
            options: NSLayoutFormatOptions.AlignAllCenterY,
            metrics: matrics,
            views: views)
        contraints += toastViewHorizontalConstraint
        
        let toastViewVerticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[toastView]-padding-|",
            options: [],
            metrics: matrics,
            views: views)
        contraints += toastViewVerticalConstraint
        
        NSLayoutConstraint.activateConstraints(contraints)
    }
    
    private func setToastView() {
        self.alpha = 0.0
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 0.5
        self.backgroundColor = UIColor.darkGrayColor()
        
        self.messageLabel = UILabel(frame: self.bounds)
        self.messageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.messageLabel.text = self.message
        self.messageLabel.font = UIFont.systemFontOfSize(15.0)
        self.messageLabel.textAlignment = .Center
        self.messageLabel.backgroundColor = UIColor.clearColor()
        self.messageLabel.textColor = UIColor.whiteColor()
        self.messageLabel.numberOfLines = 0
        
        self.addSubview(self.messageLabel)
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
    
    // MARK: - Internal
    internal func show() {
        UIApplication.sharedApplication().delegate?.window??.addSubview(self)
        
        setConstraints()
        
        UIView.animateWithDuration(
            0.5,
            animations: { void in
                self.alpha = 1.0
            }, completion: { finished in
                NSTimer.scheduledTimerWithTimeInterval(
                    self.toastViewTimeInterval.rawValue,
                    target: self,
                    selector: #selector(self.timerAction),
                    userInfo: nil,
                    repeats: false)
                
                print("window : \(self.superview!.frame)\nself : \(self.frame)\nlabel : \(self.messageLabel.frame)")
        })
    }
}
