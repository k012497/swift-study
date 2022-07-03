//
//  Enumerations And Structures
//  
//
//  Created by 김소진 on 2022/07/02.
//

// Enumerations (열거형) - 일급 클래스
// enum 키워드 사용
enum Rank: Int {
    case ace = 1 // 디폴트로는 0에서 1씩 증가하는 값 할당됨, 이렇게 할당하면 여기서부터 차례로 1씩 증가!
    // strings or floating-point numbers 등도 원시값으로 가능
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func describe() -> String { // 클래스나 named types처럼 methods 가질 수 있음
        switch self {
            case .ace: // 타입이 알려져 있으면 self 키워드 생략 가능.
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
        }
    }
    
    // EX. Write a function that compares two Rank values by comparing their raw values.
    func compare(rank: Rank) -> String {
        let selfValue = self.rawValue
        let rankRawValue = rank.rawValue
        
        print(selfValue, rankRawValue)
        
        if selfValue > rankRawValue {
            return "\(self) > \(rank)"
        } else if selfValue == rankRawValue {
            return "\(self) == \(rank)"
        } else {
            return "\(self) < \(rank)"
        }
    }
}

let ace = Rank.ace
let six = Rank.six
let sixRawValue = six.rawValue
print(ace, six) // ace six
print(six.describe()) // 6
print(six.compare(rank: Rank.king)) // six < king

// 원시값을 가지고 Enum 만들기
let ten = Rank(rawValue: 10) // 원시값으로 Enum 생성할 때 내부적으로 init?(rawValue:) 생성자를 사용 (RawRepresentable 프로토콜)
print(Rank(rawValue: 20)) // 즉 이렇게 정의되지 않은 원시값으로 Enum 만들면 nil
print(ten) // Optional(Rank.ten) -> 따라서 이거슨 Optional ..

// 타입 어노테이션이 있으면 Enum의 이름 생략 가능
let rank: Rank = .king

// 의미 있는 원시값이 없으면 원시값이 없는 Enum도 가능
// The case values of an enumeration are actual values, not just another way of writing their raw values.
enum Suit {
    case spades, hearts, diamonds, clubs
    func describe() -> String {
        switch self {
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .clubs:
                return "clubs"
        }
    }
    
    // EX. Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
    func getColor() -> String {
        switch self {
            case .spades, .clubs:
                return "black"
            case .hearts, .diamonds:
                return "red"
        }
    }
}

// Associated Values가 어떤 개념 ?
// 각 케이스가 값 하나가 되는 것 외에 각각의 케이스가 연관 값을 갖는 것이 허용된다.
// 같은 열거형 내의 각각의 케이스가 서로 다른 타입의 연관 값을 갖는 것도 허용된다.
enum ServerResponse {
    case result(String, String, String)
    case fail(String)
}

let success = ServerResponse.result("Success", "200", "15:00")
let failure = ServerResponse.fail("Server error")

// 값 꺼내오기 1 - if-case
if case .result(let message, let code, let time) = success { // 변수 세 개 채워지면 true?
  print("\(message)(\(code)) - \(time)")
}

// 값 꺼내오기 2 - switch
switch failure {
    case let .result(message, code, time): //
        print("\(message)(\(code)) - \(time)")
    case let .fail(message):
        print("\(message)")
}

print(type(of: success)) // ServerResponse

// Structures (구조체)
// class처럼 methods, initialize 사용.
// but 참조가 아닌 복사(copy), 상속 불가능
// struct 키워드 사용
struct Card {
    var rank: Rank
    var suit: Suit
    func describe() -> String {
        return "The \(rank.describe()) of \(suit.describe())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDesciption = threeOfSpades.describe()
print(threeOfSpades) // Card(rank: Rank.three, suit: Suit.spades)
print(threeOfSpadesDesciption) //The 3 of spades

