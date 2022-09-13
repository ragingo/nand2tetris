import XCTest
@testable import Nand2Tetris

final class Nand2TetrisTests: XCTestCase {
    // NAND
    func test_01_boolean_logics_nand() throws {
        XCTAssertEqual(nand(a: ._0, b: ._0), ._1)
        XCTAssertEqual(nand(a: ._0, b: ._1), ._1)
        XCTAssertEqual(nand(a: ._1, b: ._0), ._1)
        XCTAssertEqual(nand(a: ._1, b: ._1), ._0)
    }
    // NOT
    func test_01_boolean_logics_not() throws {
        XCTAssertEqual(not(input: ._0), ._1)
        XCTAssertEqual(not(input: ._1), ._0)
    }
}
