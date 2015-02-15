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
    let blankSymbol: Symbol
	
	init(blankSymbol : Symbol, alphabet : [Symbol])
	{
		self.blankSymbol = blankSymbol;
		self.alphabet = [self.blankSymbol]
		self.alphabet += alphabet
	}
    
    init(blankSymbol : Symbol, otherArray: Array<String>)
    {
        self.blankSymbol = blankSymbol
        alphabet = [self.blankSymbol]
        for string in otherArray
        {
            alphabet.append(Symbol(string: string))
        }
    }
	
    func symbolIsBlank(symbol: Symbol) -> Bool
    {
        return symbol.isEqual(blankSymbol)
    }
    
	func description() -> String
	{
		var result: String = ""
		result += "Blank symbol is " + blankSymbol.description()
		result += "\nOthers symbols are : "
		
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
