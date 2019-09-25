import Cocoa

class Stack<T> {
	private var array: [T] = [T]()
	
	func push(_ value: T){
		array.append(value)
	}
	
	func pop() -> T?{
		return array.popLast()
	}
	
	func first() -> T? {
		return array.first
	}
}

class Queue<T> {
	private var array: [T] = [T]()
	
	func enqueue(_ value : T){
		array.append(value)
	}
	
	func dequeue() -> T?{
		return array.removeFirst()
	}
	
	func pop() -> T?{
		return array.popLast()
	}
}
