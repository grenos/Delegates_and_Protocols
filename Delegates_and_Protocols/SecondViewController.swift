//
//  SecondViewController.swift
//  Delegates_and_Protocols
//
//  Created by apple on 16/09/19.
//  Copyright © 2019 VasilisGreen. All rights reserved.
//

import UIKit

// to send data back we need to use protocols and delegates
// a protocol doesn't do anything but to set the rules of
// what a delegate should/could do
// kinda like an interface in typescript
/// 1)
protocol CanReceive {
    func dataReceived(data: String)
}


class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textFiled: UITextField!
    
    // we declare a property (var) and asign the CanReceive Protocol
    // as its type
    // this var will do the delegating
    // use the ? in case there is no delegate class declared
    /// 4)
    var delegate: CanReceive?
    
    // to save the data that will be passed over from the other controller
    var data = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // pass the data recieved from the other view controller
        // as the text of the label
        label.text = data
        
    }
    
    @IBAction func sendDataBack(_ sender: UIButton) {
        // on button click call the function
        // declared in the protocol and placed
        // on the delegate class
        // send data = what user has typed in textfiled
        // if delegate value is nil this func will do NOTHING
        /// 5)
        delegate?.dataReceived(data: textFiled.text!)
        /// 7) OPTIONAL!
        // dismiss current view and go back to first view
        dismiss(animated: true, completion: nil)
    }
    
}

