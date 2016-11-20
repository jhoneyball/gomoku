
import XCTest

@testable import Gomoku

class GomokuRules_Test: XCTestCase {
    
    var board: Board!
    var rules: GomokuRules!
    
    override func setUp() {
        board = Board(columns: 19, rows: 19)
        rules = GomokuRules()
        super.setUp()
    }
    
    
    func testEmptyBoardIsNotWin() {
        try XCTAssertFalse(rules.isWin(board: board))
    }

    func testNotEmptyBoardButNotWin_isNotAWin() throws {
        board.place(intersection: Intersection(column: 1, row: 1), player: Player.White)
        try XCTAssertFalse(rules.isWin(board: board))
    }

    
    func testFiveInARowInTheFirstRow_isAWin() throws {
        let printBoard = PrintBoard()
        
        for col in 0..<5 {
            board.place(intersection: Intersection(column: col, row: 0), player: Player.White)
        }
        try XCTAssertTrue(rules.isWin(board: board))
        print (printBoard.printAsFormattedString (board: board))
    }
    
    func testFourInARowInTheFirstRow_isNotAWin() throws {
        let printBoard = PrintBoard()
        
        for col in 0..<4 {
            board.place(intersection: Intersection(column: col, row: 0), player: Player.White)
            
        }
        try XCTAssertFalse(rules.isWin(board: board))
        print (printBoard.printAsFormattedString (board: board))
    }
    
    func testSixInARowInTheFirstRow_isAWin() throws {
        let printBoard = PrintBoard()
        
        for col in 0..<6 {
            board.place(intersection: Intersection(column: col, row: 0), player: Player.White)
        }
        try XCTAssertTrue(rules.isWin(board: board))
        print (printBoard.printAsFormattedString (board: board))
    }
    
    func testFiveInAnyRow_isAWin() throws {
        let printBoard = PrintBoard()
        
        for row in 0..<board.getRows() {
            board = Board(columns: 19, rows: 19)
            for col in 0..<5 {
                board.place(intersection: Intersection(column: col, row: row), player: Player.White)
            }
            print (printBoard.printAsFormattedString (board: board))
        try XCTAssertTrue(rules.isWin(board: board))
        }
    }
    
    
}
