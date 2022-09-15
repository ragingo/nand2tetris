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
}
