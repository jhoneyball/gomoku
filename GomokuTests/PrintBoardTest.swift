

import XCTest

@testable import Gomoku


class PrintBoardTest: XCTestCase {
    var board: Board!
    let printBoard = PrintBoard()
    
    override func setUp() {
        super.setUp()
        board = Board(columns: 19, rows: 19)
    }
    
    

    func testBoardWithNoStonePlaye() throws {
        let emptyBoardString =
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000"
                
        XCTAssertEqual(emptyBoardString, printBoard.printAsSingleString(board: board))
    }
    
    func testBoardWithOneStonePlayedIn3x4() throws {
        try board.place(intersection: Intersection(column: 4, row: 3), player: Player.White)
        
        let boardWith4x3 =
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000W00000000000000" + // W has been placed in 4,3
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000" +
            "0000000000000000000"
        
        XCTAssertEqual(boardWith4x3, printBoard.printAsSingleString(board: board))
       
        
    }
    
}
