//
//  Symbol.swift
//  TuringMachine
//
//  Created by Pierre DUCHENE on 09/02/2015.
//  Copyright (c) 2015 Greensource. All rights reserved.
//

import Foundation

class Symbol {
	
	var stringSymbol : String = ""
	var isBlankSymbol : Bool = false
	
	init(string: String) {
		self.stringSymbol = string
		self.isBlankSymbol = false
	}
	
	init(newSymbol: Symbol)
	{
		self.stringSymbol = newSymbol.stringSymbol;
		self.isBlankSymbol = newSymbol.isBlankSymbol;
	}
	
	func description() -> NSString
	{
		return stringSymbol
	}
}