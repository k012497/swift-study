//
//  Functions and Closures.swift
//
//
//  Created by 김소진 on 2022/06/27.
//

// 함수 선언, 파라미터 -> 리턴
// parameter 이름(arguments 라벨) 작성, 생략 시 underscore
func confess(person: String, _ emoji: String = "🥰") -> String { // 파라미터 기본값 지정
  return "I love \(person) S2 \(emoji)"
}
// 함수 호출
confess(person: "you", "💛")

// 파라미터 개수가 정해지지 않은 경우 (Variadic Parameters)
func sum(_ numbers: Int...) -> Int {
  var sum = 0
  for number in numbers {
    sum += number
  }
  return sum
}
sum(1, 2, 3, 4, 5)
sum(1, 2, 4)


// 튜플 리턴
func getGrade(scores: [Int]) -> (sum: Int, grade: String) {
    var sum = 0
    
    for score in scores {
        sum += score
    }
    
    switch sum {
        case 1..<10: // Interval Matching, 범위 연산자 활용하여 매칭
            return (sum, "D")
        case 11..<20:
            return (sum, "B")
        case 21..<30:
            return (sum, "C")
        case 31..<40:
            return (sum, "A")
        default:
            return (sum, "Somthing's wrong X(")
    }
}
let grade = getGrade(scores: [5, 6, 10, 5])
print(grade.sum)
print(grade.1)


// Nested Function
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// function as arguments
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// return function as its value(first-class type)
func makeIncrementer() -> ((Int) -> Int) { // 또는 () -> (Int) -> Int
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// Closures
// blocks of code that can be called later. 나중에 실행 가능한 코드 블럭!
// can write a closure without a name by surrounding code with braces ({}). 이름 없이 중괄호로 감싸서 표현 가능
// 사실 함수는 이름이 있는 클로저 !
func makeIncrementerUsingClosure() -> (Int) -> Int {
    return {(number:Int) -> Int in // in 키워드를 사용해서 파라미터, 반환 타입 영역과 실제 클로저의 코드를 분리
        return 1 + number
    }
}

func makeIncrementerUsingClosureWithSimple() -> (Int) -> Int {
    // outer함수에서 타입을 정의하고 있으므로 클로저의 파라미터/리턴 타입 생략 가능
    return { number in
        return 1 + number
    }
    
    // 타입뿐만 아니라 파라미터를 각 $1, ...로 대치 가능
    //    return {
    //        return 1 + $1
    //    }
    
    // 클로저 코드 한 줄이면 리턴도 생략 ..
    //    return { 1 + $1 }
}
