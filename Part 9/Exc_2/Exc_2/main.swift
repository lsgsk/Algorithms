import Foundation
func Fib(_ n : Int) -> Int{
    switch n {
    case let x where x<2:
        return 1
    default:
        return Fib(n-1) + Fib(n-2)
    }
}

print(Fib(0))
print(Fib(10))
