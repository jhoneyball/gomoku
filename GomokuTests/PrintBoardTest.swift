

import XCTest

@testable import Gomoku


class PrintBoardTest: XCTestCase {
    var board: Board!
    
    override func setUp() {
        super.setUp()
        board = BoardFactory.makeBoard(columns: 19, rows: 19)
    }
    
    

    func testBoardWithNoStonePlaye() {
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
                
        XCTAssertEqual(emptyBoardString, PrintBoard.printAsSingleString(board: board))
    }
    
    func testBoardWithOneStonePlayedIn3x4() {
        board.place(intersection: Intersection(column: 4, row: 3), player: Player.White)
        
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
        
        XCTAssertEqual(boardWith4x3, PrintBoard.printAsSingleString(board: board))
       
        
    }
    
}
