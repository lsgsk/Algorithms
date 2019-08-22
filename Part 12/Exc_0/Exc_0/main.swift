import Foundation

enum BoardValue {
	case none
	case noughts
	case crosses
}

class Board: CustomStringConvertible {
	private let positions = [BoardValue](repeating: .none, count: 9)
	
	var description: String {
		var str = ""
		var newLine = 0
		for element in positions {
			switch element {
			case .none:
				str += "_"
			case .noughts:
				str += "0"
			case .crosses:
				str += "X"
			}
			newLine += 1
			if newLine % 3 == 0 {
				str += "\n"
			}
		}
		if str.last == "\n" {
			str.remove(at: str.index(before: str.endIndex))
		}
		return str
	}
}
class Move { }
enum Value {
	case unknown
	case infinity
	case draw
	case loss
	case win
}
class Player { }

func minimax(board_position: Board, best_move: Move, best_value: inout Value, player1: Player, player2: Player, depth: Int, max_depth: Int) {
	if depth > max_depth {
		best_value = .unknown
		return
	}
	let lowest_value = Value.infinity
	var lowest_move: Move?
	
}


func gameResult(board_position: Board) {
	
}

print("Hello, World!")
let qwe = Board()
print(qwe)

