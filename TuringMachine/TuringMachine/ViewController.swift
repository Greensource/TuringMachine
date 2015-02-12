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
		
		var blankSymbol : Symbol = Symbol(string: "0")
		var oneSymbol : Symbol = Symbol(string: "1")

		var others: [Symbol] = [oneSymbol]
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
		
		var tape = Tape(alphabet: alphabet)
		var state1 = State(identifier: "s1")
		var state2 = State(identifier: "s2")
		var state3 = State(identifier: "s3")
		var stop = State(identifier: "stop"); stop.isStop = true
		
		var entry1 = Transition(initial: state1, read: oneSymbol, write: blankSymbol, final: state1)
		var entry2 = Transition(initial: state1, read: blankSymbol, write: blankSymbol, final: stop)

		println(tape.fullDescription())
		tape.previousCell()
		tape.previousCell()
		tape.writeCurrentCell(oneSymbol)
		tape.nextCell()
		tape.writeCurrentCell(oneSymbol)
		tape.nextCell()
		tape.writeCurrentCell(oneSymbol)
		tape.nextCell()
		println(tape.fullDescription())
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

