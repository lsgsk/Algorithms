import Foundation

class Node: Equatable, Hashable {
	let id: String
	let name: String
	var links: [Link] = []
	
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
	let cost: Int
	let toNode: Node
}

func Dijkstra(startNode: Node, targetNode: Node) -> [Link] {
	var distancesToNode = [Node:Int]()
	var previousNodes = [Node:Node]()
	
	distancesToNode[startNode] = 0
	var candidateNodes = [startNode]
	while let currentNode = candidateNodes.popLast() {
		var candidateLinks = currentNode.links.sorted(by: { (l1, l2) -> Bool in l1.cost > l2.cost })
		while let last = candidateLinks.popLast() {
			let lastDistance = distancesToNode[currentNode] ?? 0
			if distancesToNode[last.toNode] ?? Int.max > lastDistance + last.cost {
				distancesToNode[last.toNode] = lastDistance + last.cost
				previousNodes[last.toNode] = currentNode
			}
			else {
				distancesToNode[last.toNode] = distancesToNode[last.toNode] ?? Int.max
			}
		}
		candidateNodes.append(contentsOf: currentNode.links.map { $0.toNode }.sorted(by: { (n1, n2) -> Bool in distancesToNode[n1]! > distancesToNode[n2]! }))
	}
	
	var way =  [Link]()
	var pointer = targetNode
	while pointer != startNode, let previousNode = previousNodes[pointer], let linkToPointer = previousNode.links.first(where: { $0.toNode == pointer }) {
		way.append(linkToPointer)
		pointer = previousNode
	}
	way.reverse()
	print("\(startNode.name)\(way.reduce("", { (r, v) -> String in "\(r)-\(v.cost)-\(v.toNode.name)" }))")
	return way
}


let a = Node(name: "A")
let b = Node(name: "B")
let c = Node(name: "C")
let d = Node(name: "D")
let e = Node(name: "E")
let f = Node(name: "F")
let g = Node(name: "G")
let h = Node(name: "H")

a.links.append(Link(cost: 9, toNode: b))
a.links.append(Link(cost: 10, toNode: d))
a.links.append(Link(cost: 15, toNode: e))
b.links.append(Link(cost: 10, toNode: c))
c.links.append(Link(cost: 11, toNode: f))
d.links.append(Link(cost: 10, toNode: e))
d.links.append(Link(cost: 12, toNode: g))
e.links.append(Link(cost: 11, toNode: f))
g.links.append(Link(cost: 12, toNode: h))
h.links.append(Link(cost: 13, toNode: f))

_ = Dijkstra(startNode: a, targetNode: f)

