//
//  EmailViewController.swift
//  TeachManners
//
//  Created by Madison Pahl on 4/26/16.
//  Copyright © 2016 Madison Pahl. All rights reserved.
//

import UIKit

let emailKey = NSUserDefaults.standardUserDefaults()
var email: String?

class EmailViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailDisplay: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        emailDisplay.text = emailKey.stringForKey("savedEmail")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func emailConfirm(sender: AnyObject) {
        if(isValidEmail(emailField.text!)){
            
            let userEmail = emailField.text
            NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "savedEmail")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            let alert = UIAlertController(title: "Saved Email", message: "Your saved email is \(emailField.text!)", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK!", style: .Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            emailDisplay.text = emailField.text!
            email = emailKey.stringForKey("savedEmail")
        }
        else{
            let error = UIAlertController(title: "Email Error", message: "The email you entered is incorrect. Try again.", preferredStyle: UIAlertControllerStyle.Alert)
            error.addAction(UIAlertAction(title: "OK!", style: .Cancel, handler: nil))
            self.presentViewController(error, animated: true, completion: nil)
        }
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

func isValidEmail(email2Test:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let range = email2Test.rangeOfString(emailRegEx, options:.RegularExpressionSearch)
    let result = range != nil ? true : false
    return result
}
