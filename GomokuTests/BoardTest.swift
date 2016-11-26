
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
    
    func testCannotPlaceStoneOutsideBounds() throws {
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
}
