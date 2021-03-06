//
//  ViewController.swift
//  TeachManners
//
//  Created by Madison Pahl on 4/12/16.
//  Copyright © 2016 Madison Pahl. All rights reserved.
//

import UIKit
import MessageUI

//let phoneKey = NSUserDefaults.standardUserDefaults()
//let tableKey = NSUserDefaults.standardUserDefaults()
//let askKey = NSUserDefaults.standardUserDefaults()
//let restroomKey = NSUserDefaults.standardUserDefaults()
//let goldenKey = NSUserDefaults.standardUserDefaults()
//let visitKey = NSUserDefaults.standardUserDefaults()
//let respectKey = NSUserDefaults.standardUserDefaults()
//let talkKey = NSUserDefaults.standardUserDefaults()

var messageBody = "Subjects Learned: "



let mc: MFMailComposeViewController = MFMailComposeViewController()


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate{
    
    @IBOutlet weak var mannerTableView: UITableView!
    
    var manners : [Mannerism] = [
        Talking(name: "Talking to Others",description: "-Look at the person or people you are talking to \n \n-If you do need to get somebody's attention right away, the phrase excuse me is the most polite way for you to enter the conversation. \n \n-If you haven't met before, introduce yourself and ask their name \n \n-Don't interrupt when someone else is talking \n \n-Don't point or stare \n \n-Say nice things about people and praise those who deserve it \n \n-Ask questions when you don't understand something \n \n-Stick to the subject", image:  UIImage(named: "Talking")!, viewed: false, yes: false),
        TableManners(name: "Table Manners",description: "-Come to the table with clean hands and face. \n \n-Put your napkin on your lap. \n \n-Start eating when everyone else does—or when given the okay to start. \n \n-Stay seated and sit up straight. \n \n-Keep elbows (and other body parts!) off the table while eating. \n \n-Chew with your mouth closed and don’t talk until you’ve swallowed. \n \n-Don’t make bad comments about the food. \n \n-Say “Please pass the…” instead of reaching. \n \n-Don’t make rude noises like burping or slurping. \n \n-Ask to be excused when finished. \n \n-Thank your host or whoever prepared the meal. \n \n-Offer to help clear the table.", image:  UIImage(named: "TableManners")!, viewed: false, yes: false),
        Phone(name: "Phone Calls",description: "-Ask permission before using the phone. \n \n-Greet with, 'Hello, may I ask who’s calling?' \n \n-Ask, 'Who would you like to speak with?' If the person is not there, say that the person is not able to come to the phone at that time. \n \n-Write down information if caller wants to leave a message. \n \n-If you are making a call make sure to introduce yourself, so the person knows who's calling. \n \n-End conversation polietly 'It was good talking to you.'", image:  UIImage(named: "Phone")!, viewed: false, yes: false),
        Restroom(name: "Using Restroom",description: "-After a bath or after you use the toilet, you must make sure that you clean up. Do flush. Don’t leave bits of tissue or soap lying around. \n \n-Place toohbrushes, soaps and shampoos where they belong. \n \n-Put your towel out to dry instead of leaving it crumpled and wet in the bathroom. \n \n-Wash hands after using toilet. \n \n-Remember to switch off all lights when finished. \n \n", image:  UIImage(named: "Restroom")!, viewed: false, yes: false),
        AskingNicely(name: "Asking Nicely",description: "-Begin with please and end with thank you \n \n-When asking for something, say Please. \n \n-When receiving something, say Thank you.", image:  UIImage(named: "Asking")!, viewed: false, yes: false),
        GoldenRule(name: "Golden Rule",description: "-Treat others as you would want to be treated. \n \n-Be kind to others.", image:  UIImage(named: "GoldenRule")!, viewed: false, yes: false),
        VisitingHouse(name: "Visiting Friend's House",description: "-When you have spent time at a friend's house, remember to thank your hosts for having you over and for the good time you had. \n \n-Knock on closed doors -- and wait to see if there's a response -- before entering. \n \n-Use a quiet voice inside. \n \n- Even if an event is boring, sit through it quietly and pretend that you are interested. The performers and presenters are doing their best. \n \n-Don't use people's things without permission.", image:  UIImage(named: "VisitingHouse")!, viewed: false, yes: false),
        RespectForOthers(name: "Respect for Others",description: "-Don't hurt people on purpose. \n \n-If you hurt someone, say 'I'm sorry' and try to find a way to make it better. \n \n-When someone asks you to do something, try to do it without grumbling and with a smile. You have a right to say no, you should be polite and offer a good reason if you do. If someone asks you to do something that feels dangerous or wrong, it's okay to say no and not be polite to keep yourself safe. \n \n-When someone helps you, say 'thank you.' \n \n-As you walk through a door, look to see if you can hold it open for someone else. \n \n-If you bump into somebody, immediately say 'Excuse me.' \n \n-Don't call people mean names. \n \n-Never use foul language in front of people if you don't know if it will bother them. \n \n-Keep negative opinions to yourself, or between you and your friends, and out of earshot of others.", image:  UIImage(named: "Respect")!, viewed: false, yes: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mannerTableView.dataSource = self
        self.mannerTableView.delegate = self
        
        let cellNib = UINib(nibName: "MannerTableViewCell", bundle: nil)
        
        self.mannerTableView.registerNib(cellNib, forCellReuseIdentifier: "mannerCell")
        
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.manners.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let manner = self.manners[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("mannerCell") as! MannerTableViewCell
        cell.textLabel!.text = manner.name
        

        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let navVC = storyboard!.instantiateViewControllerWithIdentifier("DetailView") as! UINavigationController
        let detailVC = navVC.viewControllers[0] as! MannerDetailViewController
        
        detailVC.manner = self.manners[indexPath.row]
        
        self.presentViewController(navVC, animated: true, completion: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let cellChange = tableView.cellForRowAtIndexPath(indexPath)
        var wasViewed = manners[indexPath.row]
        
//        if (phoneKey.boolForKey("phoneCheck") == true)
//        {
//            cellChange?.accessoryType = UITableViewCellAccessoryType.Checkmark
//        }
//        if (tableKey.boolForKey("tableCheck") == true)
//        {
//            cellChange?.accessoryType = UITableViewCellAccessoryType.Checkmark
//        }
//        if (askKey.boolForKey("askCheck") == true)
//        {
//            cellChange?.accessoryType = UITableViewCellAccessoryType.Checkmark
//        }
//        if (talkKey.boolForKey("talkCheck") == true)
//        {
//            cellChange?.accessoryType = UITableViewCellAccessoryType.Checkmark
//        }
//        if (restroomKey.boolForKey("restroomCheck") == true)
//        {
//            cellChange?.accessoryType = UITableViewCellAccessoryType.Checkmark
//        }
//        if (goldenKey.boolForKey("goldenCheck") == true)
//        {
//            cellChange?.accessoryType = UITableViewCellAccessoryType.Checkmark
//        }
//        if (visitKey.boolForKey("visitCheck") == true)
//        {
//            cellChange?.accessoryType = UITableViewCellAccessoryType.Checkmark
//        }
//        if (respectKey.boolForKey("respectCheck") == true)
//        {
//            cellChange?.accessoryType = UITableViewCellAccessoryType.Checkmark
//        }
        
        
        wasViewed.viewed = !wasViewed.viewed

        
        if wasViewed.viewed {
            cellChange?.accessoryType = UITableViewCellAccessoryType.Checkmark
            messageBody += ("\n \(wasViewed.name)")
            
            
            
            
//            if (cellChange?.contentView == "Phone Calls") {
//                wasViewed.viewed = phoneKey.boolForKey("phoneCheck")
//                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "phoneCheck")
//                NSUserDefaults.standardUserDefaults().synchronize()
//            }
//            else if (cellChange?.contentView == "Table Manners") {
//                wasViewed.viewed = tableKey.boolForKey("tableCheck")
//                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "tableCheck")
//                NSUserDefaults.standardUserDefaults().synchronize()
//            }
//            else if (cellChange?.contentView == "AskingNicely") {
//                wasViewed.viewed = askKey.boolForKey("askCheck")
//                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "askCheck")
//                NSUserDefaults.standardUserDefaults().synchronize()
//            }
//            else if (cellChange?.contentView == "Using Restroom") {
//                wasViewed.viewed = restroomKey.boolForKey("restroomCheck")
//                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "restroomCheck")
//                NSUserDefaults.standardUserDefaults().synchronize()
//            }
//            else if (cellChange?.contentView == "Golden Rule") {
//                wasViewed.viewed = goldenKey.boolForKey("goldenCheck")
//                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "goldenCheck")
//                NSUserDefaults.standardUserDefaults().synchronize()
//            }
//            else if (cellChange?.contentView == "Visiting Friend's House") {
//                wasViewed.viewed = visitKey.boolForKey("visitCheck")
//                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "visitCheck")
//                NSUserDefaults.standardUserDefaults().synchronize()
//            }
//            else if (cellChange?.contentView == "Respect for Others") {
//                wasViewed.viewed = respectKey.boolForKey("respectCheck")
//                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "respectCheck")
//                NSUserDefaults.standardUserDefaults().synchronize()
//            }
//            else if (cellChange?.contentView == "Talking to Others") {
//                wasViewed.viewed = talkKey.boolForKey("talkCheck")
//                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "talkCheck")
//                NSUserDefaults.standardUserDefaults().synchronize()
//            }
            
        }
        else {
            cellChange?.accessoryType = UITableViewCellAccessoryType.None
        }
        
        
    }

    
    
    @IBAction func sendButton(sender: UIButton) {
        
        let subjectText = "Manners App Summary"
        
        
            let mc: MFMailComposeViewController = MFMailComposeViewController()
            mc.mailComposeDelegate = self
            mc.setSubject(subjectText)
            mc.setMessageBody(messageBody, isHTML: false)
            mc.setToRecipients([emailKey.stringForKey("savedEmail")!])
        
            
            self.presentViewController(mc, animated: true, completion: nil)

        
        func mailComposerController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError) {
            
            switch result.rawValue{
            case MFMailComposeResultCancelled.rawValue:
                NSLog("Mail Cancelled")
            case MFMailComposeResultSaved.rawValue:
                NSLog("Mail Saved")
            case MFMailComposeResultSent.rawValue:
                NSLog("Mail Sent")
            case MFMailComposeResultFailed.rawValue:
                NSLog("Mail Sent Failure %@",[error.localizedDescription])
            default:
                break
            }

        
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    
    }
}


