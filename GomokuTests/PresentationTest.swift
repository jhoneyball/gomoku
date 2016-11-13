
import XCTest
import UIKit

@testable import Gomoku

class PresentationTest: XCTestCase {
    
    func testCoOrdsCorrectFor3x3() {
        let boardPresenter = BoardPresenter(board: Board(columns: 3, rows: 3), frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        var linesToDraw = boardPresenter.calculateGoBoardLines ()
       
        // Set up points for lines
        let cGPoint00 = CGPoint(x: CGFloat(25.0), y: CGFloat(25.0))
        let cGPoint01 = CGPoint(x: CGFloat(25.0), y: CGFloat(50.0))
        let cGPoint02 = CGPoint(x: CGFloat(25.0), y: CGFloat(75.0))
        let cGPoint10 = CGPoint(x: CGFloat(50.0), y: CGFloat(25.0))
        let cGPoint12 = CGPoint(x: CGFloat(50.0), y: CGFloat(75.0))
        let cGPoint20 = CGPoint(x: CGFloat(75.0), y: CGFloat(25.0))
        let cGPoint21 = CGPoint(x: CGFloat(75.0), y: CGFloat(50.0))
        let cGPoint22 = CGPoint(x: CGFloat(75.0), y: CGFloat(75.0))
        
        // Set up lines
        let line00 = TwoPoints (start: cGPoint00, finish: cGPoint02)
        let line01 = TwoPoints (start: cGPoint10, finish: cGPoint12)
        let line02 = TwoPoints (start: cGPoint20, finish: cGPoint22)
        let line03 = TwoPoints (start: cGPoint00, finish: cGPoint20)
        let line04 = TwoPoints (start: cGPoint01, finish: cGPoint21)
        let line05 = TwoPoints (start: cGPoint02, finish: cGPoint22)
        

        XCTAssertEqual (line00.start, linesToDraw[0].start)
        XCTAssertEqual (line00.finish, linesToDraw[0].finish)

        XCTAssertEqual (line01.start, linesToDraw[1].start)
        XCTAssertEqual (line01.finish, linesToDraw[1].finish)

        XCTAssertEqual (line02.start, linesToDraw[2].start)
        XCTAssertEqual (line02.finish, linesToDraw[2].finish)

        XCTAssertEqual (line03.start, linesToDraw[3].start)
        XCTAssertEqual (line03.finish, linesToDraw[3].finish)

        XCTAssertEqual (line04.start, linesToDraw[4].start)
        XCTAssertEqual (line04.finish, linesToDraw[4].finish)

        XCTAssertEqual (line05.start, linesToDraw[5].start)
        XCTAssertEqual (line05.finish, linesToDraw[5].finish)

    }

    func testGetRadiusForDimensionsFor() {
        let boardPresenter = BoardPresenter(board: Board(columns: 4, rows: 4), frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        
        let radius = boardPresenter.getRadiusForDimensions()
        
        XCTAssertEqual(8, radius)
        
    }
    
    func testGetCGPointForCoOrds () {
        let testPoint = getCGPointForCoOrds(col: 0, row: 0, columns: 3, rows: 3, width: 100.0, height: 100.0)

        let cGPoint = CGPoint(x: CGFloat(25.0), y: CGFloat(25.0))
        
        XCTAssertEqual(cGPoint, testPoint)
        
    }
    
    
    func testGetCoOrdsForCGPont01() {
        
        let cGPoint = CGPoint(x: CGFloat(25.0), y: CGFloat(50.0))
        
        let locationUT = getCoOrdsForCGPont(cGPoint: cGPoint, width: 100.0, height: 100.0, columns: 3, rows: 3)
        let location01 = Intersection(column: 0, row: 1)
        XCTAssertEqual(location01.column, locationUT.column)
        XCTAssertEqual(location01.row, locationUT.row)
    }

    func testGetCoOrdsForCGPont11TopLeft() {
        
        let cGPoint = CGPoint(x: CGFloat(38.0), y: CGFloat(38.0))
        
        let locationUT = getCoOrdsForCGPont(cGPoint: cGPoint, width: 100.0, height: 100.0, columns: 3, rows: 3)
        let location01 = Intersection(column: 1, row: 1)
        XCTAssertEqual(location01.column, locationUT.column)
        XCTAssertEqual(location01.row, locationUT.row)
    }

    func testGetCoOrdsForCGPont11BottomRight() {
        
        let cGPoint = CGPoint(x: CGFloat(62.0), y: CGFloat(62.0))
        
        let locationUT = getCoOrdsForCGPont(cGPoint: cGPoint, width: 100.0, height: 100.0, columns: 3, rows: 3)
        let location01 = Intersection(column: 1, row: 1)
        XCTAssertEqual(location01.column, locationUT.column)
        XCTAssertEqual(location01.row, locationUT.row)
    }
    
}
