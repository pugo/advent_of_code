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
        show: (solver part2: input); cr.
]

{ #category : 'parsing' }
AoC2024Day03 >> demoData [
	^ 'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))'.

]

{ #category : 'parsing' }
AoC2024Day03 >> demoData2 [
   ^ 'xmul(2,4)&mul[3,7]!^don''t()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))'
]

{ #category : 'parts' }
AoC2024Day03 >> mul: mulstr [
	|  catch_regex a b |

	catch_regex := 'mul\((\d{1,3}),(\d{1,3})\)' asRegex.
   catch_regex matches: mulstr.
	
	a := (catch_regex subexpression: 2) asInteger.
	b := (catch_regex subexpression: 3) asInteger.

	^ a * b.
]

{ #category : 'parts' }
AoC2024Day03 >> part1: input [
	|  mul_regex sum |
	
	mul_regex := 'mul\((\d{1,3}),(\d{1,3})\)' asRegex.
	
	sum := 0.
	
	mul_regex matchesIn: input do: [ :instruction |
		sum := sum + (self mul: instruction).
	].

	^ sum
]

{ #category : 'parts' }
AoC2024Day03 >> part2: input [
	|  mul_regex sum catch_regex enabled |
	
	mul_regex := 'mul\((\d{1,3},\d{1,3})\)|do\(\)|don''t\(\)' asRegex.
	
	sum := 0.
	enabled := true.
	
	mul_regex matchesIn: input do: [ :instruction |
		instruction = 'do()' 
			ifTrue: [ enabled := true. ].

		instruction = 'don''t()' 
			ifTrue: [ enabled := false. ].

		(instruction beginsWith: 'mul(')
			ifTrue: [ 
				enabled ifTrue: [ 
					sum := sum + (self mul: instruction).
				]
			].
	 ].

	^ sum
]
