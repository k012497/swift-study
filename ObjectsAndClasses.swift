//
//  Objects and Classes.swift
//  
//
//  Created by 김소진 on 2022/07/01.
//

// class
class Chair {
    var numberOfLeg: Int
    var origin: String
    private var creator: String = "Sophie"
    
    // 생성자 (initializer)
    init(numberOfLeg: Int, origin: String) {
        self.numberOfLeg = numberOfLeg
        self.origin = origin // 옵셔널이 아니라면 선언부나 생성자에서 모든 프로퍼티의 초깃값이 할당되어야 함
    }
    
    func describeLeg() -> String {
        return "This chair has \(numberOfLeg) leg(s)."
    }
    
    func describeOrigin() -> String {
        return "Made in \(origin)"
    }
    
    
    // 소멸자 (deinitializer)
    deinit {
        // 소멸자는 매개변수 없음. 직접 호출하는 게 아님
        // 인스턴스 메모리가 해제될 때 호출된다.
        // 호출 안 되면 메모리 누수 의심 ..
        // 인스턴스에 nil을 할당하면 소멸자 호출
    }
}

let chair = Chair(numberOfLeg: 3, origin: "Korea")
print(chair.describeLeg())
print(chair.describeOrigin())


// 상속
class NamedChair: Chair { // 부모(supercalss) 콜론으로 명시
    // ① 저장 프로퍼티(Stored property) - 값을 저장하는 상수/변수
    var name: String
    // lazy 키워드 사용 시, 해당 프로퍼티를 사용(해당 프로퍼티에 접근)하기 전까지 계산되지 않는다
    // lazy var property = ...
    
    init(name: String, numberOfLeg: Int, origin: String) {
        self.name = name // 1. subclass가 선언한 프로퍼티 초깃값 할당
        self.material = "Wood"
        super.init(numberOfLeg: numberOfLeg, origin: origin) // 2. 그 후 부모 생성자 호출
        print(self.name) // 3. 그 이후 self 접근 가능, 아니면 컴파일 에러 !
    }
    
    // Override
    // 오버라이딩을 원하지 않을 경우 final 키워드 사용
    // (final var, final func, final class func, and final subscript)
    // Stored property는 오버라이딩 불가능
    override func describeLeg() -> String {
        return "\(name) has \(numberOfLeg) leg(s)."
    }

    // private 프로퍼티는 상속 받지 않음. 오버라이딩 아님
    var creator = "Kim"

    // ② 연산 프로퍼티(Computed property) - 저장 공간 없이 저장 프로퍼티 값을 읽어 연산 후 결과 반환
    // 값을 저장하는 것이 아니므로 타입 명시 필수 (타입 추론 불가)
    var selfIntroduce: String {
        // 접근자 getter
        // get만 정의할 경우 키워드 생략 가능(read only)
        get {
            return "This chair is \(name.uppercased())" // 다른 프로퍼티의 값을 얻거나 연산하는 return 구문 필수
        }
        
        // 설정자 setter
        set(name) {
            self.name = "My name is \(name.uppercased())!" //다른 저장 프로퍼티에 값을 저장
        }
        
        // 파라미터 없이 newValue라는 이름으로 사용도 가능!
        /*
        set {
            self.name = newValue
        }
        */
    }
    
    // 프로퍼티 옵저버(Property Observer)
    // 연산은 필요 없고 속성에 값이 지정되기 직전/후로 원하는 코드 실행하고 싶을 때
    var material: String {
        // before setting a new value
        willSet {
            print("\(self.material) is gonna be \(newValue)")
        }
        
        // after setting a new Value
        didSet {
            print("\(self.material) was \(oldValue)")

        }
    }
}

let roundChair: NamedChair? = NamedChair(name: "round", numberOfLeg: 4, origin: "Korea")
let creator = roundChair?.creator // optioanl value인 roundChair가 nil일 경우 ? 이후 무시, return nil
roundChair?.material = "Plastic" // willSet, didSet 테스트
