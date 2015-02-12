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
	
	init (alphabet: Alphabet)
	{
		var blankSymbol = alphabet.blankSymbol()
		for index in 0...10
		{
			var newBlankSymbol = Symbol(newSymbol: blankSymbol)
			var newCell = Cell(newSymbol: newBlankSymbol)
			self.cells += [newCell]
			self.currentIndex = self.cells.count/2
		}
	}
	
	func applyTransition(transition : Transition)
	{
		
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
		self.currentIndex--
		return self.cells[currentIndex]
	}
	
	func nextCell() -> Cell
	{
		self.currentIndex++
		return self.cells[currentIndex]
	}
	
	func description() -> String
	{
		var result = "Current cell Symbol is \(cells[currentIndex])"
		return result
	}
	
	func fullDescription() -> String
	{
		var result = ""
		for cell in cells
		{
			result += "\(cell.description())"
		}
		
		return result
	}
}