//
//  Partita.swift
//  Progetto Gioco con Strade
//
//  Created by Leonardo Cappello on 15/05/22.
//

import Foundation

class Partita {
    
    var mat:[[Tessera]] /*= Array(repeating: Array(repeating: Tessera(id: 0, ChiuseID: 0, PlayerID: 0), count: 9), count: 9)*/
    
    var mazzoPlayer1:[Int] = []
    var mazzoPlayer2:[Int] = []
    var mazzoPlayer3:[Int] = []
    
    var turno = 0
    
    var numPlayer = 0
    
    init(NumPlayer:Int) {
        numPlayer = NumPlayer
        mat=[]
        for i in 0...8
        {
            mat.append([])
            for _ in 0...8
            {
                mat[i].append(Tessera(id: 0, ChiuseID: 0, PlayerID: 0))
            }
        }
    }
    
    func piazzaTessera(i:Int, j:Int, tessera:Tessera) -> Bool{
        mat[i][j] = tessera
        if (i == 4 && j == 0) || (i == 4 && j == 8) || (i == 0 && j == 4) {
            tessera.nodo.isDestinazione = true
        }
        if j > 0 {
            if mat[i][j-1].ID != 0 {
                if tessera.ID%2 == 0 {
                    if mat[i][j-1].ID%5 == 0 {
                        tessera.nodo.aggungiNodoCollegato(n: mat[i][j-1].nodo, PlayerID: turno)
                    }
                }
            }
        }
        if j < mat.count-1 {
            if mat[i][j+1].ID != 0 {
                if tessera.ID%5 == 0 {
                    if mat[i][j+1].ID%2 == 0 {
                        tessera.nodo.aggungiNodoCollegato(n: mat[i][j+1].nodo, PlayerID: turno)
                    }
                }
            }
        }
        if i > 0 {
            if mat[i-1][j].ID != 0 {
                if tessera.ID%3 == 0 {
                    if mat[i-1][j].ID%7 == 0 {
                        tessera.nodo.aggungiNodoCollegato(n: mat[i-1][j].nodo, PlayerID: turno)
                    }
                }
            }
        }
        if i < mat.count-1 {
            if mat[i+1][j].ID != 0 {
                if tessera.ID%7 == 0 {
                    if mat[i+1][j].ID%3 == 0 {
                        tessera.nodo.aggungiNodoCollegato(n: mat[i+1][j].nodo, PlayerID: turno)
                    }
                }
            }
        }

        let isVittoria = verificaVittoia(partenza: mat[4][4].nodo, playerID: turno)
        turno+=1
        if turno >= numPlayer {
            turno = 0
        }
        return isVittoria
    }
    
