import Foundation

func createRandomArray(_ count : Int) -> [Int]{
    return (1...count).map{_ in Int(arc4random_uniform(100)) }
}

func findSampleVariance(_ array: [Int]) -> Double {
    var total = 0;
    for value in array {
        total += value
    }
    let avarage = Double(total) / Double(array.count)
    var summa = 0.0
    for value in array{
        summa += pow((Double(value) - avarage), 2)
    }
    return summa / Double(array.count)
}

func findSampleStandardDeviation(_ array: [Int]) -> Double
{
    return sqrt(findSampleVariance(array))
}

let array = createRandomArray(10)
print("Array: \(array)")
let s = findSampleStandardDeviation(array)
print("Sample standard deviation: \(s)")
