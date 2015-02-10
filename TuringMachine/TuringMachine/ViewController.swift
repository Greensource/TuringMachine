//
//  ViewController.swift
//  TuringMachine
//
//  Created by Pierre DUCHENE on 08/02/2015.
//  Copyright (c) 2015 Greensource. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		var blankSymbol : Symbol = Symbol(symbol: "0")
		var others: [Symbol] = [Symbol(symbol: "1")]
		var alphabet : Alphabet = Alphabet(blankSymbol: blankSymbol, alphabet: others)
		
		println(alphabet.description())
		
		for symbol in alphabet.alphabet
		{
			if (symbol.isBlankSymbol)
			{
				println("symbol \(symbol.description()) is blank")
			}
			else
			{
				println("symbol \(symbol.description()) is not blank")
			}
		}
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

