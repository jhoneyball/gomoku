import XCTest

@testable import Gomoku

class GomokuRulesTest: XCTestCase {
    var board: Board!
    var rules: GomokuRules!

    override func setUp() {
        board = BoardFactory.makeBoard(columns: 19, rows: 19)
        rules = GomokuRules()
        super.setUp()
    }

    func testEmptyBoardIsNotWin() {
        XCTAssertTrue(rules.isWin(board: board) == nil)
    }

    func testNotEmptyBoardButNotWin_isNotAWin() throws {
        board.place(intersection: Intersection(column: 1, row: 1), player: Player.White)
        XCTAssertTrue(rules.isWin(board: board) == nil)
    }

    func testFiveInARowInTheFirstRow_isAWin() throws {
        for col in 0..<5 {
            board.place(intersection: Intersection(column: col, row: 0), player: Player.White)
        }
        XCTAssertTrue(rules.isWin(board: board) == Player.White)
        print (PrintBoard.printAsFormattedString (board: board))
    }

    func testFourInARowInTheFirstRow_isNotAWin() throws {

        for col in 0..<4 {
            board.place(intersection: Intersection(column: col, row: 0), player: Player.White)

        }
        XCTAssertTrue(rules.isWin(board: board) == nil)
        print (PrintBoard.printAsFormattedString (board: board))
    }

    func testSixInARowInTheFirstRow_isAWin() throws {

        for col in 0..<6 {
            board.place(intersection: Intersection(column: col, row: 0), player: Player.White)
        }
        XCTAssertTrue(rules.isWin(board: board) == Player.White)
        print (PrintBoard.printAsFormattedString (board: board))
    }

    func testFiveInAnyRow_isAWin() throws {

        for row in 0..<board.getRows() {
            board = BoardFactory.makeBoard(columns: 19, rows: 19)
            for col in 0..<5 {
                board.place(intersection: Intersection(column: col, row: row), player: Player.White)
            }
            print (PrintBoard.printAsFormattedString (board: board))
        XCTAssertTrue(rules.isWin(board: board) == Player.White)
        }
    }
}
