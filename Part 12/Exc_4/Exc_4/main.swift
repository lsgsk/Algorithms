import Foundation

func startExhaustiveSearch(collectionToDivide: [Int]) {
	var firstBasketIndexes: [Int] = []
	var bestSolution: [Int]? = nil
	var totalSum = collectionToDivide.reduce(0, +)
	var iterationsCount = 0
	
	func exhaustiveSearch(nextIndex: Int) {
		iterationsCount += 1
		if nextIndex > collectionToDivide.count-1 {
			let firstBasketSum = firstBasketIndexes.map { collectionToDivide[$0] }.reduce(0, +)
			if totalSum == firstBasketSum * 2 {
				bestSolution = firstBasketIndexes
			}
		}
		else {
			firstBasketIndexes.append(nextIndex)
			exhaustiveSearch(nextIndex: nextIndex + 1)
			firstBasketIndexes.removeLast()
			exhaustiveSearch(nextIndex: nextIndex + 1)
		}
	}
	exhaustiveSearch(nextIndex: 0)
	if let bestSolution = bestSolution {
		let busket1 = bestSolution.map { collectionToDivide[$0] }
		let busket2 = (0..<collectionToDivide.count).filter { !bestSolution.contains($0) }.map { collectionToDivide[$0] }
		print("There is solution. Busket 1: \(busket1), busket 2: \(busket2)")
	}
	else {
		print("There is no solution")
	}
	print("Iterations: \(iterationsCount)")
}

startExhaustiveSearch(collectionToDivide: [2, 4, 1, 1, 2, 1, 3, 5, 3, 2])

