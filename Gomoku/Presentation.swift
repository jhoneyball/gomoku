//
//  Presentation.swift
//  Gomoku
//
//  Created by James Honeyball on 30/10/2016.
//  Copyright © 2016 Honeyball. All rights reserved.
//

import Foundation
import UIKit

struct TwoPoints {
    var start: CGPoint
    var finish: CGPoint
}

func calculateGoBoardLines (width: CGFloat, height: CGFloat, columns: Int, rows: Int) -> [TwoPoints]{
    var lines = [TwoPoints]()

    let multiplierForBottomOfBoard = CGFloat(rows) / (CGFloat(rows) + 1.0)
    let multiplierForTopOfBoard = 1.0 / (CGFloat(rows) + 1.0)

    for column in 1...columns {

        let x = CGFloat(column) * (width / (CGFloat(columns) + 1.0))

        let coOrdinateAX = x
        let coOrdinateAY = multiplierForTopOfBoard * height
        let coOrdinateBX = x
        let coOrdinateBY = multiplierForBottomOfBoard * height

        lines.append(TwoPoints(start:CGPoint(x:coOrdinateAX, y:coOrdinateAY), finish:CGPoint(x:coOrdinateBX, y:coOrdinateBY)))
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

func getCGPointForCoOrds(col: Int, row: Int, columns: Int,
                        rows: Int,
                        width: CGFloat,
                        height: CGFloat) -> CGPoint {
   
    let x = CGFloat(col) / CGFloat(columns + 1) * width
    let y = CGFloat(row) / CGFloat(rows + 1) * height
    return CGPoint(x: x, y: y)
}

func getRadiusForDimensions (cols: Int, width: CGFloat) -> CGFloat {
    return width / CGFloat(cols) / 2.5
}
