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

func not16(_ input: Bus16) -> Bus16 {
    .init(input.bits.map { not($0) })
}

func and16(a: Bus16, b: Bus16) -> Bus16 {
    .init(
        a.bits.enumerated().map { offset, element in
            and(a: element, b: b.bits[offset])
        }
    )
}

func or16(a: Bus16, b: Bus16) -> Bus16 {
    .init([
        or(a: a.bits[0], b: b.bits[0]),
        or(a: a.bits[1], b: b.bits[1]),
        or(a: a.bits[2], b: b.bits[2]),
        or(a: a.bits[3], b: b.bits[3]),
        or(a: a.bits[4], b: b.bits[4]),
        or(a: a.bits[5], b: b.bits[5]),
        or(a: a.bits[6], b: b.bits[6]),
        or(a: a.bits[7], b: b.bits[7]),
        or(a: a.bits[8], b: b.bits[8]),
        or(a: a.bits[9], b: b.bits[9]),
        or(a: a.bits[10], b: b.bits[10]),
        or(a: a.bits[11], b: b.bits[11]),
        or(a: a.bits[12], b: b.bits[12]),
        or(a: a.bits[13], b: b.bits[13]),
        or(a: a.bits[14], b: b.bits[14]),
        or(a: a.bits[15], b: b.bits[15]),
    ])
}

func mux16(a: Bus16, b: Bus16, sel: Bit) -> Bus16 {
    .init([
        mux(a: a.bits[0], b: b.bits[0], sel: sel),
        mux(a: a.bits[1], b: b.bits[1], sel: sel),
        mux(a: a.bits[2], b: b.bits[2], sel: sel),
        mux(a: a.bits[3], b: b.bits[3], sel: sel),
        mux(a: a.bits[4], b: b.bits[4], sel: sel),
        mux(a: a.bits[5], b: b.bits[5], sel: sel),
        mux(a: a.bits[6], b: b.bits[6], sel: sel),
        mux(a: a.bits[7], b: b.bits[7], sel: sel),
        mux(a: a.bits[8], b: b.bits[8], sel: sel),
        mux(a: a.bits[9], b: b.bits[9], sel: sel),
        mux(a: a.bits[10], b: b.bits[10], sel: sel),
        mux(a: a.bits[11], b: b.bits[11], sel: sel),
        mux(a: a.bits[12], b: b.bits[12], sel: sel),
        mux(a: a.bits[13], b: b.bits[13], sel: sel),
        mux(a: a.bits[14], b: b.bits[14], sel: sel),
        mux(a: a.bits[15], b: b.bits[15], sel: sel),
    ])
}

func or8Way(_ ways: Way<BusWidth._1>...) -> Bit {
    precondition(ways.count == 8)
    return or(
        a: or(
            a: or(a: ways[0].bit, b: ways[1].bit),
            b: or(a: ways[2].bit, b: ways[3].bit)
        ),
        b: or(
            a: or(a: ways[4].bit, b: ways[5].bit),
            b: or(a: ways[6].bit, b: ways[7].bit)
        )
    )
}

func mux4Way16(_ ways: Way<BusWidth._16>..., sel1: Bit, sel0: Bit) -> Bus16 {
    precondition(ways.count == 4)
    return mux16(
        a: mux16(
            a: ways[0].bus,
            b: ways[1].bus,
            sel: sel0
        ),
        b: mux16(
            a: ways[2].bus,
            b: ways[3].bus,
            sel: sel0
        ),
        sel: sel1
    )
}

func mux8Way16(_ ways: Way<BusWidth._16>..., sel2: Bit, sel1: Bit, sel0: Bit) -> Bus16 {
    precondition(ways.count == 8)
    return mux16(
        a: mux4Way16(ways[0], ways[1], ways[2], ways[3], sel1: sel1, sel0: sel0),
        b: mux4Way16(ways[4], ways[5], ways[6], ways[7], sel1: sel1, sel0: sel0),
        sel: sel2
    )
}
