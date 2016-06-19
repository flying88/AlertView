//
//  PopupViewForAutolayout.swift
//  AlertView
//
//  Created by Dong Joon Lee on 2016. 6. 16..
//  Copyright © 2016년 patrick.kim. All rights reserved.
//

import UIKit

class PopupViewForAutolayout: PopupView {
    
    func setConstraints() {
        self.superview?.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let views: Dictionary<String, AnyObject> = [
            "popupView" : self,
            "messageLabel" : self.messageLabel,
        ]
        
        
        var constraints = [NSLayoutConstraint]()
        
        let messageLabelConstraintH = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[messageLabel]-10-|",
            options: [],
            metrics: nil,
            views: views)
        constraints += messageLabelConstraintH
        
        
        let messageLabelConstraintV = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-10-[messageLabel]-10-|",
            options: [],
            metrics: nil,
            views: views)
        constraints += messageLabelConstraintV
        
        let textSize = self.messageLabel.intrinsicContentSize()
        let matrics: Dictionary<String, CGFloat> = [
            "popupViewWidth" : (textSize.width + 20.0),
            "popupViewHeight" : (textSize.height + 20.0)
        ]
        
        /*
        let popupViewConstraintH = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[popupView(popupViewWidth)]",
            options: [],
            metrics: matrics,
            views: views)
        constraints += popupViewConstraintH
        */
        
        /*
        let popupViewConstraintV = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[popupView]",
            options: [.AlignAllBottom],
            metrics: nil,
            views: views)
        constraints += popupViewConstraintV
        */
        
        NSLayoutConstraint.activateConstraints(constraints)
    }
    
    override func createToastView() {
        self.alpha = 0.0
        self.layer.cornerRadius = 3.0
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 0.5
        self.backgroundColor = UIColor.darkGrayColor()
        
        self.messageLabel = UILabel()
        self.messageLabel.text = self.message
        self.messageLabel.font = UIFont.systemFontOfSize(15.0)
        self.messageLabel.textAlignment = .Center
        self.messageLabel.backgroundColor = UIColor.clearColor()
        self.messageLabel.textColor = UIColor.whiteColor()
        self.messageLabel.numberOfLines = 0
        self.messageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.messageLabel)
    }

    override func createAlertView() {
        self.backgroundView = UIView()
        
        let viewDic: Dictionary<String, AnyObject> = [
            "backgroundView" : self.backgroundView!
        ]
        
        let backgroundView_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[backgroundView]-10-|",
            options: .AlignAllCenterX,
            metrics: nil,
            views: viewDic)
        
        let backgroundView_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-50-[backgroundView]-50-|",
            options: .AlignAllCenterY,
            metrics: nil,
            views: viewDic)
        self.backgroundView?.addConstraints(backgroundView_H)
        self.backgroundView?.addConstraints(backgroundView_V)
    }
    
    override func addView() {
        UIApplication.sharedApplication().delegate?.window??.addSubview(self)
        
        setConstraints()
    }

}
