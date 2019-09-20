
func hillClimbing(collectionToDivide: [Int]) {
	let maxIndex = collectionToDivide.count-1
	var firstBasketIndexes: [Int] = []
	var secondBasketIndexes: [Int] = []
	
	for index in 0...maxIndex {
		let busketSum1 = firstBasketIndexes.map { collectionToDivide[$0] }.reduce(0, +)
		let busketSum2 = secondBasketIndexes.map { collectionToDivide[$0] }.reduce(0, +)
		let dif1 = abs(busketSum1 + collectionToDivide[index] - busketSum2)
		let dif2 = abs(busketSum1 - busketSum2 - collectionToDivide[index])
		dif1 < dif2 ? firstBasketIndexes.append(index) : secondBasketIndexes.append(index)
		print("\(firstBasketIndexes) - \(secondBasketIndexes)")
	}
	let busket1 = firstBasketIndexes.map { collectionToDivide[$0] }.reduce(0, +)
	let busket2 = secondBasketIndexes.map { collectionToDivide[$0] }.reduce(0, +)
	print("There is the best founded solution. Busket 1: \(busket1), busket 2: \(busket2)")
}

hillClimbing(collectionToDivide: [7,9,7,6,7,7,5,7,5,6])
