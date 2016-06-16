//
//  PopupViewForAutolayout.swift
//  AlertView
//
//  Created by Dong Joon Lee on 2016. 6. 16..
//  Copyright © 2016년 patrick.kim. All rights reserved.
//

import UIKit

class PopupViewForAutolayout: PopupView {
    
    
    
    override func createToastView() {
        self.messageLabel = UILabel()
        self.messageLabel.text = self.message
        self.messageLabel.font = UIFont.systemFontOfSize(15.0)
        self.messageLabel.textAlignment = .Center
        self.messageLabel.backgroundColor = UIColor.blackColor()
        self.messageLabel.textColor = UIColor.whiteColor()
        self.addSubview(self.messageLabel)
        
        let views: Dictionary<String, AnyObject> = [
            "messageLabel" : self.messageLabel
        ]
        
        var allConstraints = [NSLayoutConstraint]()
        
        let messageLabel_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[messageLabel(10)]",
            options: [],
            metrics: nil,
            views: views)
        allConstraints += messageLabel_H
        
        let messageLabel_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[messageLabel(100)]",
            options: [],
            metrics: nil,
            views: views)
//        allConstraints += messageLabel_V
        
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints(allConstraints)
        
        let textSize = self.messageLabel.intrinsicContentSize()
        
        print("\(self.frame) \n \(self.messageLabel.frame)")
    }

    override func createAlertView() {
        self.backgroundView = UIView()
        
        let viewDic: Dictionary<String, AnyObject> = [
            "backgroundView" : self.backgroundView!
        ]
        
        let backgroundView_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[backgroundView]-10-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewDic)
        
        let backgroundView_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-50-[backgroundView]-50-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewDic)
        self.backgroundView?.addConstraints(backgroundView_H)
        self.backgroundView?.addConstraints(backgroundView_V)
    }

}
