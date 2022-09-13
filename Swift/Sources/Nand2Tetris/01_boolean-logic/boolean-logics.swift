// swiftlint:disable all

func nand(a: Bit, b: Bit) -> Bit {
    a == ._1 && b == ._1 ? ._0 : ._1
}

func not(input: Bit) -> Bit {
    nand(a: input, b: input)
}
