//
//  ResultViewController.swift
//  Tip
//
//  Created by Ahmed Alaa on 15/07/2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    //Mark: - Outlets.
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    //Mark: - Properties.
    var result = "0.0"
    var tip = 10
    var split = 2
    
    //Mark: - LifeCycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip"

    }
    
    //Mark: - Actions.
    @IBAction func recalculatorBtnTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    


}
