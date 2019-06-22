//
//  RatingControl.swift
//  TutorialFoodTracker
//
//  Created by Yang Lu on 2019-06-21.
//  Copyright © 2019 IdiotLeon. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    // Mark: Properties
    private var ratingButtons = [UIButton]()
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5{
        didSet{
            setupButtons()
        }
    }
    
    var rating = 0{
        didSet{
            updateButtonSelectionStates()
        }
    }
    
    // Mark: Initialization
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // Mark: Private Methods
    private func setupButtons(){
        
        // to clear any existing buttons
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // to load button images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in:bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount{
            // to create the button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // to set button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // to add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
            
            // to setup the button to the stack
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // to add the button to the stack
            addArrangedSubview(button)
            
            // to add the new button to the rating button array
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
    }
    
    // Mark: Button Action
    @objc func ratingButtonTapped(button:UIButton){
        guard let index = ratingButtons.firstIndex(of: button)else{
            fatalError("The button, \(button), is not in the ratingButtons array: \(COREVIDEO_USE_EAGLCONTEXT_CLASS_IN_API)")
        }
        
        // to calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating{
            // if the selected star represents the current rating, to reset the rating to 0
            rating = 0
        }else{
            // otherwise to set the rating to the selected star
            rating = selectedRating
        }
    }
    
    private func updateButtonSelectionStates(){
        for(index, button) in ratingButtons.enumerated(){
            // if the index of a button is less than the rating, that button should be selected
            button.isSelected = index < rating
        }
    }
}
