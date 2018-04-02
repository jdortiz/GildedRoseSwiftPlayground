//: [Previous](@previous) - [Table of Contents](Table%20of%20Contents) - [Next](@next)
/*:
 # Starting point

 This playground page contains the code created by Leeroy.

 It is also included in the source folder of the Test page, so use it only in order to understand how hard it is to introduce new products and as a reference.  The refactoring must also be done in the source files of the tests.
 */

import Foundation

struct Item {
    var name: String
    var sellIn: Int
    var quality: Int
}

extension Item: CustomStringConvertible {
    var description: String {
        return "\(name), \(sellIn), \(quality)"
    }
}


class GildedRose {
    var items:[Item]

    required init(items:[Item]) {
        self.items = items
    }

    func updateQuality() {
        for i in 0..<items.count {
            if (items[i].name != "Aged Brie" && items[i].name != "Backstage passes to a TAFKAL80ETC concert") {
                if (items[i].quality > 0) {
                    if (items[i].name != "Sulfuras, Hand of Ragnaros") {
                        items[i].quality = items[i].quality - 1
                    }
                }
            } else {
                if (items[i].quality < 50) {
                    items[i].quality = items[i].quality + 1

                    if (items[i].name == "Backstage passes to a TAFKAL80ETC concert") {
                        if (items[i].sellIn < 11) {
                            if (items[i].quality < 50) {
                                items[i].quality = items[i].quality + 1
                            }
                        }

                        if (items[i].sellIn < 6) {
                            if (items[i].quality < 50) {
                                items[i].quality = items[i].quality + 1
                            }
                        }
                    }
                }
            }

            if (items[i].name != "Sulfuras, Hand of Ragnaros") {
                items[i].sellIn = items[i].sellIn - 1
            }

            if (items[i].sellIn < 0) {
                if (items[i].name != "Aged Brie") {
                    if (items[i].name != "Backstage passes to a TAFKAL80ETC concert") {
                        if (items[i].quality > 0) {
                            if (items[i].name != "Sulfuras, Hand of Ragnaros") {
                                items[i].quality = items[i].quality - 1
                            }
                        }
                    } else {
                        items[i].quality = items[i].quality - items[i].quality
                    }
                } else {
                    if (items[i].quality < 50) {
                        items[i].quality = items[i].quality + 1
                    }
                }
            }
        }
    }
}

//: [Previous](@previous) - [Table of Contents](Table%20of%20Contents) - [Next](@next)
