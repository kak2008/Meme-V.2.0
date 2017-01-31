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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        view.backgroundColor = UIColor.lightGray
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if SavedMemes.sharedInstace.arrayOfMemes.count == 0
        {
            let object: AnyObject = storyboard!.instantiateViewController(withIdentifier: "MemeEditorViewController")
            let memeFirstVC = object as! MemeEditorViewController
            present(memeFirstVC, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - Table View cell Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return SavedMemes.sharedInstace.arrayOfMemes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell")
        
        cell?.textLabel?.text = "\(SavedMemes.sharedInstace.arrayOfMemes[indexPath.row].topText)... \(SavedMemes.sharedInstace.arrayOfMemes[indexPath.row].bottomText)"
        cell?.imageView?.image = SavedMemes.sharedInstace.arrayOfMemes[indexPath.row].memedImage
       
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell!.layer.borderColor = UIColor.gray.cgColor
        cell!.layer.borderWidth = 1
        cell!.layer.cornerRadius = 8
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    // MARK: - Table View Segue Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
          //  NSLog("You selected cell number: \(indexPath.row)!")
            self.performSegue(withIdentifier: "TableViewSegueToMemeDetailView", sender: self)
            SavedMemes.sharedInstace.selectedIndex = (indexPath.row)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if (segue.identifier == "TableViewSegueToMemeDetailView")
        {
            let detailVC = (segue.destination as! DetailMemeViewController)
            let selectedIndexPath =  tableView.indexPathForSelectedRow
            let data = SavedMemes.sharedInstace.arrayOfMemes[(selectedIndexPath?.row)!]
            detailVC.image = data.memedImage
            detailVC.memeDetails = SavedMemes.sharedInstace.arrayOfMemes[(selectedIndexPath?.row)!]
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            SavedMemes.sharedInstace.arrayOfMemes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
}
