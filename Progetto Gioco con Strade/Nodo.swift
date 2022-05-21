//
//  Nodo.swift
//  Progetto Gioco con Strade
//
//  Created by Leonardo Cappello on 16/05/22.
//

import Foundation

class Nodo {
    var nCollegati: [Nodo] = []
    var visitato:Bool = false
    var playerID = 0
    var isDestinazione = false
    
    
    
    func aggungiNodoCollegato(n:Nodo, PlayerID:Int) {
        nCollegati.append(n)
        n.aggiungiNodoCollegatoUnidirezionale(n: self)     //collegameto bidirezionale
        playerID = PlayerID
    }
    
    func aggiungiNodoCollegatoUnidirezionale(n:Nodo) {
        nCollegati.append(n)
    }
    
}
