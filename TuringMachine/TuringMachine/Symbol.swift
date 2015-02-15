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
	
	init(string: String) {
		self.stringSymbol = string
	}
	
	init(newSymbol: Symbol)
	{
		self.stringSymbol = newSymbol.stringSymbol;
	}
	
	func isEqual(otherSymbol: Symbol) -> Bool
	{
		return self.stringSymbol == otherSymbol.stringSymbol
	}
	
	func description() -> NSString
	{
		return stringSymbol
	}
}