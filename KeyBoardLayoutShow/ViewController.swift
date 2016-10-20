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
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyBoardNote(note:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func keyBoardNote(note: NSNotification) {
        
        let endValue = note.userInfo!["UIKeyboardFrameEndUserInfoKey"] as! NSValue
        print("123123", endValue)
//        if let tmpRect = endValue.cgRectValue {
            let keyboardY:CGFloat = endValue.cgRectValue.origin.y
            self.bottomSpeace.constant = UIScreen.main.bounds.size.height - keyboardY
            UIView.animate(withDuration: 0.1) {
                self.view.layoutIfNeeded()
            }
//        }
        
        
        
        
    }

    
}

