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
    
    
    @IBOutlet var manoTessere: [UIButton]!
    var btnManoSelezionato = UIButton()
    
    @IBOutlet weak var imageViewVittoria: UIImageView!
    @IBOutlet weak var lblOutput: UILabel!
    @IBOutlet var btnHome: UIButton!
    
    var partita:Partita? = nil
    var mazzoPlayer1:[Int] = []
    var mazzoPlayer2:[Int] = []
    var mazzoPlayer3:[Int] = []
    var arrMazzoPlayer:[[Int]] = []
    var numDiGiocatori = 0
    var playerAttuale = 0
    var matriceBottoni:[[UIButton]] = []
    
    var tesseraAttuale:Tessera = Tessera(id: 210, ChiuseID: 0, PlayerID: 0)
    var bottoneAttuale = UIButton()
    
    
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
        
        for b in manoTessere {
            b.layer.borderColor = UIColor.systemYellow.cgColor
        }
        
        partita = Partita(NumPlayer: numDiGiocatori)
        
        arrMazzoPlayer.append(mazzoPlayer1)
        arrMazzoPlayer.append(mazzoPlayer2)
        arrMazzoPlayer.append(mazzoPlayer3)
        
        matriceBottoni[4][4].setImage(dizionarioNumImg[210]![0]!, for: UIControl.State.disabled)
        matriceBottoni[4][4].isEnabled = false
        partita!.piazzaTessera(i: 4, j: 4, tessera: tesseraAttuale)
        lblOutput.text = "turno del player 1"
        //generaNuovaCasella()
    }
    
    @IBAction func selezioneTesseraClick(_ sender: UIButton) {
        for b in manoTessere {
            b.layer.borderWidth = 0.0
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.bottoneAttuale.transform = CGAffineTransform(rotationAngle: 0)
        }) //reset rotazione
        bottoneAttuale = sender
        sender.layer.borderWidth = 6.0
        btnManoSelezionato = sender
        var i = 0
        while i < 10 {
            if manoTessere[i] == sender{
                switch i {
                case 0:
                    tesseraAttuale = Tessera(id: 10, ChiuseID: 0, PlayerID: partita!.turno)
                case 1:
                    tesseraAttuale = Tessera(id: 10, ChiuseID: 3, PlayerID: partita!.turno)
                case 2:
                    tesseraAttuale = Tessera(id: 10, ChiuseID: 21, PlayerID: partita!.turno)
                case 3:
                    tesseraAttuale = Tessera(id: 70, ChiuseID: 0, PlayerID: partita!.turno)
                case 4:
                    tesseraAttuale = Tessera(id: 70, ChiuseID: 3, PlayerID: partita!.turno)
                case 5:
                    tesseraAttuale = Tessera(id: 35, ChiuseID: 0, PlayerID: partita!.turno)
                case 6:
                    tesseraAttuale = Tessera(id: 35, ChiuseID: 2, PlayerID: partita!.turno)
                case 7:
                    tesseraAttuale = Tessera(id: 35, ChiuseID: 3, PlayerID: partita!.turno)
                case 8:
                    tesseraAttuale = Tessera(id: 35, ChiuseID: 6, PlayerID: partita!.turno)
                case 9:
                    tesseraAttuale = Tessera(id: 210, ChiuseID: 0, PlayerID: partita!.turno)
                default:
                    return
                }
                mostraMossePossibili()
            }
            i+=1
        }
    }
    
    
    @IBAction func casellaClick(_ sender: UIButton, forEvent event: UIEvent) {
        if arrMazzoPlayer[partita!.turno][manoTessere.firstIndex(of: btnManoSelezionato)!] != 0 {
            var i:Int = 0
            var j:Int = 0
            while i < 9 {
                j = 0
                while j < 9 {
                    let appo = matriceBottoni[i][j]
                    if sender === appo {
                        if partita!.verificaSePiazzabile(i: i, j: j, tessera: tesseraAttuale) {
                            
                            tesseraAttuale = Tessera(id: tesseraAttuale.ID, ChiuseID: tesseraAttuale.chiuseID, PlayerID: partita!.turno)
                            
                            sender.setImage(dizionarioNumImg[tesseraAttuale.ID]![tesseraAttuale.chiuseID]!, for: UIControl.State.disabled)
                            sender.isEnabled = false
                            lblOutput.text = "turno del player \(partita!.turno + 1)"
                            
                            arrMazzoPlayer[partita!.turno][manoTessere.firstIndex(of: btnManoSelezionato)!] -= 1
                            
                            
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
                                animazioneVittoria()
                                for b in CampoBottoni {
                                    b.isEnabled = false
                                }
                                for b in manoTessere {
                                    b.isEnabled = false
                                }
                                for b in manoTessere {
                                    b.layer.borderWidth = 0.0
                                }
                                btnHome.isHidden = false
                            }
                            var i=0
                            for n in arrMazzoPlayer[partita!.turno] {
                                if n == 0 {
                                    manoTessere[i].isEnabled = false
                                } else {
                                    manoTessere[i].isEnabled = true
                                }
                                i+=1
                            }
                            mostraMossePossibili()
                            //generaNuovaCasella()
                        }
                    }
                    j += 1
                }
                i += 1
            }
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
    
    @IBAction func ruotaOrario(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.bottoneAttuale.transform = self.bottoneAttuale.transform.rotated(by: .pi/2)
        })
        tesseraAttuale = Tessera(id: tesseraAttuale.ID, ChiuseID: tesseraAttuale.chiuseID, PlayerID: partita!.turno)
        tesseraAttuale.ruotaDestra()
        mostraMossePossibili()
        }
    
    @IBAction func ruotaAntiorario(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.bottoneAttuale.transform = self.bottoneAttuale.transform.rotated(by: .pi/(-2))
        })
        tesseraAttuale = Tessera(id: tesseraAttuale.ID, ChiuseID: tesseraAttuale.chiuseID, PlayerID: partita!.turno)
        tesseraAttuale.ruotaSinistra()
        mostraMossePossibili()
        }
    
    func animazioneVittoria() {
        imageViewVittoria.isHidden = false
        imageViewVittoria.animationImages = animatedLoad(name: "vittoria")
        imageViewVittoria.animationDuration = 0.6
        imageViewVittoria.animationRepeatCount = 0
        imageViewVittoria.image = imageViewVittoria.animationImages![0]
        imageViewVittoria.startAnimating()
    }
    
    func animatedLoad(name: String) -> [UIImage]{
        var i : Int = 1
        var ris : [UIImage] = []
        var img : UIImage? = UIImage(named: "\(name)/\(i)")
        while img != nil{
            ris.append(img!)
            i += 1
            img = UIImage(named: "\(name)/\(i)")
        }
        return ris
    }
    
    /*
    func generaNuovaCasella() {
        tesseraAttuale = partita!.creaTesseraRandom()
        bottoneSelezione.setImage(dizionarioNumImg[tesseraAttuale.ID]![tesseraAttuale.chiuseID]! , for: UIControl.State.normal)
        imageViewTesseraAttuale.image = dizionarioNumImg[tesseraAttuale.ID]![tesseraAttuale.chiuseID]!
        mostraMossePossibili()
        UIView.animate(withDuration: 0.0, animations: {
            self.imageViewTesseraAttuale.transform = CGAffineTransform(rotationAngle: 0)
        }) //reset rotazione
    }*/
    
}

