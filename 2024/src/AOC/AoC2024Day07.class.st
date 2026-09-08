Class {
	#name : 'AoC2024Day07',
	#superclass : 'Object',
	#instVars : [
		'inputData'
	],
	#category : 'AOC-Days',
	#package : 'AOC',
	#tag : 'Days'
}

{ #category : 'parsing' }
AoC2024Day07 class >> demoData [
	^ '190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20'.

]

{ #category : 'as yet unclassified' }
AoC2024Day07 class >> on: input [
	^ self new
		inputData: input lines asArray;
		yourself

]

{ #category : 'parts' }
AoC2024Day07 >> calcEquationSetup3: setup parts: parts [

	| gaps sum state |

	gaps := parts size - 1.
	sum := parts first.

	state := setup.

	(gaps - 1) to: 0 by: -1 do: [ :g | 
		  | val op |
			"Transcript show: g; show: ', '; show: (gaps - g + 1); show: ', '; show: 2**g;  cr ."
			val := parts at: (gaps - g + 1).
			
			op := state \\ 3.
			state := state // 3.
			
			op = 0 ifTrue: [ sum := sum * val. ].
			op = 1 ifTrue: [ sum := sum + val. ].
			op = 2 ifTrue: [ sum := ((sum asString), (val asString)) asInteger ].
	].

	^ sum.



]

{ #category : 'parts' }
AoC2024Day07 >> calcEquationSetup: setup parts: parts [

	| gaps sum |

	gaps := parts size - 1.
	sum := parts first.

	(gaps - 1) to: 0 by: -1 do: [ :g | 
		  | op |
			"Transcript show: g; show: ', '; show: (gaps - g + 1); show: ', '; show: 2**g;  cr ."
			op := parts at: (gaps - g + 1).
			(setup bitAnd: (2**g)) ~= 0
				ifTrue: [ sum := sum * op. ]
				ifFalse: [ sum := sum + op. ].
	].

	^ sum.



]

{ #category : 'accessing' }
AoC2024Day07 >> inputData [
   ^ inputData
]

{ #category : 'accessing' }
AoC2024Day07 >> inputData: data [
    inputData := data
]

{ #category : 'parts' }
AoC2024Day07 >> parseInputData [

	^ inputData collect: [ :row |
			| s val numbers |
			s := row splitOn: $:.
			val := s first asInteger.
			numbers := s second substrings collect: [ :i | i asInteger ].
			
			{val . numbers}.
		].

]

{ #category : 'parts' }
AoC2024Day07 >> part1 [

	| equations sum |

	equations := self parseInputData.
	sum := 0.

	equations do: [ :eq |
				sum := sum + (self solveEquation: eq)
		 ].

	^ sum.
]

{ #category : 'parts' }
AoC2024Day07 >> part2 [

	| equations sum |

	equations := self parseInputData.
	sum := 0.

	equations do: [ :eq |
				sum := sum + (self solveEquation3: eq)
		 ].

	^ sum.
]

{ #category : 'running' }
AoC2024Day07 >> run [
	Transcript
   		cr;cr;
      show: '2024 Day 7 - by Anders Piniesjö'; cr;
      show: 'Part 1: ';
      show: self part1; cr;
      show: 'Part 2: ';
      show: self part2; cr.
]

{ #category : 'parts' }
AoC2024Day07 >> solveEquation3: equation [

	| value parts gaps |

	value := equation first.
	parts := equation second.
	gaps := parts size - 1.

	"Transcript show: 'parts: '; show: parts printString; show: ', gaps: '; show: gaps; cr."

	0 to: ((3**gaps) - 1) do: [ :x |
			(self calcEquationSetup3: x parts: parts) = value ifTrue: [ ^ value ].
		 ].

	^ 0.
]

{ #category : 'parts' }
AoC2024Day07 >> solveEquation: equation [

	| value parts gaps |

	value := equation first.
	parts := equation second.
	gaps := parts size - 1.

	"Transcript show: 'parts: '; show: parts printString; show: ', gaps: '; show: gaps; cr."

	0 to: ((2**gaps) - 1) do: [ :x |
			(self calcEquationSetup: x parts: parts) = value ifTrue: [ ^ value ].
		 ].

	^ 0.
]
