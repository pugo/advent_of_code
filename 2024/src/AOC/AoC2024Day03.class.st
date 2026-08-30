Class {
	#name : 'AoC2024Day03',
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
AoC2024Day03 class >> run [
 | solver input |
    solver := self new.

	 input := AOCInput new day: 3.

    Transcript
        cr;cr;
        show: '2024 Day 3 - by Anders Piniesjö'; cr;
        show: 'Part 1: ';
        show: (solver part1: input); cr;
        show: 'Part 2: ';
        show: (solver part2: input); cr
]

{ #category : 'parsing' }
AoC2024Day03 >> demoData [
	^ 'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))'.

]

{ #category : 'parsing' }
AoC2024Day03 >> parseInput: input [
	
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
AoC2024Day03 >> part1: input [
	|  mul_regex sum catch_regex |
	
	mul_regex := 'mul\((\d{1,3}),(\d{1,3})\)' asRegex.
	catch_regex := 'mul\((\d{1,3}),(\d{1,3})\)' asRegex.
	
	sum := 0.
	
	mul_regex matchesIn: input do: [ :match |
		| a b |
	   catch_regex matches: match.
	
		a := (catch_regex subexpression: 2) asInteger.
		b := (catch_regex subexpression: 3) asInteger.
		sum := sum + (a*b).
		"Transcript show: a*b;cr."
	 ].

	^ sum
]

{ #category : 'parts' }
AoC2024Day03 >> part2: input [
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
