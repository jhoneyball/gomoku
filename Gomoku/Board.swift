enum Player {
    case White
    case Black
    case Empty
}

typealias Intersection = (row: Int, column: Int)

class SpaceOccupied : Error {
    
}
class BadLocation : Error {
    
}
class Board {
    private let WIDTH: Int
    private let HEIGHT: Int
    
    private var placedStones = [Int: Player]()
    
    init (columns: Int, rows: Int) {
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
