//
//  ViewController.swift
//  Progetto Gioco con Strade
//
//  Created by Leonardo Cappello on 15/05/22.
//

import Foundation
import UIKit



class ViewController: UIViewController {
    
    @IBOutlet var CampoBottoni: [UIButton]!
    
    @IBOutlet var btnRiga0: [UIButton]!
    @IBOutlet var btnRiga1: [UIButton]!
    @IBOutlet var btnRiga2: [UIButton]!
    @IBOutlet var btnRiga3: [UIButton]!
    @IBOutlet var btnRiga4: [UIButton]!
    @IBOutlet var btnRiga5: [UIButton]!
    @IBOutlet var btnRiga6: [UIButton]!
    @IBOutlet var btnRiga7: [UIButton]!
    @IBOutlet var btnRiga8: [UIButton]!
    
    @IBOutlet var selezioneTessera: [UIButton]!
    
    @IBOutlet weak var bottoneSelezione: UIButton!
    @IBOutlet weak var imageViewTesseraAttuale: UIImageView!
    @IBOutlet weak var lblOutput: UILabel!
    
    var partita:Partita? = nil
    var mazzoPlayer1:[Int] = []
    var mazzoPlayer2:[Int] = []
    var mazzoPlayer3:[Int] = []
    var numDiGiocatori = 0
    var playerAttuale = 0
    var matriceBottoni:[[UIButton]] = []
    var tesseraAttuale:Tessera = Tessera(id: 210, ChiuseID: 0, PlayerID: 0)
    
    var dizionarioNumImg = [ 6: [0:UIImage(named: "6 0"),
                                  5:UIImage(named: "6 5"),
                                  7:UIImage(named: "6 7"),
                                  35:UIImage(named: "6 35") ],
                              14: [0:UIImage(named: "14 0"),
                                   3:UIImage(named: "14 3"),
                                   5:UIImage(named: "14 5"),
                                   15:UIImage(named: "14 15")],
                              15: [0:UIImage(named: "15 0"),
                                   2:UIImage(named: "15 2"),
                                   7:UIImage(named: "15 7"),
                                   14:UIImage(named: "15 14")],
                              35: [0:UIImage(named: "35 0"),
                                   2:UIImage(named: "35 2"),
                                   3:UIImage(named: "35 3"),
                                   6:UIImage(named: "35 6")],
                              10: [0:UIImage(named: "10 0"),
                                   3:UIImage(named: "10 3"),
                                   7:UIImage(named: "10 7"),
                                   21:UIImage(named: "10 21")],
                              21: [0:UIImage(named: "21 0"),
                                   2:UIImage(named: "21 2"),
                                   5:UIImage(named: "21 5"),
                                   10:UIImage(named: "21 10")],
                              30: [0:UIImage(named: "30 0"),
                                   7:UIImage(named: "30 7")],
                              42: [0:UIImage(named: "42 0"),
                                   5:UIImage(named: "42 5")],
                              70: [0:UIImage(named: "70 0"),
                                   3:UIImage(named: "70 3")],
                              105: [0:UIImage(named: "105 0"),
                                   2:UIImage(named: "105 2")],
                              210: [0:UIImage(named: "210 0")]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matriceBottoni.append(btnRiga0)
        matriceBottoni.append(btnRiga1)
        matriceBottoni.append(btnRiga2)
        matriceBottoni.append(btnRiga3)
        matriceBottoni.append(btnRiga4)
        matriceBottoni.append(btnRiga5)
        matriceBottoni.append(btnRiga6)
        matriceBottoni.append(btnRiga7)
        matriceBottoni.append(btnRiga8)
        
        partita = Partita(NumPlayer: numDiGiocatori)
        
        matriceBottoni[4][4].setImage(dizionarioNumImg[210]![0]!, for: UIControl.State.normal)
        partita!.piazzaTessera(i: 4, j: 4, tessera: tesseraAttuale)
        generaNuovaCasella()
    }

    
    @IBAction func ruotaOrario(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.imageViewTesseraAttuale.transform = self.imageViewTesseraAttuale.transform.rotated(by: .pi/2)
        })
        tesseraAttuale.ruotaDestra()
        mostraMossePossibili()
        }
    
    @IBAction func ruotaAntiorario(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.imageViewTesseraAttuale.transform = self.imageViewTesseraAttuale.transform.rotated(by: .pi/(-2))
        })
        tesseraAttuale.ruotaSinistra()
        mostraMossePossibili()
        }
    
    @IBAction func casellaClick(_ sender: UIButton, forEvent event: UIEvent) {
        var i:Int = 0
        var j:Int = 0
        while i < 9 {
            j = 0
            while j < 9 {
                let appo = matriceBottoni[i][j]
                if sender === appo {
                    if partita!.verificaSePiazzabile(i: i, j: j, tessera: tesseraAttuale) {
                        sender.setImage(dizionarioNumImg[tesseraAttuale.ID]![tesseraAttuale.chiuseID]!, for: UIControl.State.normal)
                        if partita!.piazzaTessera(i: i, j: j, tessera: tesseraAttuale) {
                            var vincitore = 0
                            if i == 4 && j == 0 {
                                vincitore = 1
                            } else if i == 0 && j == 4{
                                vincitore = 2
                            } else if i == 4 && j == 8{
                                vincitore = 3
                            }
                            lblOutput.text = "player \(vincitore) ha vinto"
                        }
                        generaNuovaCasella()
                    }
                }
                j += 1
            }
            i += 1
        }
    }
    
    func mostraMossePossibili() {
        for i in CampoBottoni {
            i.backgroundColor = UIColor.white
        }
        var i:Int = 0
        var j:Int = 0
        while i < 9 {
            j = 0
            while j < 9 {
                if partita!.verificaSePiazzabile(i: i, j: j, tessera: tesseraAttuale) {
                    matriceBottoni[i][j].backgroundColor = UIColor.init(red: 0.5, green: 1, blue: 0.5, alpha: 0.5)
                }
                j += 1
            }
            i += 1
        }
    }
    
    @IBAction func rigenera(_ sender: UIButton) {
        generaNuovaCasella()
    }
    
    
    func generaNuovaCasella() {
        tesseraAttuale = partita!.creaTesseraRandom()
        bottoneSelezione.setImage(dizionarioNumImg[tesseraAttuale.ID]![tesseraAttuale.chiuseID]! , for: UIControl.State.normal)
        imageViewTesseraAttuale.image = dizionarioNumImg[tesseraAttuale.ID]![tesseraAttuale.chiuseID]!
        mostraMossePossibili()
        UIView.animate(withDuration: 0.0, animations: {
            self.imageViewTesseraAttuale.transform = CGAffineTransform(rotationAngle: 0)
        }) //reset rotazione
    }
    
}

