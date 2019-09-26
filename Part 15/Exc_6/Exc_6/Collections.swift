import Cocoa

class Stack<T> {
	private var array: [T] = [T]()
	
	func push(_ value: T){
		array.append(value)
	}
	
	func pop() -> T?{
		return array.popLast()
	}
	
	
}

class Queue<T> {
	private var array: [T] = [T]()
	
	func enqueue(_ value : T){
		array.append(value)
	}
	
	func dequeue() -> T? {
		return array.isEmpty ? Optional<T>.none : array.removeFirst()
	}
}
