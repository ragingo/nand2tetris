// swiftlint:disable all

enum Bit: Equatable {
    case _0
    case _1
}

// 1入力16ビット
struct Bus16Bits: Equatable {
    let bits: [Bit]

    init(_ bits: [Bit]) {
        precondition(bits.count == 16)
        self.bits = bits
    }
}

// 8入力
struct Way8: Equatable {
    let bits: [Bit]

    init(_ bits: [Bit]) {
        precondition(bits.count == 8)
        self.bits = bits
    }
}
