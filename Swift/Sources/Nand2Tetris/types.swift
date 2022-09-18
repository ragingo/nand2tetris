// swiftlint:disable all

enum Bit: Equatable {
    case _0
    case _1
}

protocol BusWidthValue {
    static var value: Int { get }
}

enum BusWidth {
    struct _1: BusWidthValue {
        static let value: Int = 1
    }
    struct _16: BusWidthValue {
        static let value: Int = 16
    }
}

struct Bus<T: BusWidthValue>: Equatable {
    let bits: [Bit]

    init(_ bits: [Bit]) {
        precondition(bits.count == T.value)
        self.bits = bits
    }
}

/// 1入力16ビット
typealias Bus16 = Bus<BusWidth._16>

struct Way<T: BusWidthValue> {
    let bus: Bus<T>

    init(_ bits: Bit...) {
        precondition(bits.count == T.value)
        self.bus = Bus(bits)
    }
}

extension Way where T == BusWidth._1 {
    var bit: Bit {
        bus.bits[0]
    }
}
