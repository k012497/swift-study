//
//  SimpleValues.swift
//  
//
//  Created by 김소진 on 2022/06/24.
//

// let 상수 var 변수
// 할당 시 타입 추론됨, 타입 명시는 콜론으로 명시
var apples = 4
apples = 5
//myVariable = 5.5 // error, 같은 타입만 가능
let oranges = 1

// -- EX) Create a constant with an explicit type of Float and a value of 4.
let value: Float = 4
// Float : 32비트 부동 소수
// Double: 64비트 부동소수

// convert a value to a different type -> make an instance!
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let escape = "Im \(width)"


// -- EX) Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.
let num: Float = 1.5
let str = "Sojin"
let calc = "Number is \(num)"
let greeting = "Hello \(str)"


// multiple lines
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""


// Array
let emptyArray: [String] = [] // 빈 배열
var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water" // index로 접근
shoppingList.append("blue paint") // 배열에 추가

// Dictionary
let emptyDictionary: [String: Float] = [:] // 빈 딕셔너리
let occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
 ]
occupations["Kaylee"] = "Developer" // key로 접근
occupations["Jayne"] = "Public Relations" // 딕셔너리에 추가

// Tuple
// 순서 있는 열거 like Array
// 하지만 서로 다른 타입 가능, 길이 고정
let simpleTuple1 : (type1, type2, ...) = ( value1, value2, ...)
let simpleTuple2 = ( value1, value2, ...) // 타입 추론 가능
let namedTuple: (model: String, color: String, storage: Int) // 파라미터 이름
let (_, color, storage) = ("iPhone13", "starlight", 256) // 여러 변수로 받기 가능. 생략 시 _
print(color)
print(storage)

// an empty interval
let empty = 0.0..<0.0
empty.contains(1)