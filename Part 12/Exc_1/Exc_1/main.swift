import Foundation
print("Hello, World!")

var noughtsCount = 0
var crossesCount = 0
var drawCount = 0

func qwe(board: Board, player1: Player, player2: Player){
	let player1AllowedMoves = board.getPossibleMoves(player1: player1, player2: player2)
	for moveIndex in player1AllowedMoves {
		player1.addMove(Move(move: moveIndex))
		let result = board.calculateGameResult(player1: player1, player2: player2)
		switch result {
		case .unknown:
			qwe(board: board, player1: player2, player2: player1)
		case .wine(let type):
			type == .crosses ? (crossesCount += 1) : (noughtsCount += 1)
		case .draw:
			drawCount += 1
		}
		player1.removeMove(Move(move: moveIndex))
	}
}


let player1 = Player(type: .crosses)
let player2 = Player(type: .noughts)
let board = Board()
qwe(board: board, player1: player1, player2: player2)
print("X: \(crossesCount), O: \(noughtsCount), #: \(drawCount) ")
