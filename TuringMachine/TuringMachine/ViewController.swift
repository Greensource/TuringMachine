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
		
		var tape = Tape(blankSymbol: blankSymbol, stringTape: "1111111111")
		var state1 = State(identifier: "s1")
		var state2 = State(identifier: "s2")
		var state3 = State(identifier: "s3")
		var state4 = State(identifier: "s4")
		var state5 = State(identifier: "s5")
		var stop = State(identifier: "stop"); stop.isStop = true
		/*
        var item10 = TransitionItem(readSymbol: oneSymbol, writeSymbol: blankSymbol, movement: Movement.Right, final: state1)
        var item11 = TransitionItem(readSymbol: blankSymbol, writeSymbol: blankSymbol, movement: Movement.Right, final: state2)

		var t1 = Transition(initialState: state1, items: [item10,item11])
        
        var item20 = TransitionItem(readSymbol: blankSymbol, writeSymbol: blankSymbol, movement: Movement.Right, final: stop)
		var t2 = Transition(initialState: state2, items: [item20])
		*/
		// wikipedia example:
		var arret = TransitionItem(readSymbol: blankSymbol, writeSymbol: blankSymbol, movement: Movement.Right, final: stop)
		var e12 = TransitionItem(readSymbol: oneSymbol, writeSymbol: blankSymbol, movement: Movement.Right, final: state2)
		var e21 = TransitionItem(readSymbol: oneSymbol, writeSymbol: oneSymbol, movement: Movement.Right, final: state2)
		var e22 = TransitionItem(readSymbol: blankSymbol, writeSymbol: blankSymbol, movement: Movement.Right, final: state3)
		var e31 = TransitionItem(readSymbol: oneSymbol, writeSymbol: oneSymbol, movement: Movement.Right, final: state3)
		var e32 = TransitionItem(readSymbol: blankSymbol, writeSymbol: oneSymbol, movement: Movement.Left, final: state4)
		var e41 = TransitionItem(readSymbol: oneSymbol, writeSymbol: oneSymbol, movement: Movement.Left, final: state4)
		var e42 = TransitionItem(readSymbol: blankSymbol, writeSymbol: blankSymbol, movement: Movement.Left, final: state5)
		var e51 = TransitionItem(readSymbol: oneSymbol, writeSymbol: oneSymbol, movement: Movement.Left, final: state5)
		var e52 = TransitionItem(readSymbol: blankSymbol, writeSymbol: oneSymbol, movement: Movement.Right, final: state1)

		var w1 = Transition(initialState: state1, items: [arret,e12])
		var w2 = Transition(initialState: state2, items: [e21,e22])
		var w3 = Transition(initialState: state3, items: [e31,e32])
		var w4 = Transition(initialState: state4, items: [e41,e42])
		var w5 = Transition(initialState: state5, items: [e51,e52])

        println("Initial tape : \(tape.fullDescription())")
		var allan = TuringMachine(tape: tape, transitions: [w1,w2,w3,w4,w5])
        allan.execute()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

