//
//  ViewControllerMazzo.swift
//  Progetto Gioco con Strade
//
//  Created by Leonardo Cappello on 17/05/22.
//

import UIKit

class ViewControllerMazzo: UIViewController {

    @IBOutlet var stepper: [UIStepper]!
    @IBOutlet var lbl: [UILabel]!
    @IBOutlet weak var lblTot: UILabel!
    @IBOutlet weak var btnHome: UIButton!
    
    var mazzoPlayer1:[Int] = Array.init(repeating: 4, count: 10)
    var mazzoPlayer2:[Int] = Array.init(repeating: 4, count: 10)
    var mazzoPlayer3:[Int] = Array.init(repeating: 4, count: 10)
    
    var totale = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for s in stepper {
            s.maximumValue = 40
            s.stepValue = 2
            s.value = 4
        }
    }
    
    @IBAction func valueChangedStepper(_ sender: UIStepper) {
        var i = 0
        while i < stepper.count {
            if sender == stepper[i] {
                lbl[i].text! = String(Int(stepper[i].value))
            }
            i+=1
        }
        totale = 0
        for s in stepper {
            totale = totale + Int(s.value)
        }
        lblTot.text! = totale.description
        if totale == 40 {
            btnHome.isEnabled = true
            btnHome.backgroundColor = UIColor.systemYellow
        } else {
            btnHome.isEnabled = false
            btnHome.backgroundColor = UIColor.lightGray
        }
    }
    
    @IBAction func mazzoCompleto(_ sender: UIButton) {
        var c = 0
        while c < stepper.count {
            mazzoPlayer1[c] = Int(stepper[c].value)
            mazzoPlayer2[c] = Int(stepper[c].value)
            mazzoPlayer3[c] = Int(stepper[c].value)
            c+=1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            guard let identifier = segue.identifier else {
                return
            }
            switch identifier {
            case "mazzoToHome":
                let home = segue.destination as! ViewControllerHome
                home.mazzoPlayer1 = mazzoPlayer1
                home.mazzoPlayer2 = mazzoPlayer2
                home.mazzoPlayer3 = mazzoPlayer3
            default:
                return
            }
    }
    
}
