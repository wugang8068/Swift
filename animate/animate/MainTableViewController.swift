//
//  MainTableViewController.swift
//  animate
//
//  Created by 吴刚 on 15/12/4.
//  Copyright © 2015年 chart. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    let cellData = [
        (cellTitle:"Scale",controllerName:"UIScaleViewController"),
        (cellTitle:"BasicAnimation",controllerName:"UIBasicAnimationViewController")
    ]
    
    let refreshControler = UIRefreshControl();
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.refreshControl?.attributedTitle = NSAttributedString(string: "Test");
//        self.refreshControl = refreshControler;
//        self.refreshControl?.beginRefreshing();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.refreshControl?.endRefreshing();
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cellData.count;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = self.cellData[indexPath.row].cellTitle;
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let vc = Swift_addtion.ControllerFromString(self.cellData[indexPath.row].controllerName) as? UIViewController{
            self.navigationController?.pushViewController(vc, animated: true);
        }
    }

}
