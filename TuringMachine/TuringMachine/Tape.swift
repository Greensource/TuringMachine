//
//  Tape.swift
//  TuringMachine
//
//  Created by Pierre DUCHENE on 10/02/2015.
//  Copyright (c) 2015 Greensource. All rights reserved.
//

import Foundation

class Tape {
	
	var cells: [Cell] = []
	var currentIndex: Int = 0
	var blankSymbol: Symbol
	
	init (alphabet: Alphabet)
	{
		blankSymbol = alphabet.blankSymbol
		for index in 0...10
		{
			var newBlankSymbol = Symbol(newSymbol: blankSymbol)
			var newCell = Cell(newSymbol: newBlankSymbol)
			self.cells += [newCell]
			self.currentIndex = self.cells.count/2
		}
	}
	
	init(blankSymbol: Symbol, stringTape: String)
	{
		self.blankSymbol = blankSymbol
		let tapeArray = Array(stringTape)
		for index in 0...tapeArray.count-1
		{
			var charactere = tapeArray[index]
			var newSymbol = Symbol(string: "\(charactere)")
			
			var newCell = Cell(newSymbol: newSymbol)
			cells.insert(newCell, atIndex: index)
		}
		
		self.currentIndex = 0
	}
	
	func readCurrentCell() -> Symbol
	{
		return cells[currentIndex].read()
	}
	
	func writeCurrentCell(newSymbol: Symbol)
	{
		cells[currentIndex].write(newSymbol)
	}
	
	func currentCell() -> Cell
	{
		return self.cells[currentIndex]
	}
	
	func previousCell() -> Cell
	{
		if (currentIndex == 0)
		{
			// We have to add a cell at first
			var newCell = Cell(newSymbol: blankSymbol)
			cells.insert(newCell, atIndex: 0)
		}
		else
		{
			self.currentIndex--
		}
		
		return self.cells[currentIndex]
	}
	
	func nextCell() -> Cell
	{
		if (currentIndex == cells.count-1)
		{
			// We have to add a cell at first
			var newCell = Cell(newSymbol: blankSymbol)
			cells.insert(newCell, atIndex: cells.count-1)
		}
		else
		{
			self.currentIndex++
		}
		
		return self.cells[currentIndex]
	}
	
	func description() -> String
	{
		var result = "Current cell Symbol is \(cells[currentIndex].description())"
		return result
	}
	
    func fullDescriptionWithoutHighlight() -> String
    {
        var result = ""
        for index in 0...cells.count-1
        {
            var current = cells[index]
            result += "\(current.description())"
        }
        
        return result
    }
    
	func fullDescription() -> String
	{
		var result = ""
        for index in 0...cells.count-1
		{
            var current = cells[index]
            if index == currentIndex
            {
                result += "[\(current.description())]"
            }
            else
            {
                result += "\(current.description())"
            }
		}
		
		return result
	}
}