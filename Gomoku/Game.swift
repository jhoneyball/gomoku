
struct Win {
    var state: Bool
    var player: Player?
}

class Game {
    let board: Board
    private var player = Player.White
    var rules: GomokuRules
    var win = Win(state: false, player: nil)

    init (board: Board, rules: GomokuRules) {
        self.board = board
        self.rules = rules
    }
    
    func takeTurn(intersection: Intersection) {
        if win.state == false {
            if board.get(intersection: intersection) == Player.Empty {
                board.place(intersection: intersection, player: player)
                if rules.checkIsWin(board: board as! BoardState, intersection: intersection, player: player) {
                    win = Win(state: true, player: player)
                }
                player = other(player: player)
            }
        }
    }
    
    func other(player: Player) -> Player {
        return player == Player.White ? Player.Black : Player.White
    }
    
    
    func whosTurn() -> Player {
        return player
    }
}
