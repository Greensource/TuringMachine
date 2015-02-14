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
		
		var tape = Tape(alphabet: alphabet)
		var state1 = State(identifier: "s1")
		var state2 = State(identifier: "s2")
		var state3 = State(identifier: "s3")
		var stop = State(identifier: "stop"); stop.isStop = true
		
        var item10 = TransitionItem(readSymbol: oneSymbol, writeSymbol: blankSymbol, movement: Movement.Right, final: state1)
        var item11 = TransitionItem(readSymbol: blankSymbol, writeSymbol: blankSymbol, movement: Movement.Right, final: state2)

		var t1 = Transition(initialState: state1, items: [item10,item11])
        
        var item20 = TransitionItem(readSymbol: blankSymbol, writeSymbol: blankSymbol, movement: Movement.Right, final: stop)
		var t2 = Transition(initialState: state2, items: [item20])

        println("item20 : \(item20.description())")

        
        
        tape.previousCell()
        tape.previousCell()
        tape.writeCurrentCell(oneSymbol)
        tape.nextCell()
        tape.writeCurrentCell(oneSymbol)
        tape.nextCell()
        tape.writeCurrentCell(oneSymbol)
        tape.nextCell()
        
        tape.previousCell()
        tape.previousCell()
        tape.previousCell()


        println("Initial tape : \(tape.fullDescription())")
        println("Execute Erasor machine")
		var allan = TuringMachine(tape: tape, transitions: [t1,t2])
        allan.execute()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

