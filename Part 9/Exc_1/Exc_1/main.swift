enum FactorialError: Error {
    case IncorrectFactorialStartValue()
}

func factorial(n : Int) throws -> Int {
    switch n {
    case let x where x<0:
        throw FactorialError.IncorrectFactorialStartValue()
    case 0,1:
        return 1
    default:
        return n  * (try factorial(n: (n-1)))
    }
}

do {
    try print(factorial(n: 10))
    try print(factorial(n: -10))
} catch FactorialError.IncorrectFactorialStartValue {
    print("Factorial failed")
}


