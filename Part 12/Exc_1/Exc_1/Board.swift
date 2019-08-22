import Foundation

let boardSideCount = 3

struct Move {
	let move: Int
}

enum PlayerType {
	case noughts
	case crosses
}

enum GameResult {
	case unknown
	case wine(PlayerType)
	case draw
}

class Player {
	let type: PlayerType
	private(set) var moves: [Bool]
	init(type: PlayerType) {
		self.type = type
		self.moves = [Bool](repeating: false, count: boardSideCount * boardSideCount)
	}
	
	func addMove(_ move: Move) {
		moves[move.move] = true
	}
	func removeMove(_ move: Move) {
		moves[move.move] = false
	}
}

class Board {
	
	private func genarateBoardState(player1: Player, player2: Player) -> [PlayerType?] {
		var positions = [PlayerType?](repeating: nil, count: boardSideCount * boardSideCount)
		setPlayerMoves(board: &positions, player: player1)
		setPlayerMoves(board: &positions, player: player2)
		return positions
	}
	
	private func setPlayerMoves(board: inout [PlayerType?], player: Player) {
		for (index, item) in player.moves.enumerated() {
			if item {
				board[index] = player.type
			}
		}
	}

	func getPossibleMoves(player1: Player, player2: Player) -> [Int] {
		let positions = genarateBoardState(player1: player1, player2: player2)
		var array = [Int]()
		for (index, item) in positions.enumerated() {
			if item == nil {
				array.append(index)
			}
		}
		return array
	}
	
	func calculateGameResult(player1: Player, player2: Player) -> GameResult {
		let positions = genarateBoardState(player1: player1, player2: player2)
		return checkGameResult(positions)
	}
	
	func checkGameResult(_ board: [PlayerType?]) -> GameResult {
		if board[0] != nil &&  board[0] == board[1] && board[1] == board[2] {
			return GameResult.wine(board[0]!)
		}
		if board[3] != nil &&  board[3] == board[4] && board[4] == board[5] {
			return GameResult.wine(board[3]!)
		}
		if board[6] != nil &&  board[6] == board[7] && board[7] == board[8] {
			return GameResult.wine(board[6]!)
		}
		
		if board[0] != nil &&  board[0] == board[3] && board[3] == board[6] {
			return GameResult.wine(board[0]!)
		}
		if board[1] != nil &&  board[1] == board[4] && board[4] == board[7] {
			return GameResult.wine(board[1]!)
		}
		if board[2] != nil &&  board[2] == board[5] && board[5] == board[8] {
			return GameResult.wine(board[2]!)
		}
		
		if board[0] != nil &&  board[0] == board[4] && board[4] == board[8] {
			return GameResult.wine(board[0]!)
		}
		if board[2] != nil &&  board[2] == board[4] && board[4] == board[6] {
			return GameResult.wine(board[2]!)
		}
		
		if !board.contains(nil) {
			return .draw
		}
		
		
		
		return .unknown
	}
	
	func toString(player1: Player, player2: Player) -> String {
		let positions = genarateBoardState(player1: player1, player2: player2)
		var str = ""
		var newLine = 0
		for element in positions {
			switch element {
			case .noughts?:
				str += "0"
			case .crosses?:
				str += "X"
			default:
				str += "_"
			}
			newLine += 1
			if newLine % 3 == 0 {
				str += "\n"
			}
		}
		return str
	}
}
