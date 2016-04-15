//
//  mannerDetailViewController.swift
//  TeachManners
//
//  Created by Madison Pahl on 4/12/16.
//  Copyright © 2016 Madison Pahl. All rights reserved.
//

import UIKit

class MannerDetailViewController: UIViewController {
    var manner : Mannerism!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var mannerImage: UIImageView!
    
    @IBOutlet var descritionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.nameLabel.text = manner.name
        
        self.mannerImage.image = manner.image
        
        self.descritionText.text = manner.description
        
        //TODO: also show shape
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backPress(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    


}
