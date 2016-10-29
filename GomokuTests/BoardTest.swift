
import XCTest

@testable import Gomoku

class BoardTest: XCTestCase {
    var board: Board!

    
    override func setUp() {
        super.setUp()
        board = Board()
    }
    
    
    func testCanAddStonesInBounds() throws {
        try board.place(intersection: Intersection(1,1), player: Player.White)
        XCTAssertEqual(1, board.stonesPlaced())
        var placedStone = try board.get(intersection: Intersection(1, 1))
        XCTAssertEqual(Player.White, placedStone)

        
        try board.place(intersection: Intersection(board.getWidth()-1, board.getHeight()-1), player: Player.Black)
        XCTAssertEqual(2, board.stonesPlaced())
        placedStone = try board.get(intersection: Intersection(board.getWidth()-1, board.getHeight()-1))
        XCTAssertEqual(Player.Black, placedStone)

    
    }
    

    
    func testCanCreateBoard () {
        let stones = board.stonesPlaced()
        XCTAssertEqual(0, stones)
    }

    func testKnowsAboutEmptyIntersections() throws {
        XCTAssertEqual(Player.Empty, try board.get(intersection: Intersection(0, 1)))
        try board.place(intersection: Intersection(0,1), player: Player.White)
        XCTAssertEqual(Player.White, try board.get(intersection: Intersection(0, 1)))
    }
    
    func testCannotAddtoOccupiedIntersection() throws {
        try board.place(intersection: Intersection(0, 0), player: Player.White)
    
        XCTAssertThrowsError(try board.place(intersection: Intersection(0,0), player: Player.Black))
        XCTAssertThrowsError(try board.place(intersection: Intersection(0,0), player: Player.White))
    }
    
    func testCannotPlaceStoneOutsideBounds() throws {
        XCTAssertThrowsError(try board.place(intersection: Intersection(board.getWidth(), board.getHeight()), player: Player.Black))
        XCTAssertThrowsError(try board.place(intersection: Intersection(board.getWidth(), board.getHeight()-1), player: Player.Black))
        XCTAssertThrowsError(try board.place(intersection: Intersection(board.getWidth()-1, board.getHeight()), player: Player.Black))
        XCTAssertThrowsError(try board.place(intersection: Intersection(-1, 0), player: Player.Black))
        XCTAssertThrowsError(try board.place(intersection: Intersection(0, -1), player: Player.Black))
        XCTAssertEqual(0, board.stonesPlaced())

        
    }
    
}
