//: [Previous](@previous) - [Table of Contents](Table%20of%20Contents)
/*:
 # Gilded Rose Tests

 Write your tests below.
 */
import Foundation
import XCTest


class GildedRoseTests: XCTestCase {

//: Your tests go here.

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
