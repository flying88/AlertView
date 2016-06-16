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


class PopupView: UIView {
    
    // MARK: - Instance variable
    var popupViewStyle: PopupViewStyle?
    var message: String?
    
    var backgroundView: UIView?
    var popupButtonTitle: Array<String>?
    
    
    
    // MARK: - Initailize
    init(popupViewStyle: PopupViewStyle) {
        super.init(frame: UIScreen.mainScreen().bounds)
        
        self.popupViewStyle = popupViewStyle
        
        setPopupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Private methods
    private func setPopupView() {
        self.backgroundColor = UIColor.clearColor()
        
        self.backgroundView = UIView()
        
        let viewDic: Dictionary<String, AnyObject> = [
            "superView" : self,
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
        
//        self.backgroundView = UIView(frame: CGRectMake(10.0, 50.0, self.bounds.size.width - 20.0, self.bounds.size.height - 100.0))
//        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = UIColor.redColor()
        self.backgroundView?.addConstraints(backgroundView_H)
        self.backgroundView?.addConstraints(backgroundView_V)
        self.addSubview(self.backgroundView!)
        
        switch (self.popupViewStyle! as PopupViewStyle) {
        case .ToastStyle:
            createToastView()
            break
            
        case .AlertStyle:
            
            break
            
        default:
            
            break
        }
    }
    
    private func createToastView() {
        
    }
    
    
    // MARK: Instance methods
    internal func addButton(buttonTitle: String) {
        
    }
    
    internal func show() {
        UIApplication.sharedApplication().delegate?.window??.addSubview(self)
    }
    
    internal func hide() {
        removeFromSuperview()
    }
}
