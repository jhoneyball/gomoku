
import XCTest

@testable import Gomoku

class BoardTest: XCTestCase {
    var board: Board!

    
    override func setUp() {
        super.setUp()
        board = Board(columns: 19, rows: 19)
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
        let miniBoard = Board(columns: 3, rows: 3)
        let intersection00 = Intersection(column: 0, row: 0)
        let intersection10 = Intersection(column: 1, row: 0)
 
        if let intersectionOnTheRightOf00 = miniBoard.right(of: intersection00) {
            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionOnTheRightOf00))
            miniBoard.place(intersection: intersection10, player: Player.White)
            XCTAssertEqual(Player.White, miniBoard.get(intersection: intersectionOnTheRightOf00))
        } else {
            XCTFail()
        }
    }
    
    func testIntersectionOnBelow() {
        let miniBoard = Board(columns: 3, rows: 3)
        let intersection00 = Intersection(column: 0, row: 0)
        let intersection01 = Intersection(column: 0, row: 1)
        
        if let intersectionBelowOf00 = miniBoard.below(of: intersection00) {
            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionBelowOf00))
            miniBoard.place(intersection: intersection01, player: Player.Black)
            XCTAssertEqual(Player.Black, miniBoard.get(intersection: intersectionBelowOf00))
        } else {
            XCTFail()
        }
    }
    
    func testIntersectionOnLeft() {
        let miniBoard = Board(columns: 3, rows: 3)
        let intersection22 = Intersection(column: 2, row: 2)
        let intersection12 = Intersection(column: 1, row: 2)
        
        if let intersectionOnTheLeftOf22 = miniBoard.left(of: intersection22) {
            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionOnTheLeftOf22))
            miniBoard.place(intersection: intersection12, player: Player.White)
            XCTAssertEqual(Player.White, miniBoard.get(intersection: intersectionOnTheLeftOf22))
        } else {
            XCTFail()
        }
    }
    
    func testIntersectionOnAbove() {
        let miniBoard = Board(columns: 3, rows: 3)
        let intersection22 = Intersection(column: 2, row: 2)
        let intersection21 = Intersection(column: 2, row: 1)
        
        if let intersectionAbove22 = miniBoard.above(of: intersection22) {
            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionAbove22))
            miniBoard.place(intersection: intersection21, player: Player.Black)
            XCTAssertEqual(Player.Black, miniBoard.get(intersection: intersectionAbove22))
        } else {
            XCTFail()
        }
    }

    func testNoIntersectionOnRight() {
        let miniBoard = Board(columns: 3, rows: 3)
        XCTAssertNil(miniBoard.right(of: Intersection(column: 2, row: 0)))
        }

    func testNoIntersectionOnLeft() {
        let miniBoard = Board(columns: 3, rows: 3)
        XCTAssertNil(miniBoard.left(of: Intersection(column: 0, row: 0)))
    }

    func testNoIntersectionOnAbove() {
        let miniBoard = Board(columns: 3, rows: 3)
        XCTAssertNil(miniBoard.above(of: Intersection(column: 2, row: 0)))
    }

    func testNoIntersectionOnBelow() {
        let miniBoard = Board(columns: 3, rows: 3)
        XCTAssertNil(miniBoard.below(of: Intersection(column: 2, row: 2)))
    }



    func testIntersectionOnRightAbove() {
        let miniBoard = Board(columns: 3, rows: 3)
        let intersection11 = Intersection(column: 1, row: 1)
        let intersection20 = Intersection(column: 2, row: 0)
        
        if let intersectionOnTheRightAboveOf11 = miniBoard.rightAbove(of: intersection11) {
            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionOnTheRightAboveOf11))
            miniBoard.place(intersection: intersection20, player: Player.White)
            XCTAssertEqual(Player.White, miniBoard.get(intersection: intersectionOnTheRightAboveOf11))
        } else {
            XCTFail()
        }
    }
    
    func testIntersectionOnRightBelow() {
        let miniBoard = Board(columns: 3, rows: 3)
        let intersection11 = Intersection(column: 1, row: 1)
        let intersection22 = Intersection(column: 2, row: 2)
        
        if let intersectionOnTheRightBelowOf11 = miniBoard.rightBelow(of: intersection11) {
            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionOnTheRightBelowOf11))
            miniBoard.place(intersection: intersection22, player: Player.Black)
            XCTAssertEqual(Player.Black, miniBoard.get(intersection: intersectionOnTheRightBelowOf11))
        } else {
            XCTFail()
        }
    }
    
//
//    func testIntersectionOnLeft() {
//        let miniBoard = Board(columns: 3, rows: 3)
//        let intersection22 = Intersection(column: 2, row: 2)
//        let intersection12 = Intersection(column: 1, row: 2)
//        
//        if let intersectionOnTheLeftOf22 = miniBoard.left(of: intersection22) {
//            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionOnTheLeftOf22))
//            miniBoard.place(intersection: intersection12, player: Player.White)
//            XCTAssertEqual(Player.White, miniBoard.get(intersection: intersectionOnTheLeftOf22))
//        } else {
//            XCTFail()
//        }
//    }
//    
//    func testIntersectionOnAbove() {
//        let miniBoard = Board(columns: 3, rows: 3)
//        let intersection22 = Intersection(column: 2, row: 2)
//        let intersection21 = Intersection(column: 2, row: 1)
//        
//        if let intersectionAbove22 = miniBoard.above(of: intersection22) {
//            XCTAssertEqual(Player.Empty, miniBoard.get(intersection: intersectionAbove22))
//            miniBoard.place(intersection: intersection21, player: Player.Black)
//            XCTAssertEqual(Player.Black, miniBoard.get(intersection: intersectionAbove22))
//        } else {
//            XCTFail()
//        }
//    }
//    
//    func testNoIntersectionOnRight() {
//        let miniBoard = Board(columns: 3, rows: 3)
//        XCTAssertNil(miniBoard.right(of: Intersection(column: 2, row: 0)))
//    }
//    
//    func testNoIntersectionOnLeft() {
//        let miniBoard = Board(columns: 3, rows: 3)
//        XCTAssertNil(miniBoard.left(of: Intersection(column: 0, row: 0)))
//    }
//    
//    func testNoIntersectionOnAbove() {
//        let miniBoard = Board(columns: 3, rows: 3)
//        XCTAssertNil(miniBoard.above(of: Intersection(column: 2, row: 0)))
//    }
//    
//    func testNoIntersectionOnBelow() {
//        let miniBoard = Board(columns: 3, rows: 3)
//        XCTAssertNil(miniBoard.below(of: Intersection(column: 2, row: 2)))
//    }
//
//






}
