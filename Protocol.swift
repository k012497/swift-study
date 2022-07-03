//
//  Protocol.swift
//  
//
//  Created by 김소진 on 2022/07/03.
//


// https://devxoul.gitbooks.io/ios-with-swift-in-40-hours/content/Chapter-3/protocols.html
// Protocol
// 인터페이스, 프로퍼티나 메서드를 정의 (구현x)
protocol Sendable {
    var from: String? { get }
    var to: String { get }
    
    func send()
}

// 구조체와 클래스에 적용(conform)
struct Mail: Sendable {
    var from: String?
    var to: String
    
    func send() {
        print("Send a mail from \(self.from) to \(self.to)")
    }
}

struct Feedback: Sendable {
    var from: String? {
        return nil
    }
    var to: String
    
    func send() {
        print("Send a feedback to \(self.to)")
    }
}

func send(_ sendable: Sendable) {
    sendable.send()
}

let mail = Mail(from: "dev@mail.com", to: "my@mail.com")
send(mail) // Sendable을 따르고 있으므로 send 함수에 전달 가능

let feedback = Feedback(to: "dev@mail.com")
send(feedback) // Sendable을 따르고 있으므로 send 함수에 전달 가능

// 프로토콜은 또 다른 프로토콜을 따를 수 있다
protocol Messagable: Sendable {
    var message: String? { get }
}


// Type Casting
var anyNum: Any = 10

// is로 타입 검사
print("anyNum is Int :", anyNum is Int) // true
print("anyNum is Any :", anyNum is Any) // true
// print(anyNum + 1) // Error, Cannot convert value of type 'Any' to expected argument type 'Int' -> is Int는 true지만 컨버트는 불가능 .. 지금 Int 들어있지만 더 큰 범위니까

// anyNum = 1.2345679 // 이렇게 다른 타입도 포함돼있으니까 !
// print(anyNum + 1) // 역시나 불가넝~
// print("anyNum is Int :", anyNum is Int) // false
// print("anyNum is Double :", anyNum is Double) // true
// print(type(of:anyNum)) // Double
// var doubleNum = 0.23456 // 타입을 Any로 정의하지 않았을 때
// print(type(of: doubleNum)) // Double
// print(doubleNum + 1) // 1.23456, 연산 가능
// print(doubleNum is Any) // true

let number: Int? = anyNum as? Int // Down Casting, 다른 타입도 포함되므로 옵셔널을 취해야 함
if let number = anyNum as? Int {
    print(number + 1) // 11
}


// print((anyNum as? Int) + 1) // Value of optional type 'Int?' must be unwrapped to a value of type 'Int' // 왜 요기선 옵셔널 안되는 것 ?
print((anyNum as! Int) + 1)



// 주요 프로토콜
// 1. CustomStringConvertible
// 자기 자신을 표현하는 문자열을 정의
// print(), String() 또는 "\()"에서 사용될 때의 값
public protocol CustomStringConvertible { // 'public' modifier cannot be used in protocols, public이 갖는 의미?
    // A textual representation of `self`.
    public var description: String { get }
}

struct Dog: CustomStringConvertible {
    var name: String
    var description: String {
        return "\(self.name) 알알!"
    }
}

let dog = Dog(name: "찌니")
print(dog) // 찌니 알알! // 왜 description이 실행 ?


// 2. ExpressibleBy
// 리터럴(Literal) : 생성자를 사용하지 않고 생성할 수 있게 만드는 것
// Int(19) 안 하고 19 할당해도 Int.
let num = 19
print(type(of: num)) // Int
print(num is Int) // true
// 이걸 가능하게 해주는 프로토콜이 ExpressibleBy***Literal (***: Integer, Stiring, ...)
// 각 프로토콜은 리터럴 값을 받는 생성자를 정의하고 있음

// EX. ExpressibleByArrayLiteral을 적용하여 아래와 같이 홀수와 짝수를 나눠서 보관하는 OddEvenFilter 구조체를 만들어보세요.
struct OddEvenFilter: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Int
    
    let odds: Array<Int>
    let evens: Array<Int>
    
    init(arrayLiteral elements: Int...) {
        // func filter(includeElement: (T) -> Bool) -> Array<T>

        // self.odds = elements.filter({ (value: Int) -> Bool in return (value % 2 == 1) })
        // self.evens = elements.filter({ (value: Int) -> Bool in return (value % 2 == 0) })
        
        self.odds = elements.filter { $0 % 2 == 1 }
        self.evens = elements.filter { $0 % 2 == 0 }
    }
}

let oddEvenFilter: OddEvenFilter = [1, 3, 5, 2, 7, 4]
print(oddEvenFilter.odds) // [1, 3, 5, 7]
print(oddEvenFilter.evens) // [2, 4]
