//
//  GameTest.swift
//  Gomoku
//
//  Created by James Honeyball on 20/11/2016.
//  Copyright © 2016 Honeyball. All rights reserved.
//

import XCTest
@testable import Gomoku

class GameTest: XCTestCase {

    
    func testCanCreateGame() {
        let board = Board(columns: 19, rows: 19)
        let rules = GomokuRules()
        let game = Game(board: board, rules: rules)
        
        XCTAssertEqual(Player.White, game.whosTurn())
        
    }
    
    func testAfterWhitesTurn_isBlackTurn() {
        let board = Board(columns: 19, rows: 19)
        let rules = GomokuRules()
        let game = Game(board: board, rules: rules)
        
        XCTAssertEqual(Player.White, game.whosTurn())
        
        game.takeTurn(intersection: Intersection(column: 0, row: 0))
        
        //XCTAssertEqual(Player.White, board.get(0,0))
        
        
    }
    
}
