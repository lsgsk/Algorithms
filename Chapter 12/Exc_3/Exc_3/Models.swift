import Foundation

struct Constants {
	static let boardSideCount = 3
}

enum HardLevel {
	case random
	case beginner
	case expert
}

enum PlayerType {
	case noughts
	case crosses
}

enum GameResult {
	case unknown
	case win(PlayerType)
	case draw
}

class Move: Equatable {
	let position: Int
	
	init(position: Int) {
		self.position = position
	}
	
	static func == (lhs: Move, rhs: Move) -> Bool {
		return lhs.position == rhs.position
	}
}

enum Value: Int {
	case win
	case draw
	case loss
	case unknown
	case infinity
}
