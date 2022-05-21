//
//  Tessera.swift
//  Progetto Gioco con Strade
//
//  Created by Leonardo Cappello on 15/05/22.
//

import Foundation

class Tessera {
    var ID = 0
    var chiuseID = 0
    var playerID = 0
    var nodo:Nodo
    
    
    init(id:Int, ChiuseID:Int , PlayerID:Int) {
        ID = id
        chiuseID = ChiuseID
        playerID = PlayerID
        nodo = Nodo()
    }
    
    func ruotaDestra() {
        var newID = 1
        var newChiuseID = 1
        if ID%2 == 0 {
            newID = newID * 3
        } else if chiuseID != 0 && chiuseID%2 == 0 {
            newChiuseID = newChiuseID * 3
        }
        if ID%3 == 0 {
            newID = newID * 5
        } else if chiuseID != 0 && chiuseID%3 == 0 {
            newChiuseID = newChiuseID * 5
        }
        if ID%5 == 0 {
            newID = newID * 7
        } else if chiuseID != 0 && chiuseID%5 == 0 {
            newChiuseID = newChiuseID * 7
        }
        if ID%7 == 0 {
            newID = newID * 2
        } else if chiuseID != 0 && chiuseID%7 == 0 {
            newChiuseID = newChiuseID * 2
        }
        if newChiuseID == 1 {
            newChiuseID = 0
        }
        ID = newID
        chiuseID = newChiuseID
    }
    
    func ruotaSinistra() {
        var newID = 1
        var newChiuseID = 1
        if ID%2 == 0 {
            newID = newID * 7
        } else if chiuseID != 0 && chiuseID%2 == 0 {
            newChiuseID = newChiuseID * 7
        }
        if ID%3 == 0 {
            newID = newID * 2
        } else if chiuseID != 0 && chiuseID%3 == 0 {
            newChiuseID = newChiuseID * 2
        }
        if ID%5 == 0 {
            newID = newID * 3
        } else if chiuseID != 0 && chiuseID%5 == 0 {
            newChiuseID = newChiuseID * 3
        }
        if ID%7 == 0 {
            newID = newID * 5
        } else if chiuseID != 0 && chiuseID%7 == 0 {
            newChiuseID = newChiuseID * 5
        }
        if newChiuseID == 1 {
            newChiuseID = 0
        }
        ID = newID
        chiuseID = newChiuseID
    }
    
}
