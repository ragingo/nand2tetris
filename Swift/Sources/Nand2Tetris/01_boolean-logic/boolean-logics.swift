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

func mux(a: Bit, b: Bit, sel: Bit) -> Bit {
    or(
        a: and(a: a, b: not(sel)),
        b: and(a: b, b: sel)
    )
}
