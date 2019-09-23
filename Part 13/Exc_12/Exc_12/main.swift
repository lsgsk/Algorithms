import Foundation

class Node: Equatable, Hashable {
	let id: String
	let name: String
	var links: [Link] = []
	var distance: Int = Int.max
	
	init(name: String) {
		self.id = UUID().uuidString
		self.name = name
		self.links = []
	}
	static func == (lhs: Node, rhs: Node) -> Bool {
		return lhs.id == rhs.id
	}
	
	func hash(into hasher: inout Hasher) {
		id.hash(into: &hasher)
	}
}

struct Link {
	let fromNode: Node
	let cost: Int
	let toNode: Node
}

func Dijkstra(startNode: Node) -> [Node:Int] {
	var distancesToNodes = [startNode:0]
	startNode.distance = 0
	var candidateNodes = [startNode]
	while let currentNode = candidateNodes.popLast() {
		var candidateLinks = currentNode.links.sorted(by: { (l1, l2) -> Bool in l1.cost > l2.cost })
		while let last = candidateLinks.popLast() {
			last.toNode.distance = min(last.toNode.distance, last.fromNode.distance + last.cost)
			distancesToNodes[last.toNode] = last.toNode.distance
		}
		candidateNodes.append(contentsOf: currentNode.links.map { $0.toNode }.sorted(by: { (n1, n2) -> Bool in n1.distance > n2.distance }))
	}
	return distancesToNodes
}

let a = Node(name: "A")
let b = Node(name: "B")
let c = Node(name: "C")
let d = Node(name: "D")
let e = Node(name: "E")
let f = Node(name: "F")
let g = Node(name: "G")
let h = Node(name: "H")
let i = Node(name: "I")

a.links.append(Link(fromNode: a, cost: 9, toNode: b))
a.links.append(Link(fromNode: a,cost: 10, toNode: d))
a.links.append(Link(fromNode: a,cost: 15, toNode: e))
b.links.append(Link(fromNode: b,cost: 10, toNode: c))
c.links.append(Link(fromNode: c,cost: 11, toNode: f))
d.links.append(Link(fromNode: d,cost: 10, toNode: e))
d.links.append(Link(fromNode: d,cost: 12, toNode: g))
e.links.append(Link(fromNode: e,cost: 11, toNode: f))
g.links.append(Link(fromNode: g,cost: 12, toNode: h))
h.links.append(Link(fromNode: h,cost: 13, toNode: f))
i.links.append(Link(fromNode: i,cost: 3, toNode: d))

print(Dijkstra(startNode: a).map { "\($0.key.name) \($0.value)" } )

