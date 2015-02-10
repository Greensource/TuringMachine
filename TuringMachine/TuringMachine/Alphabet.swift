//
//  Alphabet.swift
//  TuringMachine
//
//  Created by Pierre DUCHENE on 08/02/2015.
//  Copyright (c) 2015 Greensource. All rights reserved.
//

import Foundation

class Alphabet {
	
	// First element is blank one
	var alphabet : [Symbol] = []
	
	init(blankSymbol : Symbol, alphabet : [Symbol])
	{
		blankSymbol.isBlankSymbol = true;
		self.alphabet = [blankSymbol]
		self.alphabet += alphabet
	}
	
	func blankSymbol() -> Symbol
	{
		return self.alphabet[0]
	}
	
	func description() -> String
	{
		var result: String = ""
		result += "Blank symbol is " + self.alphabet[0].description()
		result += "\nOthers symbol are : "
		
		if (self.alphabet.count > 1)
		{
			result += "\(self.alphabet[1].description())"
		}

		if (self.alphabet.count > 2)
		{
			for index  in 2...(self.alphabet.count-1) {
				result += ", \(self.alphabet[index].description())"
			}
		}
		
		return result
	}
}
