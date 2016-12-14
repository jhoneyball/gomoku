struct Win {
    var state: Bool
    var player: Player?
}

protocol GameGomoku {
    func takeTurn(intersection: Intersection)
    func other(player: Player) -> Player
    func whosTurn() -> Player
    var win: Win {get}
}

class GameFactory {
    static func makeGomokuGame (board: Board) -> GameGomoku {
        return GameGomokuImplementation(board: board)
    }
}

private class GameGomokuImplementation: GameGomoku {
    let board: Board
    private var player = Player.White
    var rules = GomokuRules()
    var win = Win(state: false, player: nil)

    init (board: Board) {
        self.board = board
    }

    func takeTurn(intersection: Intersection) {
        if win.state == false {
            if board.get(intersection: intersection) == Player.Empty {
                board.place(intersection: intersection, player: player)
                if rules.checkIsWin(board: board as! BoardState, intersection: intersection, player: player) {
                    win = Win(state: true, player: player)
                }
                player = other(player: player)
                print(PrintBoard.printAsFormattedString(board: board))
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
