Class {
	#name : 'AoC2024Day11',
	#superclass : 'Object',
	#instVars : [
		'inputData',
		'grid',
		'endpoints'
	],
	#category : 'AOC-Days',
	#package : 'AOC',
	#tag : 'Days'
}

{ #category : 'parsing' }
AoC2024Day11 class >> demoData [
	^ '125 17'.

]

{ #category : 'as yet unclassified' }
AoC2024Day11 class >> on: input [
	| numbers |

	numbers := input substrings asArray
    collect: [ :c | c asString asInteger ].

	^ self new
		inputData: numbers;
		yourself

]

{ #category : 'accessing' }
AoC2024Day11 >> blink: state [
	| next |

	next := Dictionary new.

	state keysAndValuesDo: [ :number :count | 
				number = 0 
					ifTrue: [ 
						next at: 1 put: ((next at: 1 ifAbsent: [ 0 ]) + count)
					]
					ifFalse: [ 
						| text |
						
						text := number asString.
						
						text size even 
							ifTrue: [ 
								| half left right |
								half := text size // 2.
								left := (text copyFrom: 1 to: half) asInteger.
								right := (text copyFrom: half+1 to: text size) asInteger.
								
								next at: left put: ((next at: left ifAbsent: [ 0 ]) + count).
								next at: right put: ((next at: right ifAbsent: [ 0 ]) + count).
							]
							ifFalse: [ 
								next at: number*2024 put: ((next at: number*2024 ifAbsent: [ 0 ]) + count).
							]
					]
		 ].

	

    ^ next.
]

{ #category : 'accessing' }
AoC2024Day11 >> inputData [
   ^ inputData
]

{ #category : 'accessing' }
AoC2024Day11 >> inputData: data [
    inputData := data
]

{ #category : 'parts' }
AoC2024Day11 >> part1 [
	| state sum |
	
	
	state := Dictionary new.

	inputData do: [ :nr |
	    state
	        at: nr
	        put: ((state at: nr ifAbsent: [ 0 ]) + 1)
	].
	
	1 to: 25 do: [ :i | state := self blink: state. ].
		
	Transcript show: state printString; cr.

	
	sum := 0.
	state keysAndValuesDo: [ :number :count | 
			sum := sum + count.
		].
	
	Transcript show: 'Len: '; show: state sum; cr.

	^ sum.
]

{ #category : 'parts' }
AoC2024Day11 >> part2 [
	| state sum |
	
	
	state := Dictionary new.

	inputData do: [ :nr |
	    state
	        at: nr
	        put: ((state at: nr ifAbsent: [ 0 ]) + 1)
	].
	
	1 to: 75 do: [ :i | state := self blink: state. ].
		
	Transcript show: state printString; cr.

	
	sum := 0.
	state keysAndValuesDo: [ :number :count | 
			sum := sum + count.
		].
	
	Transcript show: 'Len: '; show: state sum; cr.

	^ sum.
]

{ #category : 'running' }
AoC2024Day11 >> run [
	Transcript
   		cr;cr;
      show: '2024 Day 11 - by Anders Piniesjö'; cr;
      show: 'Part 1: ';
      show: self part1; cr;
      show: 'Part 2: ';
      show: self part2; cr.
]
