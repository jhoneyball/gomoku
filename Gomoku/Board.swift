


protocol BoardProtocol {
    init (columns: Int, rows: Int)
    func getColumns() -> Int
    func getRows() -> Int
    func stonesPlaced() -> Int
    func place(intersection: Intersection, player: Player) throws
    func get(intersection: Intersection) throws -> Player
}


enum Player {
    case White
    case Black
    case Empty
}

//class Intersection {
//    let column: Int
//    let row: Int
//
//    init(column: Int, row: Int){
//        self.column = column
//        self.row = row
//    }
//}

typealias Intersection = (column: Int, row: Int)

class SpaceOccupied : Error {
    
}
class BadLocation : Error {
    
}
class Board: BoardProtocol {
    private let WIDTH: Int
    private let HEIGHT: Int
    
    private var placedStones = [Int: Player]()
    
    required init (columns: Int, rows: Int) {
        WIDTH = columns
        HEIGHT = rows
    }
    
    
    func getColumns() -> Int {
        return WIDTH
    }
    
    func getRows() -> Int {
        return HEIGHT
    }
    
    
    func stonesPlaced() -> Int {
        return placedStones.count
    }
    
    func place(intersection: Intersection, player: Player) throws {
        let loc = try makelocation(intersection: intersection)
        if (placedStones[loc] != nil) {
            throw SpaceOccupied()
        }
        placedStones [loc] = player
    }
    
    private func makelocation(intersection: Intersection) throws -> Int  {
        let row = intersection.row
        let column = intersection.column

        if (row < 0 || row >= HEIGHT || column < 0 || column >= WIDTH) {
            throw BadLocation()
        }
        return row * WIDTH + column
    }
    
    func get (intersection: Intersection) throws -> Player {
        let loc = try makelocation(intersection: intersection)
        if let stone = placedStones[loc] {
            return stone
        }
        else {
            return Player.Empty
        }

    }
    
}
