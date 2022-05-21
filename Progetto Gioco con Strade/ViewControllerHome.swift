//
//  ViewControllerHome.swift
//  Progetto Gioco con Strade
//
//  Created by Leonardo Cappello on 15/05/22.
//

import UIKit

class ViewControllerHome: UIViewController {

    var mazzoPlayer1:[Int] = []
    var mazzoPlayer2:[Int] = []
    var mazzoPlayer3:[Int] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Start(_ sender: UIButton) {
        self.performSegue(withIdentifier: "homeToGioco", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            guard let identifier = segue.identifier else {
                return
            }
            switch identifier {
            case "homeToGioco":
                let gioco = segue.destination as! ViewController
                //gioco.numDiGiocatori = self.segmentNumGiocatori.selectedSegmentIndex + 1
                gioco.numDiGiocatori = 3
                gioco.mazzoPlayer1 = mazzoPlayer1
                gioco.mazzoPlayer2 = mazzoPlayer2
                gioco.mazzoPlayer3 = mazzoPlayer3
            default:
                return
            }
    }
    	
}
