//
//  Mannerism.swift
//  TeachManners
//
//  Created by Madison Pahl on 4/12/16.
//  Copyright © 2016 Madison Pahl. All rights reserved.
//

import UIKit

protocol Mannerism {
    
    var image : UIImage {get}
    var name : String {get}
    var description : String {get}
    var viewed : Bool {get set}
    
}

