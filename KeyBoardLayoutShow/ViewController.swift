//
//  ViewController.swift
//  KeyBoardLayoutShow
//
//  Created by ws on 2016/10/12.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottomSpeace: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyBoardNote(_:)), name: UIKeyboardDidChangeFrameNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func keyBoardNote(note: NSNotification) {
        
        print(note)
        let endValue = note.userInfo!["UIKeyboardFrameEndUserInfoKey"]
        let keyboardY:CGFloat = (endValue?.CGRectValue.origin.y)!
        self.bottomSpeace.constant = UIScreen.mainScreen().bounds.size.height - keyboardY
        UIView.animateWithDuration(0.1) {
            self.view.layoutIfNeeded()
        }
        
        
        
    }

    
}

