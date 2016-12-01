


protocol Board {
    init (columns: Int, rows: Int)
    func getColumns() -> Int
    func getRows() -> Int
    func stonesPlaced() -> Int
    func place(intersection: Intersection, player: Player)
    func get(intersection: Intersection) -> Player
}

protocol BoardState {
    func get(intersection: Intersection) -> Player
    func getColumns() -> Int
    func getRows() -> Int
    func right(of: Intersection) -> Intersection?
    func left(of: Intersection) -> Intersection?
    func above(of: Intersection) -> Intersection?
    func below(of: Intersection) -> Intersection?
    func rightAbove(of: Intersection) -> Intersection?
    func rightBelow(of: Intersection) -> Intersection?
    func leftAbove(of: Intersection) -> Intersection?
    func leftBelow(of: Intersection) -> Intersection?
}

enum Player {
    case White
    case Black
    case Empty
}

typealias Intersection = (column: Int, row: Int)


class SpaceOccupied : Error {
    
}
class BadLocation : Error {
    
}

class BoardFactory {
    static func makeBoard(columns: Int, rows: Int) -> Board {
        return BoardData(columns: columns, rows: rows)
    }
}

private class BoardData: Board, BoardState {
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
    
    func right(of: Intersection) -> Intersection? {
        if of.column < (getColumns() - 1) {
            return Intersection(column: of.column + 1, row: of.row)
        } else {
            return nil
        }
    }
    
    func left(of: Intersection) -> Intersection? {
        if of.column > 0 {
            return Intersection(column: of.column - 1, row: of.row)
        } else {
            return nil
        }
    }
    
    func above(of: Intersection) -> Intersection? {
        if of.row > 0 {
            return Intersection(column: of.column, row: of.row - 1)
        } else {
            return nil
        }
    }
    
    func below(of: Intersection) -> Intersection? {
        if of.row < (getRows() - 1) {
            return Intersection(column: of.column, row: of.row + 1)
        } else {
            return nil
        }
    }

    func rightAbove(of: Intersection) -> Intersection? {
        if of.column < (getColumns() - 1) && of.row > 0 {
            return Intersection(column: of.column + 1, row: of.row - 1)
        } else {
            return nil
        }
    }
    
    func rightBelow(of: Intersection) -> Intersection? {
        if of.column < (getColumns() - 1) && of.row < (getRows() - 1) {
            return Intersection(column: of.column + 1, row: of.row + 1)
        } else {
            return nil
        }
    }
    
    func leftAbove(of: Intersection) -> Intersection? {
        if of.column > 0 && of.row > 0 {
            return Intersection(column: of.column - 1, row: of.row - 1)
        } else {
            return nil
        }
    }
    
    func leftBelow(of: Intersection) -> Intersection? {
        if of.column > 0 && of.row < (getRows() - 1) {
            return Intersection(column: of.column - 1, row: of.row + 1)
        } else {
            return nil
        }
    }

    func place(intersection: Intersection, player: Player) {
        let loc: Int
        var error: Error?
        (loc, error) = makelocation(intersection: intersection)
        if error == nil {
            if placedStones[loc] == nil {
                placedStones[loc] = player
            }
        }
    }
    
    private func makelocation(intersection: Intersection) -> (Int, Error?)  {
        let row = intersection.row
        let column = intersection.column
        var error: Error?
        
        if (row < 0 || row >= HEIGHT || column < 0 || column >= WIDTH) {
            error = BadLocation()
        }
        return (row * WIDTH + column, error)
    }
    
    func get (intersection: Intersection) -> Player {
        let (loc, error) = makelocation(intersection: intersection)
        if (error == nil) {
            if let stone = placedStones[loc] {
                return stone
            }
        }
        return Player.Empty
    }

}
