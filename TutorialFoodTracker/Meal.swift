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
        // the name must not be empty
        guard !name.isEmpty else{
            return nil
        }
        
        // the rating must be between 0 and 5 inclusive
        guard(rating >= 0)&&(rating <= 5)else{
            return nil
        }
        
        // to initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
