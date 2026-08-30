Class {
	#name : 'AoC2024Day02',
	#superclass : 'Object',
	#instVars : [
		'numbers',
		'demo',
		'lines'
	],
	#category : 'AOC',
	#package : 'AOC'
}

{ #category : 'running' }
AoC2024Day02 class >> run [
 | solver input |
    solver := self new.

	 input := AOCInput new day: 2.

    Transcript
        cr;cr;
        show: '2024 Day 2 - by Anders Piniesjö'; cr;
        show: 'Part 1: ';
        show: (solver part1: input); cr;
        show: 'Part 2: ';
        show: (solver part2: input); cr
]

{ #category : 'parts' }
AoC2024Day02 >> analyzeSample: report [
	| increasing diff |

	increasing := (report at: 2) > (report at: 1).
	
	report overlappingPairsDo: [ :a :b |
		(increasing and: [b < a]) ifTrue: [ ^ false ].
		(increasing not and: [b > a]) ifTrue: [ ^ false ].
		diff := (b - a) abs.
		(diff < 1 or: [diff > 3]) ifTrue: [ ^ false ].		
	].
	
	^ true.
]

{ #category : 'parts' }
AoC2024Day02 >> analyzeSampleReduced: report [
	| reduced |

	1 to: report size do: [ :index |
		reduced := report copyWithoutIndex: index. 
		(self analyzeSample: reduced) ifTrue: [ ^ true ].
	].

^ false
]

{ #category : 'parsing' }
AoC2024Day02 >> demoData [
	^ '7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9'.

]

{ #category : 'parsing' }
AoC2024Day02 >> parseInput: input [
	
	| lines numbers  |
	
	lines := input lines.

	numbers :=
    lines collect: [ :line |
        line substrings 
            collect: [ :token | token asInteger ]
    ]. 


   ^ numbers

]

{ #category : 'parts' }
AoC2024Day02 >> part1: input [
	| reports safe |
	
	reports := self parseInput: input.
	safe := 0.
	
	reports do: [ :report | 
		(self analyzeSample: report) ifTrue: [ safe := safe + 1 ]. ].
	
	^safe


]

{ #category : 'parts' }
AoC2024Day02 >> part2: input [
	| reports safe |
	
	reports := self parseInput: input.
	safe := 0.
	
	reports do: [ :report |				
		(self analyzeSample: report) 
			ifTrue: [ safe := safe + 1. ]
			ifFalse: [ 
				(self analyzeSampleReduced: report)
					ifTrue: [ safe := safe + 1. ].
		   ].
		 ].
	
	^ safe


]
