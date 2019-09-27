import Foundation

func extendPartialOrdering(_ nodesCollection: [Node]) -> [Node] {
	var collection = nodesCollection
	var ordering = [Node]()
	
	while collection.count > 0 {
		var readyNode: Node? = nil
		outer: for node in collection {
			var found = true
			inner: for lnode in collection {
				if lnode.links.map({ $0.toNode }).contains(node) {
					found = false
					break inner
				}
			}
			if found {
				readyNode = node
				break outer
			}
		}
		
		if let node = readyNode {
			ordering.append(node)
			collection.removeAll(where: { $0 == node })
			readyNode = nil
		}
		else {
			fatalError()
		}
	}
	return ordering
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
i.links.append(Link(cost: 3, toNode: d))


print(extendPartialOrdering([a,b,c,d,e,f,g,h]).reduce("", { (result, node) -> String in "\(result) \(node.name)" }))
