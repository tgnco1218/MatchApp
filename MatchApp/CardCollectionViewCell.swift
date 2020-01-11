//
//  CardCollectionViewCell.swift
//  MatchApp
//
//  Created by KYT on 2020/1/2.
//  Copyright © 2020 tgnco1218. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func setCard(_ card:Card) {
        
        // Keep track of the card that gets passed in
        self.card = card
        
        frontImageView.image = UIImage(named: card.imageName)
        
        if card.isMatched == true {
            
            // If the card has been matched, make the image views invisible
            backImageView.alpha = 0
            frontImageView.alpha = 0
            
            return
        }
            
        else {
            
            // If the card hasn't been matched, make the image views visible
            backImageView.alpha = 1
            frontImageView.alpha = 1
        }
        
        // Determine if the card is in a flipped up state or flipped up state
        if card.isFlipped == true {
            
            // Make sure the frontImageView is on top
            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        else {
            
            // Make sure the backImageView is on top
            UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
        }
        
    }
    
    func flip() {
        
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        
    }
    
    func flipBack() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.3, options:[.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
            
        }
    }
    
    func remove() {
        
        // Remove both imageviews from being visible
        backImageView.alpha = 0 // opacity
        
        // TODO: Animate it
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            
            self.frontImageView.alpha = 0
            
        }, completion: nil)
    }
}
