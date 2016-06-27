//
//  DetailMemeViewController.swift
//  MeMe V-2.0
//
//  Created by Vasanth Kodeboyina on 6/20/16.
//  Copyright © 2016 Anish Kodeboyina. All rights reserved.
//

import Foundation
import UIKit

class DetailMemeViewController: UIViewController
{
    @IBOutlet weak var detailMemeImageViewer: UIImageView!
    var image: UIImage! = nil
    var memeDetails: MemeModel! = nil
    var editButtonPressed: Bool! = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        detailMemeImageViewer.image = image
    }

  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailVC = (segue.destinationViewController as! MemeEditorViewController)
        detailVC.memeCurrentDetails = memeDetails
        editButtonPressed = true
    }
    
}
