//
//  ViewController.swift
//  AlertView
//
//  Created by patrick.kim on 2016. 6. 16..
//  Copyright © 2016년 patrick.kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStartButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: Start button func
    func setStartButton() {
        self.startButton?.layer.cornerRadius = 5.0
        self.startButton?.layer.borderWidth = 1.0
        self.startButton?.layer.borderColor = UIColor.brownColor().CGColor
    }
    
    @IBAction func buttonAction(sender: AnyObject) {
//        let popupView = PopupView(popupViewStyle: .ToastStyle, message:"test message")
//        let popupView = PopupViewForAutolayout(popupViewStyle: .ToastStyle, message:"test message\nZzzzZzzz")
//        popupView.toastDurationTime = .ShortTime
//        popupView.show()
        
        let toastView = ToastView(message: "test message\nZzzzZzzz")
        toastView.show()
    }
}

