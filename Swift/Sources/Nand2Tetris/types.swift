// swiftlint:disable all

enum Bit: Equatable {
    case _0
    case _1
}

struct Bus16Bits: Equatable {
    let bits: [Bit]

    init(_ bits: [Bit]) {
        precondition(bits.count == 16)
        self.bits = bits
    }
}