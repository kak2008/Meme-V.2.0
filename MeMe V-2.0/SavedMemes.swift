//
//  SavedMemes.swift
//  MeMe V-2.0
//
//  Created by Vasanth Kodeboyina on 6/22/16.
//  Copyright © 2016 Anish Kodeboyina. All rights reserved.
//

import UIKit

class SavedMemes: NSObject
{
    var arrayOfMemes: [MemeModel] = []
    static let sharedInstace = SavedMemes()
    var selectedIndex: Int!
}
