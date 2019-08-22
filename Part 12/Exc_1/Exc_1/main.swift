import Foundation
print("Hello, World!")

var noughtsCount = 0
var crossesCount = 0
var drawCount = 0

func calculateGamesCount(board: Board, player1: Player, player2: Player){
	let availableMoves = board.getAvailableMoves()
	for moveIndex in availableMoves {
		player1.addMove(Move(position: moveIndex))
		switch board.calculateGameResult() {
		case .unknown:
			calculateGamesCount(board: board, player1: player2, player2: player1)
		case .win(let type):
			type == .crosses ? (crossesCount += 1) : (noughtsCount += 1)
		case .draw:
			drawCount += 1
		}
		player1.removeMove(Move(position: moveIndex))
	}
}

let crossesPlayer = Player(type: .crosses)
let noughtsPlayer = Player(type: .noughts)
let board = Board(player1: crossesPlayer, player2: noughtsPlayer)
calculateGamesCount(board: board, player1: crossesPlayer, player2: noughtsPlayer)
print("X: \(crossesCount), O: \(noughtsCount), #: \(drawCount) ")
