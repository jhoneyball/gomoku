
import XCTest

@testable import Gomoku

class BoardTest: XCTestCase {
    var board: Board!

    
    override func setUp() {
        super.setUp()
        board = BoardData(columns: 19, rows: 19)
    }
    
    
    func testCanAddStonesInBounds() {
        board.place(intersection: Intersection(column: 1, row: 1), player: Player.White)
        XCTAssertEqual(1, board.stonesPlaced())
        var placedStone = board.get(intersection: Intersection(column: 1, row: 1))
        XCTAssertEqual(Player.White, placedStone)

        
        board.place(intersection: Intersection(column: board.getColumns()-1, row: board.getRows()-1), player: Player.Black)
        XCTAssertEqual(2, board.stonesPlaced())
        placedStone = board.get(intersection: Intersection(column: board.getColumns()-1, row: board.getRows()-1))
        XCTAssertEqual(Player.Black, placedStone)
    }

    
    func testCanCreateBoard () {
        let stones = board.stonesPlaced()
        XCTAssertEqual(0, stones)
    }

    func testKnowsAboutEmptyIntersections() {
        XCTAssertEqual(Player.Empty, board.get(intersection: Intersection(column: 0, row: 1)))
        board.place(intersection: Intersection(column: 0, row: 1), player: Player.White)
        XCTAssertEqual(Player.White, board.get(intersection: Intersection(column: 0, row: 1)))
    }
    
    func testCannotAddtoOccupiedIntersection() {
        XCTAssertEqual(Player.Empty, board.get(intersection: Intersection(column: 0, row: 0)))

        board.place(intersection: Intersection(column: 0, row: 0), player: Player.White)
        XCTAssertEqual(Player.White, board.get(intersection: Intersection(column: 0, row: 0)))

        board.place(intersection: Intersection(column: 0, row: 0), player: Player.Black)
        XCTAssertEqual(Player.White, board.get(intersection: Intersection(column: 0, row: 0)))

        board.place(intersection: Intersection(column: 0, row: 0), player: Player.White)
        XCTAssertEqual(Player.White, board.get(intersection: Intersection(column: 0, row: 0)))
        
        XCTAssertEqual(1, board.stonesPlaced())
        
    }
    