    func verificaSePiazzabile(i:Int, j:Int, tessera:Tessera) -> Bool {
        if mat[i][j].ID == 0 {
            var collegamenti = 0
            if j > 0 {
                if mat[i][j-1].ID != 0 {
                    if tessera.ID%2 == 0 {
                        if mat[i][j-1].ID%5 != 0 {
                            if mat[i][j-1].chiuseID == 0 || mat[i][j-1].chiuseID%5 != 0 {
                                return false
                            } else {collegamenti+=1}
                        } else {collegamenti+=1}
                    } else if tessera.chiuseID != 0 && tessera.chiuseID%2 == 0 {
                        if mat[i][j-1].ID%5 != 0 && (mat[i][j-1].chiuseID == 0 || mat[i][j-1].chiuseID%5 != 0) {
                            return false
                        } else {collegamenti+=1}
                    } else {
                        if mat[i][j-1].ID%5 == 0 {
                            return false
                        }
                        if mat[i][j-1].chiuseID != 0 && mat[i][j-1].chiuseID%5 == 0 {
                            return false
                        }
                    }
                }
            }
            
            if j < 8 {
                if mat[i][j+1].ID != 0 {
                    if tessera.ID%5 == 0 {
                        if mat[i][j+1].ID%2 != 0 {
                            if mat[i][j+1].chiuseID == 0 || mat[i][j+1].chiuseID%2 != 0 {
                                return false
                            } else {collegamenti+=1}
                        } else {collegamenti+=1 }
                    } else if tessera.chiuseID != 0 && tessera.chiuseID%5 == 0 {
                        if mat[i][j+1].ID%2 != 0 && (mat[i][j+1].chiuseID == 0 || mat[i][j+1].chiuseID%2 != 0) {
                            return false
                        } else {collegamenti+=1}
                    } else {
                        if mat[i][j+1].ID%2 == 0 {
                            return false
                        }
                        if mat[i][j+1].chiuseID != 0 && mat[i][j+1].chiuseID%2 == 0 {
                            return false
                        }
                    }
                }
            }
            
            if i > 0 {
                if mat[i - 1][j].ID != 0 {
                    if tessera.ID%3 == 0 {
                        if mat[i-1][j].ID%7 != 0 {
                            if mat[i-1][j].chiuseID == 0 || mat[i-1][j].chiuseID%7 != 0 {
                                return false
                            } else {collegamenti+=1}
                        } else {collegamenti+=1}
                    } else if tessera.chiuseID != 0 && tessera.chiuseID%3 == 0 {
                        if mat[i-1][j].ID%7 != 0 && (mat[i-1][j].chiuseID == 0 || mat[i-1][j].chiuseID%7 != 0) {
                            return false
                        } else {collegamenti+=1}
                    } else {
                        if mat[i-1][j].ID%7 == 0 {
                            return false
                        }
                        if mat[i-1][j].chiuseID != 0 && mat[i-1][j].chiuseID%7 == 0 {
                            return false
                        }
                    }
                }
            }
            
            if i < 8 {
                if mat[i + 1][j].ID != 0 {
                    if tessera.ID%7 == 0 {
                        if mat[i+1][j].ID%3 != 0 {
                            if mat[i+1][j].chiuseID == 0 || mat[i+1][j].chiuseID%3 != 0 {
                                return false
                            } else {collegamenti+=1}
                        } else {collegamenti+=1}
                    } else if tessera.chiuseID != 0 && tessera.chiuseID%7 == 0 {
                        if mat[i+1][j].ID%3 != 0 && (mat[i+1][j].chiuseID == 0 || mat[i+1][j].chiuseID%3 != 0) {
                            return false
                        } else {collegamenti+=1}
                    } else {
                        if mat[i+1][j].ID%3 == 0 {
                            return false
                        }
                        if mat[i+1][j].chiuseID != 0 && mat[i+1][j].chiuseID%3 == 0 {
                            return false
                        }
                    }
                }
            }
            if collegamenti > 0 {
                return true
            }
        }
        return false
    }
    
    func verificaVittoia(partenza:Nodo, playerID:Int) -> Bool{
        var daVisitare:[Nodo] = [partenza]
        var visitati:[Nodo] = []
        var ris = false
        
        while daVisitare.count > 0 && !ris {
            
            if ris == false {
                if daVisitare[0].isDestinazione /*&& daVisitare[0].playerID == playerID */{
                    ris = true
                } else {
                    for c in daVisitare[0].nCollegati {
                        if c.visitato == false {
                            daVisitare.append(c)
                        }
                    }
                    daVisitare[0].visitato = true
                    visitati.append(daVisitare[0])
                    daVisitare.remove(at: 0)
                }
            }
        }
        for n in visitati {
            n.visitato = false
        }
        return ris
        
    }

    func creaTesseraRandom() -> Tessera {
        var ID:Int = 1
        var numStrade:Int = 0
        while numStrade < 2 {
            ID = 1
            numStrade = 0
            if Bool.random() {
                ID = ID * 2
                numStrade+=1
            }
            if Bool.random() {
                ID = ID * 3
                numStrade+=1
            }
            if Bool.random() {
                ID = ID * 5
                numStrade+=1
            }
            if Bool.random() {
                ID = ID * 7
                numStrade+=1
            }
        }
        
        var chiuseID:Int = 1
        if ID%2 != 0 {
            if Bool.random() {
                chiuseID = chiuseID * 2
            }
        }
        if ID%3 != 0 {
            if Bool.random() {
                chiuseID = chiuseID * 3
            }
        }
        if ID%5 != 0 {
            if Bool.random() {
                chiuseID = chiuseID * 5
            }
        }
        if ID%7 != 0 {
            if Bool.random() {
                chiuseID = chiuseID * 7
            }
        }
        if chiuseID == 1 {
            chiuseID = 0
        }
        return Tessera(id: ID, ChiuseID: chiuseID, PlayerID: 0)
    }

    
    
}

