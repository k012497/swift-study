//
//  ControlFlow.swift
//
//
//  Created by 김소진 on 2022/06/24.
//


// optional
var nickname: String? = nil // 값이 있을 수도 있고 없을 수도(nil) 있을 때, ?표시
let name = "Nickname"
let informalGreeting = "Hi \(nickname ?? name)" // ?? 연산 (Nil-Coalescing Operator)
nickname = "Sophie"

// if
let optionalStr: String? = nil
let optionalInt: Int? = nil
if let str = optionalStr {
  print(str) // optionalStr의 값이 존재한다면 str에 저장, if문 실행. 값이 없을 경우 실행 안 됨. 옵셔널 여러개 바인딩 했으면 그 모두의 값이 존재해야 실행
}

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

// for-in
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers { // (key,value)
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

for i in 0..<100 { // You can keep an index in a loop by using ..< to make a range of indexes.
  i
}

for i in 0...5 {
  print(i) // ...는 마지막 범위 포함(<=)
}

// while
var i = 0
while i < 10 { // condition
  // statement
  i += 1
}
print(i)


// repeat-while
repeat { // 조건에 관계 없이 한 번 실행됨
  // statement
  i += 1
} while i < 10 // condition
print(i)



// switch
let vegetable = "red pepper"
switch vegetable {
  case "celery":
    print("Add some raisins and make ants on a log.") // no need break!
  case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
  case let x where x.hasSuffix("pepper"): // 조건 지정 가능. hasPrefix, containsString, ...
    print("Is it a spicy \(x)?")
  default: // default 케이스 지정 필수!
    print("Everything tastes good in soup.")
}

// switch -> 내부적으로 ~= 연산 사
// a ~= b, b가 a 범위에 속하는지 체크
// 숫자 범위 체크
let intRange = 0..<10
intRange.contains(10)
// 문자열 범위 체크
let stringRange = "a"..."z"
stringRange.contains("a") // true
stringRange.contains("aA") // true 하나라도 포함되면 되는건가 . ..
stringRange.contains("A") // false


let somePoint = (1, 1) // 튜플
switch somePoint { // 범위 지정 케이스도 가능
  case (0, 0):
    print("(0, 0) is at the origin")
  case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
  case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
  case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
  default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")}

