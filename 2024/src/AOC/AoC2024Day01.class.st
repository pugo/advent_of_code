Class {
	#name : 'AoC2024Day01',
	#superclass : 'Object',
	#instVars : [
		'numbers',
		'demo',
		'lines'
	],
	#category : 'AOC-Days',
	#package : 'AOC',
	#tag : 'Days'
}

{ #category : 'execution' }
AoC2024Day01 class >> run [
 | solver input |
    solver := self new.

	 input := AOCInput new day: 1.

    Transcript
        cr;cr;
        show: '2024 Day 1 - by Anders Piniesjö'; cr;
        show: 'Part 1: ';
        show: (solver part1: input); cr;
        show: 'Part 2: ';
        show: (solver part2: input); cr
]

{ #category : 'parsing' }
AoC2024Day01 >> demoData [
	^ '3   4
4   3
2   5
1   3
3   9
3   3'.

]

{ #category : 'parsing' }
AoC2024Day01 >> parseInput: input [
	
	| numbers lines |
	
	lines := input lines.

	numbers :=
    lines collect: [ :line |
        line substrings 
            collect: [ :token | token asInteger ]
    ]. 

	^ {(numbers collect: #first) sorted. 
		(numbers collect: #second) sorted}
]

{ #category : 'parts' }
AoC2024Day01 >> part1: input [
	| cols left right distances |
	
	cols := self parseInput: input.
	left := cols first.
	right := cols second. 

	distances := left with: right collect: [ :a :b | (a - b) abs].

   ^ distances sum


]

{ #category : 'parts' }
AoC2024Day01 >> part2: input [
	| cols left right score counts|
	
	cols := self parseInput: input.
	left := cols first.
	right := cols second. 

	counts := Dictionary new. 
	
	right do: [ :item | counts at: item update: [ :old | old + 1 ] initial: [ 1 ] ].

	score := left collect: [ :a | a * (counts at: a ifAbsent: 0)].

   ^ score sum


]

{ #category : 'execution' }
AoC2024Day01 >> run [
	^ self class run
]
