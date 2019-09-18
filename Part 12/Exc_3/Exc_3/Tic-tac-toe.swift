import Foundation

class GameBoard {
	let player1: Player
	let player2: Player
	init(player1: Player, player2: Player) {
		self.player1 = player1
		self.player2 = player2
	}
	
	func getAvailableMoves() -> [Int] {
		let positions = genarateBoardState()
		var array = [Int]()
		for (index, item) in positions.enumerated() {
			if item == nil {
				array.append(index)
			}
		}
		return array
	}
	
	func calculateGameResult() -> GameResult {
		let positions = genarateBoardState()
		return checkGameResult(positions)
	}
	
	private func genarateBoardState() -> [PlayerType?] {
		var positions = [PlayerType?](repeating: nil, count: Constants.boardSideCount * Constants.boardSideCount)
		setExecutedPlayerMoves(board: &positions, player: player1)
		setExecutedPlayerMoves(board: &positions, player: player2)
		return positions
	}
	
	private func setExecutedPlayerMoves(board: inout [PlayerType?], player: Player) {
		for (index, item) in player.moves.enumerated() {
			if item {
				board[index] = player.type
			}
		}
	}
	private func checkGameResult(_ board: [PlayerType?]) -> GameResult {
		if board[0] != nil &&  board[0] == board[1] && board[1] == board[2] {
			return GameResult.win(board[0]!)
		}
		if board[3] != nil &&  board[3] == board[4] && board[4] == board[5] {
			return GameResult.win(board[3]!)
		}
		if board[6] != nil &&  board[6] == board[7] && board[7] == board[8] {
			return GameResult.win(board[6]!)
		}
		
		if board[0] != nil &&  board[0] == board[3] && board[3] == board[6] {
			return GameResult.win(board[0]!)
		}
		if board[1] != nil &&  board[1] == board[4] && board[4] == board[7] {
			return GameResult.win(board[1]!)
		}
		if board[2] != nil &&  board[2] == board[5] && board[5] == board[8] {
			return GameResult.win(board[2]!)
		}
		
		if board[0] != nil &&  board[0] == board[4] && board[4] == board[8] {
			return GameResult.win(board[0]!)
		}
		if board[2] != nil &&  board[2] == board[4] && board[4] == board[6] {
			return GameResult.win(board[2]!)
		}
		
		if !board.contains(nil) {
			return .draw
		}
		
		return .unknown
	}
	
	func printBoard() -> String {
		let positions = genarateBoardState()
		var str = ""
		var newLine = 0
		for element in positions {
			switch element {
			case .noughts?:
				str += "0 "
			case .crosses?:
				str += "X "
			default:
				str += "_ "
			}
			newLine += 1
			if newLine % 3 == 0 {
				str += "\n"
			}
		}
		return str
	}
}
