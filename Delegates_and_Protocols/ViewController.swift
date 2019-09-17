//
//  ViewController.swift
//  Delegates_and_Protocols
//
//  Created by apple on 16/09/19.
//  Copyright © 2019 VasilisGreen. All rights reserved.
//

import UIKit
                                        /// 2)
class ViewController: UIViewController, CanReceive {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sendButtonPressed(_ sender: UIButton) {
        // on button click transition to the other page
        // using the "sendDataFwd" segue with sender (self) this class
        performSegue(withIdentifier: "sendDataFwd", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // every time we create a segue we have to go to the right panel
        // and give it an identifier name in the attributes inspector
        if segue.identifier == "sendDataFwd" {
            // we tap into the destination of the segue
            // and we inform our compiler that the distination
            // is of type "SecondViewController"
            let secondVC = segue.destination as! SecondViewController
            // access the data property (var) of the SecondViewController
            // and pass whatever the user types on the textfiled input
            secondVC.data = textFiled.text!
            // the last step is to set the self (this class)
            // as the delgate of the protocol
            /// 6)
            secondVC.delegate = self
        }
    }
    
    // once we set this class as the delegate with the protocol
    // we need to decalre the function and/or other things
    // that the protocol dictates that this class should do
    /// 3)
    func dataReceived(data: String) {
        label.text = data
    }
    
}

