import Foundation

class Node: Equatable {
	let id: String
	let name: String
	var links: [Link]
	var color: Color = .none
	init(name: String) {
		self.id = UUID().uuidString
		self.name = name
		self.links = []
	}
	init(name: String, links: [Link]) {
		self.id = UUID().uuidString
		self.name = name
		self.links = links
	}
	static func == (lhs: Node, rhs: Node) -> Bool {
		return lhs.id == rhs.id
	}
}

enum Color {
	case none
	case red
	case blue
}

struct Link {
	let cost: Int
	let toNode: Node
}
