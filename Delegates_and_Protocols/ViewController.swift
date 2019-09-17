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
    
    // DELEGATE METHOD
    // once we set this class as the delegate with the protocol
    // we need to decalre the function and/or other things
    // that the protocol dictates that this class should do
    /// 3)
    func dataReceived(data: String) {
        label.text = data
    }
    
}

/// ************************************************************************

// Delegation is a design pattern that enables a class to hand off (or “delegate”) some of its responsibilities to an instance of another class.
// https://learnappmaking.com/delegation-swift-how-to/
// In short, it’s a great way to “hook into” events that happen within code you don’t control.


/// https://subclassing
// An alternative to delegation is subclassing.
// This has a massive disadvantage: you inherit the entire CLLocationManager class, for something as simple as getting a bit of location data. You would need to override some of its default functionality, which you either have to call directly with super or replace entirely.

// And lastly, subclassing creates a tightly-coupled class hierarchy, which doesn’t make sense unless your subclass is similar in nature to the class you’re subclassing. This is unlikely if you’re merely responding to GPS location updates.


/// https://Observable
// The Observable pattern is useful when your code needs to communicate with multiple components, with a one-to-many or many-to-many relationship. One component in your app broadcasts a signal that multiple other components respond to. And apart from a broadcast type and some associated data, you can’t formalize the requirements for the communication like a protocol can.


///  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Delegation is more lightweight than subclassing, because you don’t have to inherit a complete class or struct
// Delegation is useful for 1-on-1 relationships, whereas the Observer pattern is more suitable for one-to-many and many-to-many relationships.
// Delegation is flexible, because it doesn’t require the delegating class to know anything at all about a delegate – only that it conforms to a protocol