    func testCannotPlaceStoneOutsideBounds() {
        var intersection = Intersection(column: board.getColumns(), row: board.getRows())
        board.place(intersection: intersection, player: Player.Black)
        XCTAssertEqual(Player.Empty, board.get(intersection: intersection))
        XCTAssertEqual(0, board.stonesPlaced())
        
        intersection = Intersection(column: board.getColumns(), row: board.getRows()-1)
        board.place(intersection: intersection, player: Player.Black)
        XCTAssertEqual(Player.Empty, board.get(intersection: intersection))
        XCTAssertEqual(0, board.stonesPlaced())
        
        intersection = Intersection(column: board.getColumns()-1, row: board.getRows())
        board.place(intersection: intersection, player: Player.Black)
        XCTAssertEqual(Player.Empty, board.get(intersection: intersection))
        XCTAssertEqual(0, board.stonesPlaced())
        
        intersection = Intersection(column: -1, row: 0)
        board.place(intersection: intersection, player: Player.Black)
        XCTAssertEqual(Player.Empty, board.get(intersection: intersection))
        XCTAssertEqual(0, board.stonesPlaced())

        intersection = Intersection(column: 0, row: -1)
        board.place(intersection: intersection, player: Player.Black)
        XCTAssertEqual(Player.Empty, board.get(intersection: intersection))
        XCTAssertEqual(0, board.stonesPlaced())
    }
    
    
    func testIntersectionOnRight() {
        let miniBoard = BoardData(columns: 4, rows: 4)
        let intersection21 = Intersection(column: 2, row: 1)
        let intersection31 = Intersection(column: 3, row: 1)
 
        if let intersectionOnTheRightOf21 = miniBoard.right(of: intersection21) {
            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionOnTheRightOf21))
            miniBoard.place(intersection: intersection31, player: Player.White)
            XCTAssertEqual(Player.White, miniBoard.get(intersection: intersectionOnTheRightOf21))
        } else {
            XCTFail()
        }
    }
    
    func testIntersectionOnBelow() {
        let miniBoard = BoardData(columns: 4, rows: 4)
        let intersection31 = Intersection(column: 3, row: 1)
        let intersection32 = Intersection(column: 3, row: 2)
        
        if let intersectionBelowOf31 = miniBoard.below(of: intersection31) {
            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionBelowOf31))
            miniBoard.place(intersection: intersection32, player: Player.Black)
            XCTAssertEqual(Player.Black, miniBoard.get(intersection: intersectionBelowOf31))
        } else {
            XCTFail()
        }
    }
    
    func testIntersectionOnLeft() {
        let miniBoard = BoardData(columns: 4, rows: 4)
        let intersection23 = Intersection(column: 2, row: 3)
        let intersection13 = Intersection(column: 1, row: 3)
        
        if let intersectionOnTheLeftOf23 = miniBoard.left(of: intersection23) {
            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionOnTheLeftOf23))
            miniBoard.place(intersection: intersection13, player: Player.White)
            XCTAssertEqual(Player.White, miniBoard.get(intersection: intersectionOnTheLeftOf23))
        } else {
            XCTFail()
        }
    }
    
    func testIntersectionOnAbove() {
        let miniBoard = BoardData(columns: 4, rows: 4)
        let intersection03 = Intersection(column: 0, row: 3)
        let intersection02 = Intersection(column: 0, row: 2)
        
        if let intersectionAbove03 = miniBoard.above(of: intersection03) {
            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionAbove03))
            miniBoard.place(intersection: intersection02, player: Player.Black)
            XCTAssertEqual(Player.Black, miniBoard.get(intersection: intersectionAbove03))
        } else {
            XCTFail()
        }
    }

    func testNoIntersectionOnRight() {
        let miniBoard = BoardData(columns: 3, rows: 3)
        XCTAssertNil(miniBoard.right(of: Intersection(column: 2, row: 0)))
        }

    func testNoIntersectionOnLeft() {
        let miniBoard = BoardData(columns: 3, rows: 3)
        XCTAssertNil(miniBoard.left(of: Intersection(column: 0, row: 2)))
    }

    func testNoIntersectionOnAbove() {
        let miniBoard = BoardData(columns: 3, rows: 3)
        XCTAssertNil(miniBoard.above(of: Intersection(column: 1, row: 0)))
    }

    func testNoIntersectionOnBelow() {
        let miniBoard = BoardData(columns: 3, rows: 3)
        XCTAssertNil(miniBoard.below(of: Intersection(column: 1, row: 2)))
    }



    func testIntersectionOnRightAbove() {
        let miniBoard = BoardData(columns: 5, rows: 5)
        let intersection04 = Intersection(column: 0, row: 4)
        let intersection13 = Intersection(column: 1, row: 3)
        
        if let intersectionOnTheRightAboveOf04 = miniBoard.rightAbove(of: intersection04) {
            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionOnTheRightAboveOf04))
            miniBoard.place(intersection: intersection13, player: Player.White)
            XCTAssertEqual(Player.White, miniBoard.get(intersection: intersectionOnTheRightAboveOf04))
        } else {
            XCTFail()
        }
    }
    
    func testIntersectionOnRightBelow() {
        let miniBoard = BoardData(columns: 5, rows: 5)
        let intersection03 = Intersection(column: 0, row: 3)
        let intersection14 = Intersection(column: 1, row: 4)
        
        if let intersectionOnTheRightBelowOf03 = miniBoard.rightBelow(of: intersection03) {
            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionOnTheRightBelowOf03))
            miniBoard.place(intersection: intersection14, player: Player.Black)
            XCTAssertEqual(Player.Black, miniBoard.get(intersection: intersectionOnTheRightBelowOf03))
        } else {
            XCTFail()
        }
    }
    

    func testIntersectionOnLeftAbove() {
        let miniBoard = BoardData(columns: 5, rows: 5)
        let intersection41 = Intersection(column: 4, row: 1)
        let intersection30 = Intersection(column: 3, row: 0)
        
        if let intersectionOnTheLeftAboveOf41 = miniBoard.leftAbove(of: intersection41) {
            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionOnTheLeftAboveOf41))
            miniBoard.place(intersection: intersection30, player: Player.White)
            XCTAssertEqual(Player.White, miniBoard.get(intersection: intersectionOnTheLeftAboveOf41))
        } else {
            XCTFail()
        }
    }
    
    func testIntersectionOnLeftBelow() {
        let miniBoard = BoardData(columns: 5, rows: 5)
        let intersection40 = Intersection(column: 4, row: 0)
        let intersection31 = Intersection(column: 3, row: 1)
        
        if let intersectionLeftBelow40 = miniBoard.leftBelow(of: intersection40) {
            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionLeftBelow40))
            miniBoard.place(intersection: intersection31, player: Player.Black)
            XCTAssertEqual(Player.Black, miniBoard.get(intersection: intersectionLeftBelow40))
        } else {
            XCTFail()
        }
    }

    func testNoIntersectionOnRightAbove() {
        let miniBoard = BoardData(columns: 3, rows: 3)
        XCTAssertNil(miniBoard.rightAbove(of: Intersection(column: 1, row: 0)))
        XCTAssertNil(miniBoard.rightAbove(of: Intersection(column: 2, row: 0)))
        XCTAssertNil(miniBoard.rightAbove(of: Intersection(column: 2, row: 1)))
    }
    
    func testNoIntersectionOnRightBelow() {
        let miniBoard = BoardData(columns: 3, rows: 3)
        XCTAssertNil(miniBoard.rightBelow(of: Intersection(column: 2, row: 1)))
        XCTAssertNil(miniBoard.rightBelow(of: Intersection(column: 2, row: 2)))
        XCTAssertNil(miniBoard.rightBelow(of: Intersection(column: 1, row: 2)))
    }
    
    func testNoIntersectionOnLeftAbove() {
        let miniBoard = BoardData(columns: 3, rows: 3)
        XCTAssertNil(miniBoard.leftAbove(of: Intersection(column: 0, row: 1)))
        XCTAssertNil(miniBoard.leftAbove(of: Intersection(column: 0, row: 0)))
        XCTAssertNil(miniBoard.leftAbove(of: Intersection(column: 1, row: 0)))
    }
    
    func testNoIntersectionOnLeftBelow() {
        let miniBoard = BoardData(columns: 3, rows: 3)
        XCTAssertNil(miniBoard.leftBelow(of: Intersection(column: 1, row: 2)))
        XCTAssertNil(miniBoard.leftBelow(of: Intersection(column: 0, row: 2)))
        XCTAssertNil(miniBoard.leftBelow(of: Intersection(column: 0, row: 1)))
    }








}
