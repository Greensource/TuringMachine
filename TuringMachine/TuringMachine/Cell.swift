//
//  Cell.swift
//  TuringMachine
//
//  Created by Pierre DUCHENE on 10/02/2015.
//  Copyright (c) 2015 Greensource. All rights reserved.
//

import Foundation

class Cell {
	var symbol: Symbol
	
	init (newSymbol: Symbol)
	{
		self.symbol = newSymbol
	}
	
	func read() -> Symbol
	{
		return self.symbol
	}
	
	func write(newSymbol: Symbol)
	{
		self.symbol = newSymbol
	}
	
	func description() -> String
	{
		return self.symbol.description()
	}
}