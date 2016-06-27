//
//  MemeTableViewController.swift
//  MeMe V-2.0
//
//  Created by Vasanth Kodeboyina on 6/20/16.
//  Copyright © 2016 Anish Kodeboyina. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewController: UITableViewController
{
    
    // MARK: - View Cycle Methods
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        view.backgroundColor = UIColor .lightGrayColor()
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        if SavedMemes.sharedInstace.arrayOfMemes.count == 0
        {
            let object: AnyObject = storyboard!.instantiateViewControllerWithIdentifier("MemeEditorViewController")
            let memeFirstVC = object as! MemeEditorViewController
            presentViewController(memeFirstVC, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - Table View cell Methods

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return SavedMemes.sharedInstace.arrayOfMemes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableViewCell")
        
        cell?.textLabel?.text = "\(SavedMemes.sharedInstace.arrayOfMemes[indexPath.row].topText)... \(SavedMemes.sharedInstace.arrayOfMemes[indexPath.row].bottomText)"
        cell?.imageView?.image = SavedMemes.sharedInstace.arrayOfMemes[indexPath.row].memedImage
       
        cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell!.layer.borderColor = UIColor.grayColor().CGColor
        cell!.layer.borderWidth = 1
        cell!.layer.cornerRadius = 8
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    
    // MARK: - Table View Segue Methods
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
          //  NSLog("You selected cell number: \(indexPath.row)!")
            self.performSegueWithIdentifier("TableViewSegueToMemeDetailView", sender: self)
            SavedMemes.sharedInstace.selectedIndex = (indexPath.row)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        if (segue.identifier == "TableViewSegueToMemeDetailView")
        {
            let detailVC = (segue.destinationViewController as! DetailMemeViewController)
            let selectedIndexPath =  tableView.indexPathForSelectedRow
            let data = SavedMemes.sharedInstace.arrayOfMemes[(selectedIndexPath?.row)!]
            detailVC.image = data.memedImage
            detailVC.memeDetails = SavedMemes.sharedInstace.arrayOfMemes[(selectedIndexPath?.row)!]
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            SavedMemes.sharedInstace.arrayOfMemes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
}
