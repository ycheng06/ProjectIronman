//
//  DashboardViewController.swift
//  ProjectIronman
//
//  Created by Jason Cheng on 3/1/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBAction func fetchNewActivities(button: UIButton) {
        // disable fetch button while loading new activites
        button.enabled = false
        
//        APIManager.sharedInstance.fetchNewActivities { () -> Void in
//            button.enabled = true
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
