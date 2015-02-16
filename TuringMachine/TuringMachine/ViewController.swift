//
//  ViewController.swift
//  TuringMachine
//
//  Created by Pierre DUCHENE on 08/02/2015.
//  Copyright (c) 2015 Greensource. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBAction func retryAction(sender: AnyObject) {
		self.createAndExecuteAlan()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		self.createAndExecuteAlan()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func createAndExecuteAlan() {
		DataManager.extractMachineFromJSONWithSuccess("WikiExample", success: { (data) -> Void in
			let json = JSON(data: data)
			var alphabetJson = json["alphabet"]
			var transitionsJson = json["transitions"]
			var statesJson = json["states"]
			
			let blankSymbolString = alphabetJson["blank"].stringValue
			let blankSymbol = Symbol(string: blankSymbolString)
			var symbols: Array<String> = []
			for (key: String, subJson: JSON) in alphabetJson["symbols"] {
				symbols.insert(subJson.stringValue, atIndex: 0);
			}
			var alphabet : Alphabet = Alphabet(blankSymbol: blankSymbol, otherArray: symbols)
			
			
			var tape = Tape(blankSymbol: blankSymbol, stringTape: "11")
			
			
		})
		
		
		var blankSymbol : Symbol = Symbol(string: "0")
		var oneSymbol : Symbol = Symbol(string: "1")
		
		var others: [Symbol] = [oneSymbol]
		var alphabet : Alphabet = Alphabet(blankSymbol: blankSymbol, alphabet: others)
		
		println(alphabet.description())
		
		var tape = Tape(blankSymbol: blankSymbol, stringTape: "11")
		var state1 = State(identifier: "s1")
		var state2 = State(identifier: "s2")
		var state3 = State(identifier: "s3")
		var state4 = State(identifier: "s4")
		var state5 = State(identifier: "s5")
		var stop = State(identifier: "stop"); stop.isStop = true
		
		// wikipedia example:
		var arret = Transition(description: "|s1|0|0|Right|stop|")
		var e12 = Transition(description: "|s1|1|0|Right|s2|")
		
		var e21 = Transition(description: "|s2|1|1|Right|s2|")
		var e22 = Transition(description: "|s2|0|0|Right|s3|")
		var e31 = Transition(oldState: state3, readSymbol: oneSymbol, writeSymbol: oneSymbol, movement: Movement.Right, final: state3)
		var e32 = Transition(oldState: state3, readSymbol: blankSymbol, writeSymbol: oneSymbol, movement: Movement.Left, final: state4)
		var e41 = Transition(oldState: state4, readSymbol: oneSymbol, writeSymbol: oneSymbol, movement: Movement.Left, final: state4)
		var e42 = Transition(oldState: state4, readSymbol: blankSymbol, writeSymbol: blankSymbol, movement: Movement.Left, final: state5)
		var e51 = Transition(oldState: state5, readSymbol: oneSymbol, writeSymbol: oneSymbol, movement: Movement.Left, final: state5)
		var e52 = Transition(oldState: state5, readSymbol: blankSymbol, writeSymbol: oneSymbol, movement: Movement.Right, final: state1)
		
		println("Initial tape : \(tape.fullDescription())")
		var alan = TuringMachine(tape: tape,initialState: state1, transitions: [arret,e12,e21,e22,e31,e32,e41,e42,e51,e52])
		alan.execute()
		
		println("Final tape : \(tape.fullDescriptionWithoutHighlight())")
	}
	
}

