//
//  CrosswordWithStoryboardTests.swift
//  CrosswordWithStoryboardTests
//
//  Created by freund on 5/11/20.
//

import XCTest
@testable import CrosswordWithStoryboard

class CrosswordWithStoryboardTests: XCTestCase {

    func testMiniOne() {
        let text = DataFiles.loadFile(named: "mini-1.json")
        let json = try! JSONSerialization.jsonObject(with: text.data(using: .utf8)!) as! [String:Any]
        let puzzle = Puzzle(jsonForGraphWithProperties: json)
        XCTAssertEqual(puzzle.listAcross().count, 5)
        XCTAssertEqual(puzzle.listDown().count, 5)
    }
    
    func testProvideHint() {
        let text = DataFiles.loadFile(named: "mini-1.json")
        let json = try! JSONSerialization.jsonObject(with: text.data(using: .utf8)!) as! [String:Any]
        let puzzle = Puzzle(jsonForGraphWithProperties: json)
        XCTAssertEqual(puzzle.provideHint(input: Puzzle.Box(id: 3, letter: ""), direction: "across"), "Trendy spiced tea")
        XCTAssertEqual(puzzle.provideHint(input: Puzzle.Box(id: 18, letter: ""), direction: "down"), "World's longest above-ground mountain range")
    }

}
