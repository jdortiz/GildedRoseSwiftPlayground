//: [Previous](@previous) - [Table of Contents](Table%20of%20Contents)
/*:
 # Gilded Rose Tests

 Write your tests below.
 */
import Foundation
import XCTest


class GildedRoseTests: XCTestCase {

//: Your tests go here.

    func testSellInDecreasesOneUnit() {
        sellInTestHelper(name: "Normal", initialSellIn: 10, initialQuality: 15, expectedSellIn: 9)
    }

    func testQualityDecreasesOneUnit() {
        qualityTestHelper(name: "Normal", initialSellIn: 10, initialQuality: 15, expectedQuality: 14)
    }

    func testQualityDecreasesTwoUnitsAfterSellInDate() {
        qualityTestHelper(name: "Normal", initialSellIn: 0, initialQuality: 15, expectedQuality: 13)
    }

    func testQualityIsNeverNegative() {
        qualityTestHelper(name: "Normal", initialSellIn: 10, initialQuality: 0, expectedQuality: 0)
    }

    private func sellInTestHelper(name: String, initialSellIn: Int, initialQuality: Int,
                                  expectedSellIn: Int, line: UInt = #line) {
        let items = [ Item(name: name, sellIn: initialSellIn, quality: initialQuality) ]
        let sut = GildedRose(items: items)

        sut.updateQuality()

        XCTAssertEqual(expectedSellIn, sut.items[0].sellIn, line: line)
    }

    private func qualityTestHelper(name: String, initialSellIn: Int, initialQuality: Int,
                                  expectedQuality: Int, line: UInt = #line) {
        let items = [ Item(name: name, sellIn: initialSellIn, quality: initialQuality) ]
        let sut = GildedRose(items: items)

        sut.updateQuality()

        XCTAssertEqual(expectedQuality, sut.items[0].quality)
    }
}

/*:
 # Code required for testing

 The lines below this text are required to run your tests. You shouldn't need to do any changes there.
 */
class PlaygroundTestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {

        print(" +++ TEST FAILED: \(lineNumber): \(testCase.name), \(description)")
        //: Uncomment the next line if you prefer your tests to stop after the first failure.
        //assertionFailure(description, line: UInt(lineNumber))
    }
}
let testObserver = PlaygroundTestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
GildedRoseTests.defaultTestSuite.run()
//: [Previous](@previous) - [Table of Contents](Table%20of%20Contents)
