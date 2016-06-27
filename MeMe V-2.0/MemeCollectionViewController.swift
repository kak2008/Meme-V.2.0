//
//  MemeCollectionViewController.swift
//  MeMe V-2.0
//
//  Created by Vasanth Kodeboyina on 6/20/16.
//  Copyright © 2016 Anish Kodeboyina. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionViewController: UICollectionViewController
{
    
    // MARK: - View Methods
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView?.reloadData()
    }
   
    
    // MARK: - Collection View cell Methods
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SavedMemes.sharedInstace.arrayOfMemes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionViewCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        cell.collectionViewCellImageViewer.image = SavedMemes.sharedInstace.arrayOfMemes[indexPath.item].memedImage!

        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    
    // MARK: - Collection View Segue Methods
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        //NSLog("You selected cell number: \(indexPath.item)!")
        self.performSegueWithIdentifier("CollectionViewSegueToMemeDetailView", sender: indexPath)
        SavedMemes.sharedInstace.selectedIndex = (indexPath.item)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        if (segue.identifier == "CollectionViewSegueToMemeDetailView")
        {
            let detailVC = (segue.destinationViewController as! DetailMemeViewController)
            let svaaa = sender as! NSIndexPath
            let data = SavedMemes.sharedInstace.arrayOfMemes[svaaa.item]
            detailVC.image = data.memedImage
            detailVC.memeDetails = SavedMemes.sharedInstace.arrayOfMemes[svaaa.item]
        }
    }

}