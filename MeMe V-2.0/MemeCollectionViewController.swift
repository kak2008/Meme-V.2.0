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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView?.reloadData()
    }
   
    
    // MARK: - Collection View cell Methods
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SavedMemes.sharedInstace.arrayOfMemes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! MemeCollectionViewCell
        cell.collectionViewCellImageViewer.image = SavedMemes.sharedInstace.arrayOfMemes[indexPath.item].memedImage!

        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    
    // MARK: - Collection View Segue Methods
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        //NSLog("You selected cell number: \(indexPath.item)!")
        self.performSegue(withIdentifier: "CollectionViewSegueToMemeDetailView", sender: indexPath)
        SavedMemes.sharedInstace.selectedIndex = (indexPath.item)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if (segue.identifier == "CollectionViewSegueToMemeDetailView")
        {
            let detailVC = (segue.destination as! DetailMemeViewController)
            let svaaa = sender as! IndexPath
            let data = SavedMemes.sharedInstace.arrayOfMemes[svaaa.item]
            detailVC.image = data.memedImage
            detailVC.memeDetails = SavedMemes.sharedInstace.arrayOfMemes[svaaa.item]
        }
    }

}
