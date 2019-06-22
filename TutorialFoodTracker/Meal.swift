//
//  Meal.swift
//  TutorialFoodTracker
//
//  Created by Yang Lu on 6/22/19.
//  Copyright © 2019 IdiotLeon. All rights reserved.
//

import UIKit

class Meal{

    var name:String
    var photo:UIImage?
    var rating:Int
    
    init?(name: String, photo:UIImage?, rating:Int){
        // initialization should fail if there is no name or if the rating is negative
        if name.isEmpty || rating < 0{
            return nil
        }
        
        // to initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
