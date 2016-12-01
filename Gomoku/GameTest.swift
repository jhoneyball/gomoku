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
        let board = BoardFactory.makeBoard(columns: 19, rows: 19)
        let game = GameFactory.makeGomokuGame(board: board)
        
        XCTAssertEqual(Player.White, game.whosTurn())
        
    }
    
    func testAfterWhitesTurn_isBlackTurn() {
        let board = BoardFactory.makeBoard(columns: 19, rows: 19)
        let game = GameFactory.makeGomokuGame(board: board)
        
        XCTAssertEqual(Player.White, game.whosTurn())
        XCTAssertEqual(Player.Empty, board.get(intersection: Intersection(column: 0, row: 0)))

        game.takeTurn(intersection: Intersection(column: 0, row: 0))

        XCTAssertEqual(Player.White, board.get(intersection: Intersection(column: 0, row: 0)))
        XCTAssertEqual(Player.Black, game.whosTurn())
    }
    
}
