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
        // Arrange
        let items = [ Item(name: "Normal", sellIn: 10, quality: 15) ]
        let sut = GildedRose(items: items)

        // Act
        sut.updateQuality()

        // Assert
        XCTAssertEqual(9, sut.items[0].sellIn)
    }

    func testQualityDecreasesOneUnit() {
        let items = [ Item(name: "Normal", sellIn: 10, quality: 15) ]
        let sut = GildedRose(items: items)

        sut.updateQuality()

        XCTAssertEqual(14, sut.items[0].quality)
    }

    func testQualityDecreasesTwoUnitsAfterSellInDate() {
        let items = [ Item(name: "Normal", sellIn: 0, quality: 15) ]
        let sut = GildedRose(items: items)

        sut.updateQuality()

        XCTAssertEqual(13, sut.items[0].quality)
    }

    func testQualityIsNeverNegative() {
        let items = [ Item(name: "Normal", sellIn: 10, quality: 0) ]
        let sut = GildedRose(items: items)

        sut.updateQuality()

        XCTAssertEqual(0, sut.items[0].quality)
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
