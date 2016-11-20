//
//  Presentation.swift
//  Gomoku
//
//  Created by James Honeyball on 30/10/2016.
//  Copyright © 2016 Honeyball. All rights reserved.
//

import Foundation
import UIKit


protocol inputProtocol {
    func tap(location: CGPoint)
    func calculateGoBoardLines() -> [TwoPoints]
    func calculateStonCoOrds() -> [StoneDrawDetails]

}

struct TwoPoints {
    var start: CGPoint
    var finish: CGPoint
}

enum StoneColour {
    case BLACK
    case WHITE
}

struct StoneDrawDetails {
    var centre: CGPoint
    var radius: CGFloat
    var colour: StoneColour
}


class BoardPresenter: inputProtocol {
    let board: BoardProtocol
    private let frame: CGRect
    
    init (board: BoardProtocol, frame: CGRect) {
        self.board = board
        self.frame = frame
    }
    
    func tap(location: CGPoint) {
        let intersection = getCoOrdsForCGPont(cGPoint: location, width: frame.size.width, height: frame.size.height, columns: board.getColumns(), rows: board.getRows())
        print ("clicked column:\(intersection.column) row:\(intersection.row)")
        board.place(intersection: intersection, player: Player.White)
    }

    func calculateGoBoardLines () -> [TwoPoints]{
        let width = frame.size.width
        let height = frame.size.height
        let columns = board.getColumns()
        let rows = board.getRows()
        
        
        var lines = [TwoPoints]()
        
        let multiplierForBottomOfBoard = CGFloat(rows) / (CGFloat(rows) + 1.0)
        let multiplierForTopOfBoard = 1.0 / (CGFloat(rows) + 1.0)
        
        for column in 1...columns {
            
            let x = CGFloat(column) * (width / (CGFloat(columns) + 1.0))
            
            let coOrdinateAX = x
            let coOrdinateAY = multiplierForTopOfBoard * height
            let coOrdinateBX = x
            let coOrdinateBY = multiplierForBottomOfBoard * height
            
            lines.append(TwoPoints(start: CGPoint(x:coOrdinateAX, y:coOrdinateAY), finish: CGPoint(x:coOrdinateBX, y:coOrdinateBY)))
        }
        
        let multiplierForLeftOfBoard = 1.0 / (CGFloat(columns) + 1.0)
        let multiplierForRightOfBoard = CGFloat(columns) / (CGFloat(columns) + 1.0)
        
        for row in 1...rows {
            
            let y = CGFloat(row) * (height / (CGFloat(rows) + 1.0))
            
            let coOrdinateAX = multiplierForLeftOfBoard * width
            let coOrdinateAY = y
            let coOrdinateBX = multiplierForRightOfBoard * width
            let coOrdinateBY = y
            
            lines.append(TwoPoints(start:CGPoint(x:coOrdinateAX, y:coOrdinateAY), finish:CGPoint(x:coOrdinateBX, y:coOrdinateBY)))
        }
        
        return lines
    }
    
    func calculateStonCoOrds() -> [StoneDrawDetails] {
        
        var stoneCoOrdArray = [StoneDrawDetails]()
        
        for col in 0..<board.getColumns() {
            for row in 0..<board.getRows() {
                let stone = try! board.get(intersection: Intersection(column: col, row: row))
                if stone != Player.Empty {
                    
                    var colour: StoneColour
                    var radius: CGFloat
                    var centre: CGPoint
                    
                    if stone == Player.White {
                        colour = StoneColour.WHITE
                    } else {
                        colour = StoneColour.BLACK
                    }
                    
                    centre = getCGPointForCoOrds(col: col,
                                                     row: row,
                                                     columns: board.getColumns(),
                                                     rows: board.getRows(),
                                                     width: frame.size.width,
                                                     height: frame.size.height)
                    
                    radius = getRadiusForDimensions()
                    
                    let stoneDrawDetails = StoneDrawDetails(centre: centre, radius: radius, colour: colour)
                    stoneCoOrdArray.append(stoneDrawDetails)
                }
            }
        }
    return stoneCoOrdArray
    }
    
    func getRadiusForDimensions () -> CGFloat {
        return frame.size.width / CGFloat(board.getColumns() + 1) / 2.5
    }
    
}


func getCGPointForCoOrds(col: Int, row: Int, columns: Int,
                        rows: Int,
                        width: CGFloat,
                        height: CGFloat) -> CGPoint {
   
    let x = CGFloat(col + 1) / CGFloat(columns + 1) * width
    let y = CGFloat(row + 1) / CGFloat(rows + 1) * height
    return CGPoint(x: x, y: y)
}

func getCoOrdsForCGPont(cGPoint: CGPoint, width: CGFloat, height: CGFloat, columns: Int, rows: Int) -> Intersection {
    var x = Int(round(cGPoint.x / width * CGFloat(columns+1))) - 1
    var y = Int(round(cGPoint.y / height * CGFloat(rows+1))) - 1

    switch x {
    case _ where x < 0:
        x = 0
    case _ where x >= columns:
        x = columns-1
    default: break
    }

    switch y {
    case _ where y < 0:
        y = 0
    case _ where y >= rows:
        y = rows-1
    default: break
    }
    
    return Intersection(column: x, row: y)
}


