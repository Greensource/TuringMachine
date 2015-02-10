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
	
	init(symbol: String) {
		self.stringSymbol = symbol
		self.isBlankSymbol = false
	}
	
	func description() -> NSString
	{
		return stringSymbol
	}
}