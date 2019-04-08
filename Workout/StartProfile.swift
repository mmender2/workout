//
//  StartProfile.swift
//  Workout
//
//  Created by Max Mender on 4/2/19.
//  Copyright © 2019 Max Mender. All rights reserved.
//

import UIKit

class StartProfile: UIViewController {
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var nameOutput: UILabel!
    @IBOutlet weak var nameButtEdit: UIButton!
    @IBOutlet weak var heightButtEdit: UIButton!
    
    
    
    @IBAction func nameButt(_ sender: Any)
    {
        nameOutput.text = nameInput.text
        nameOutput.textColor = UIColor.black
        UserDefaults.standard.set(nameInput.text, forKey: "name")
        nameInput.isUserInteractionEnabled = false
        nameOutput.text = nameOutput.text! + "\n\n" + heightInput.text!
        UserDefaults.standard.set(heightInput.text, forKey: "height")
        heightInput.isUserInteractionEnabled = false
        heightInput.isHidden = true
        nameInput.isHidden = true
        
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameButtEdit.layer.cornerRadius = 10
        nameButtEdit.clipsToBounds = true
    }

    
    override func viewDidAppear(_ animated: Bool)
    {
        var x = 0
        
        if let nameLoad = UserDefaults.standard.object(forKey: "name") as? String
        {
            nameOutput.text = nameLoad
            x = 1
        }
        
        if let heightLoad = UserDefaults.standard.object(forKey: "height") as? String
        {
            nameOutput.text = nameOutput.text! + "\n\n" + heightLoad
        
        }
        
        if(x == 1)
        {
            nameInput.text = ""
            nameOutput.textColor = UIColor.black
            nameInput.isUserInteractionEnabled = false
            nameInput.isHidden = true
            nameButtEdit.isHidden = true
            nameButtEdit.isUserInteractionEnabled = false
            
        }
    }
 

}
