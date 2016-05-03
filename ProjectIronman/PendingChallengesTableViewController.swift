//
//  PendingChallengesTableViewController.swift
//  ProjectIronman
//
//  Created by Jason Cheng on 5/3/16.
//  Copyright © 2016 Jason. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class PendingChallengesTableViewController: UITableViewController, IndicatorInfoProvider {

    let cellIdentifier = "dashboardChallengeCell"
    var itemInfo = IndicatorInfo(title: "View")
    var pendingChallenges:[FChallenge] = []
    
    init(style: UITableViewStyle, itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "DashboardChallengeCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: cellIdentifier)
        
        FirebaseManager.sharedInstance.getPendingChallenges{
            (challenges) in
            self.pendingChallenges = challenges
            print(challenges.count)
            self.tableView.reloadData()
        }

   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.pendingChallenges.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DashboardChallengeTableViewCell
        let challenge = self.pendingChallenges[indexPath.row]
        cell.populateWithData(challenge)
        
        return cell
    }
    
    // MARK: - IndicatorInfoProvider
    func indicatorInfoForPagerTabStrip(pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return self.itemInfo
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
