import Foundation

func minPathWithPoints(startNode: Node, targetNode: Node) -> [Node] {
	var distancesToNodes = [startNode:0]
	startNode.distance = 0
	var candidateNodesToAdd = startNode.links.sorted(by: { (l1, l2) -> Bool in l1.cost > l2.cost })
	while let last = candidateNodesToAdd.popLast() {
		last.toNode.distance = last.fromNode.distance + last.cost
		distancesToNodes[last.toNode] = last.toNode.distance
		candidateNodesToAdd = distancesToNodes.flatMap { $0.key.links }.filter( { !distancesToNodes.keys.contains($0.toNode) } ).sorted(by: { (l1, l2) -> Bool in l1.cost + l1.fromNode.distance > l2.cost + l2.fromNode.distance })
	}
	var path = [targetNode]
	var pointer = targetNode
	while pointer != startNode {
		let previousNode = distancesToNodes.flatMap { $0.key.links }.first(where: { $0.fromNode.distance + $0.cost == pointer.distance } )?.fromNode
		if let previousNode = previousNode {
			pointer = previousNode
			path.append(previousNode)
		}
	}
	return path.reversed()
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

print(minPathWithPoints(startNode: a, targetNode: f).map { "\($0.name)" } )

