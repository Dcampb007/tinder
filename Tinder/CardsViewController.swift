//
//  CardsViewController.swift
//  Tinder
//
//  Created by Andre Campbell on 10/29/18.
//  Copyright © 2018 Andre Campbell. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    var cardInitialCenter: CGPoint!
    var fadeTransition: FadeTransition!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didPan(_ sender: AnyObject) {
        
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        if sender.state == .began {
            print("Gesture began")
            cardInitialCenter = imageView.center
        } else if sender.state == .changed {
            print("Gesture is changing")
            imageView.center = CGPoint(x:cardInitialCenter.x + translation.x, y:cardInitialCenter.y)
            if velocity.x > 0 {
                imageView.transform = imageView.transform.rotated(by: CGFloat(0.15 * M_PI / 180))
        
            } else {
                imageView.transform = imageView.transform.rotated(by: CGFloat(-0.15 * M_PI / 180))
                }
        } else if sender.state == .ended {
            print("Gesture ended")
            if (translation.x < -50) {
                imageView.removeFromSuperview()
            }
            else if (translation.x > 50) {
                imageView.removeFromSuperview()
            }
            else {
                imageView.center.x = cardInitialCenter.x
                imageView.center.y = cardInitialCenter.y
                imageView.transform = CGAffineTransform.identity
            }
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        let vc = segue.destination as! ProfileViewController
        vc.image = imageView.image!
        
        // Set the modal presentation style of your destinationViewController to be custom.
        vc.modalPresentationStyle = UIModalPresentationStyle.custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        vc.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0
    }

    
    
}

