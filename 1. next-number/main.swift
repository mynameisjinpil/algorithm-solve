import Foundation

// 자연수 n이 주어졌을 때, n의 다음 큰 숫자는 다음과 같이 정의합니다.
// 1. n의 다음 큰 숫자는 n보다 큰 자연수입니다.
// 2. n의 다음 큰 숫자와 n은 2진수로 변환했을 때 1의 갯수가 같습니다.
// 3. n의 다음 큰 숫자는 조건 1,2를 만족하는 수 중 가장 작은 수 입니다.
// 4. n은 1000000이하의 자연수 입니다.

func solution(_ n: Int) -> Int {
    let binaryA = getBinary(n)
    var answer: Int = n

    while true {
        answer += 1
        let binaryB = getBinary(answer)

        if compareCountOfNumberOne(binaryA, binaryB) {
            break
        }
    } 

    return answer
}

func getBinary(_ n: Int) -> String {
    let binary: String = String(n, radix: 2)
    return binary
}

func getDecimal(_ n: String) -> Int {
    let decimal = Int(n, radix: 2)
    return decimal!
}

func compareCountOfNumberOne(_ n: String, _ m: String) -> Bool {
    let a = getCountOfNumberOne(n) 
    let b = getCountOfNumberOne(m)

    if a == b { return true }
    else { return false }
}

func getCountOfNumberOne(_ d: String) -> Int {
    var count = 0
    d.forEach {digit in 
        if digit == "1" { count += 1 }
    }
    return count
}

// 1. 2진수로 바꾼다.
// 2. 1의 갯수가 같은지 체크한다.
// 3. 1의 갯수가 같은 것 중 가장 작은것인지 체크한다.
// 2. 다시 10진수로 바꾼다.