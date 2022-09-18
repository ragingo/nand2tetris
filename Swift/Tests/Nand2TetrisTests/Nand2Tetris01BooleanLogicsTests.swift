// swiftlint:disable all

import XCTest
@testable import Nand2Tetris

final class Nand2Tetris01BooleanLogicsTests: XCTestCase {
    // NAND
    func test_nand() throws {
        XCTAssertEqual(nand(a: ._0, b: ._0), ._1)
        XCTAssertEqual(nand(a: ._0, b: ._1), ._1)
        XCTAssertEqual(nand(a: ._1, b: ._0), ._1)
        XCTAssertEqual(nand(a: ._1, b: ._1), ._0)
    }

    // NOT
    func test_not() throws {
        XCTAssertEqual(not(._0), ._1)
        XCTAssertEqual(not(._1), ._0)
    }

    // AND
    func test_and() throws {
        XCTAssertEqual(and(a: ._0, b: ._0), ._0)
        XCTAssertEqual(and(a: ._0, b: ._1), ._0)
        XCTAssertEqual(and(a: ._1, b: ._0), ._0)
        XCTAssertEqual(and(a: ._1, b: ._1), ._1)
    }

    // NAND
    func test_or() throws {
        XCTAssertEqual(or(a: ._0, b: ._0), ._0)
        XCTAssertEqual(or(a: ._0, b: ._1), ._1)
        XCTAssertEqual(or(a: ._1, b: ._0), ._1)
        XCTAssertEqual(or(a: ._1, b: ._1), ._1)
    }

    // XOR
    func test_xor() throws {
        XCTAssertEqual(xor(a: ._0, b: ._0), ._0)
        XCTAssertEqual(xor(a: ._0, b: ._1), ._1)
        XCTAssertEqual(xor(a: ._1, b: ._0), ._1)
        XCTAssertEqual(xor(a: ._1, b: ._1), ._0)
    }

    // Mux
    func test_mux() throws {
        // sel=0
        XCTAssertEqual(mux(a: ._0, b: ._0, sel: ._0), ._0)
        XCTAssertEqual(mux(a: ._0, b: ._1, sel: ._0), ._0)
        XCTAssertEqual(mux(a: ._1, b: ._0, sel: ._0), ._1)
        XCTAssertEqual(mux(a: ._1, b: ._1, sel: ._0), ._1)

        // sel=1
        XCTAssertEqual(mux(a: ._0, b: ._0, sel: ._1), ._0)
        XCTAssertEqual(mux(a: ._0, b: ._1, sel: ._1), ._1)
        XCTAssertEqual(mux(a: ._1, b: ._0, sel: ._1), ._0)
        XCTAssertEqual(mux(a: ._1, b: ._1, sel: ._1), ._1)
    }

    // DMux
    func test_dmux() throws {
        // sel=0
        XCTAssertTrue(dmux(input: ._0, sel: ._0) == (a: ._0, b: ._0))
        XCTAssertTrue(dmux(input: ._1, sel: ._0) == (a: ._1, b: ._0))

        // sel=1
        XCTAssertTrue(dmux(input: ._0, sel: ._1) == (a: ._0, b: ._0))
        XCTAssertTrue(dmux(input: ._1, sel: ._1) == (a: ._0, b: ._1))
    }

    // Not16
    func test_not16() throws {
        _ = {
            let input: [Bit]  = [._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0]
            let output: [Bit] = [._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            XCTAssertEqual(not16(.init(input)), .init(output))
        }()
        _ = {
            let input: [Bit]  = [._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            let output: [Bit] = [._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0]
            XCTAssertEqual(not16(.init(input)), .init(output))
        }()
        _ = {
            let input: [Bit]  = [._1, ._1, ._1, ._1, ._0, ._0, ._0, ._0, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            let output: [Bit] = [._0, ._0, ._0, ._0, ._1, ._1, ._1, ._1, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0]
            XCTAssertEqual(not16(.init(input)), .init(output))
        }()
    }

    // And16
    func test_and16() throws {
        _ = {
            let a: [Bit] = [._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0]
            let b: [Bit] = [._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0]
            let x: [Bit] = [._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0]
            XCTAssertEqual(and16(a: .init(a), b: .init(b)), .init(x))
        }()
        _ = {
            let a: [Bit] = [._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            let b: [Bit] = [._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            let x: [Bit] = [._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            XCTAssertEqual(and16(a: .init(a), b: .init(b)), .init(x))
        }()
        _ = {
            let a: [Bit] = [._0, ._1, ._0, ._1, ._0, ._0, ._0, ._0, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            let b: [Bit] = [._1, ._0, ._1, ._0, ._0, ._0, ._0, ._0, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            let x: [Bit] = [._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            XCTAssertEqual(and16(a: .init(a), b: .init(b)), .init(x))
        }()
    }

    // Or16
    func test_or16() throws {
        _ = {
            let a: [Bit] = [._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0]
            let b: [Bit] = [._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0]
            let x: [Bit] = [._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0, ._0]
            XCTAssertEqual(or16(a: .init(a), b: .init(b)), .init(x))
        }()
        _ = {
            let a: [Bit] = [._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            let b: [Bit] = [._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            let x: [Bit] = [._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            XCTAssertEqual(or16(a: .init(a), b: .init(b)), .init(x))
        }()
        _ = {
            let a: [Bit] = [._0, ._1, ._0, ._1, ._0, ._0, ._0, ._0, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            let b: [Bit] = [._1, ._0, ._1, ._0, ._0, ._0, ._0, ._0, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            let x: [Bit] = [._1, ._1, ._1, ._1, ._0, ._0, ._0, ._0, ._1, ._1, ._1, ._1, ._1, ._1, ._1, ._1]
            XCTAssertEqual(or16(a: .init(a), b: .init(b)), .init(x))
        }()
    }

    // Mux16
    func test_mux16() throws {
        // sel=0
        _ = {
            let a: [Bit] = [._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0]
            let b: [Bit] = [._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1]
            let x: [Bit] = [._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0]
            XCTAssertEqual(mux16(a: .init(a), b: .init(b), sel: ._0), .init(x))
        }()
        // sel=1
        _ = {
            let a: [Bit] = [._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0]
            let b: [Bit] = [._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1]
            let x: [Bit] = [._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1, ._0, ._1]
            XCTAssertEqual(mux16(a: .init(a), b: .init(b), sel: ._1), .init(x))
        }()
    }

    // Or8Way
    func test_or8way() throws {
        XCTAssertEqual(or8Way(
            .init(._0), .init(._0), .init(._0), .init(._0), .init(._0), .init(._0), .init(._0), .init(._0)
        ), ._0)
        XCTAssertEqual(or8Way(
            .init(._1), .init(._0), .init(._1), .init(._0), .init(._1), .init(._0), .init(._1), .init(._0)
        ), ._1)
        XCTAssertEqual(or8Way(
            .init(._1), .init(._1), .init(._1), .init(._1), .init(._1), .init(._1), .init(._1), .init(._1)
        ), ._1)
    }
}
