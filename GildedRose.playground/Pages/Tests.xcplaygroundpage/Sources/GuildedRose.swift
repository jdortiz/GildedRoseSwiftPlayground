import Foundation

public extension Item {
    func changeSellIn(increment: Int) -> Item {
        return Item(name: name, sellIn: sellIn + increment, quality: quality)
    }

    func changeQuality(increment: Int) -> Item {
        return Item(name: name, sellIn: sellIn, quality: quality + increment)
    }

    func limitQualityTo(min: Int) -> Item {
        if quality >= min {
            return self
        } else {
            return Item(name: name, sellIn: sellIn, quality: min)
        }
    }

    func limitQualityTo(max: Int) -> Item {
        if quality <= max {
            return self
        } else {
            return Item(name: name, sellIn: sellIn, quality: max)
        }
    }
}


public class GildedRose {
    public var items:[Item]

    required public init(items:[Item]) {
        self.items = items
    }

    public func updateQuality() {
        for i in 0..<items.count {

            switch items[i].name {
            case "Normal":
                items[i] = items[i].changeSellIn(increment: -1)
                if items[i].sellIn >= 0 {
                    items[i] = items[i].changeQuality(increment: -1).limitQualityTo(min: 0)
                } else {
                    items[i] = items[i].changeQuality(increment: -2).limitQualityTo(min: 0)
                }

            case "Aged Brie":
                items[i] = items[i].changeSellIn(increment: -1)
                if items[i].sellIn < 0 {
                    items[i] = items[i].changeQuality(increment: +2).limitQualityTo(max: 50)
                } else {
                    items[i] = items[i].changeQuality(increment: +1).limitQualityTo(max: 50)
                }

            case "Sulfuras, Hand of Ragnaros":
                break

            default:

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
}
