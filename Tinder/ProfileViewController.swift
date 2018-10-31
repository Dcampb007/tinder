//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Andre Campbell on 10/30/18.
//  Copyright © 2018 Andre Campbell. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapDone(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    





}
