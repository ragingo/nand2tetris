// swiftlint:disable all

func nand(a: Bit, b: Bit) -> Bit {
    a == ._1 && b == ._1 ? ._0 : ._1
}

func not(_ input: Bit) -> Bit {
    nand(a: input, b: input)
}

func and(a: Bit, b: Bit) -> Bit {
    not(nand(a: a, b: b))
}

func or(a: Bit, b: Bit) -> Bit {
    nand(a: not(a), b: not(b))
}

func xor(a: Bit, b: Bit) -> Bit {
    and(
        a: or(a: a, b: b),
        b: nand(a: a, b: b)
    )
}

// Out = (A and not Sel) or (B and Sel)
func mux(a: Bit, b: Bit, sel: Bit) -> Bit {
    or(
        a: and(a: a, b: not(sel)),
        b: and(a: b, b: sel)
    )
}

func dmux(input: Bit, sel: Bit) -> (a: Bit, b: Bit) {
    (
        a: and(a: input, b: not(sel)),
        b: and(a: input, b: sel)
    )
}

func not16(_ input: Bus16Bits) -> Bus16Bits {
    .init(input.bits.map { not($0) })
}

func and16(a: Bus16Bits, b: Bus16Bits) -> Bus16Bits {
    .init(
        a.bits.enumerated().map { offset, element in
            and(a: element, b: b.bits[offset])
        }
    )
}

func or16(a: Bus16Bits, b: Bus16Bits) -> Bus16Bits {
    .init(
        a.bits.enumerated().map { offset, element in
            or(a: element, b: b.bits[offset])
        }
    )
}

func mux16(a: Bus16Bits, b: Bus16Bits, sel: Bit) -> Bus16Bits {
    .init(
        a.bits.enumerated().map { offset, element in
            mux(a: element, b: b.bits[offset], sel: sel)
        }
    )
}

func or8Way(_ way: Way8) -> Bit {
    way.bits.reduce(._0, { result, bit in or(a: result, b: bit) })
}
