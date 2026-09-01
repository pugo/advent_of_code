Class {
	#name : 'AoC2024Day04',
	#superclass : 'Object',
	#instVars : [
		'grid'
	],
	#category : 'AOC',
	#package : 'AOC'
}

{ #category : 'parsing' }
AoC2024Day04 class >> demoData [
	^ 'MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX'.

]

{ #category : 'as yet unclassified' }
AoC2024Day04 class >> on: input [
	^ self new
		grid: input lines;
		yourself

]

{ #category : 'parts' }
AoC2024Day04 >> checkGridChar: c x: x y: y [
	^ ((grid at: y) at: x) = c

]

{ #category : 'parts' }
AoC2024Day04 >> findMas: pos [
   (
		 (((self checkGridChar: $M x: (pos x - 1) y: (pos y - 1)) & 
	      (self checkGridChar: $S x: (pos x + 1) y: (pos y + 1))) |
	
	     ((self checkGridChar: $S x: (pos x - 1) y: (pos y - 1)) & 
		   (self checkGridChar: $M x: (pos x + 1) y: (pos y + 1))))
		 &

		 (((self checkGridChar: $M x: (pos x + 1) y: (pos y - 1)) & 
	      (self checkGridChar: $S x: (pos x - 1) y: (pos y + 1))) |
	
	     ((self checkGridChar: $S x: (pos x + 1) y: (pos y - 1)) & 
		   (self checkGridChar: $M x: (pos x - 1) y: (pos y + 1))))
	) ifTrue: [ ^1 ].
		
^ 0.
		

	

]

{ #category : 'parts' }
AoC2024Day04 >> findXmas: pos [
	| result |
	result := 0.
	
	(self findXmasDir: pos x: 1   y: 0) ifTrue: [ result := result+1. ].
	(self findXmasDir: pos x: 1   y: 1) ifTrue: [ result := result+1. ].
	(self findXmasDir: pos x: 0   y: 1) ifTrue: [ result := result+1. ].
	(self findXmasDir: pos x: -1  y: 1) ifTrue: [ result := result+1. ].
	(self findXmasDir: pos x: -1  y: 0) ifTrue: [ result := result+1. ].
	(self findXmasDir: pos x: -1  y: -1) ifTrue: [ result := result+1. ].
	(self findXmasDir: pos x: 0   y: -1) ifTrue: [ result := result+1. ].
	(self findXmasDir: pos x: 1   y: -1) ifTrue: [ result := result+1. ].	
	
	^ result .
]

{ #category : 'parts' }
AoC2024Day04 >> findXmasDir: pos x: xdir y: ydir [
	| height width |
	
	height := grid size.
	width := grid first size.
	
		1 to: 3 do: [ :i |
			| xx yy |
			xx := pos x + (i * xdir).
			yy := pos y + (i * ydir).
			
			((xx <= 0) | (xx > width) | (yy <= 0) | (yy > height)) ifTrue: [ ^ false ].
			('XMAS' at: (i+1)) = ((grid at: yy) at: xx) ifFalse: [ ^ false ].
		].

	^ true.
]

{ #category : 'accessing' }
AoC2024Day04 >> grid [
    ^ grid
]

{ #category : 'accessing' }
AoC2024Day04 >> grid: aGrid [
    grid := aGrid
]

{ #category : 'parts' }
AoC2024Day04 >> part1 [
	|  result height |

	result := 0.
	height := grid size.
	
	grid withIndexDo: [ :line :y | 
		line withIndexDo: [ :c :x |
			c = $X ifTrue: [ 
				result := result + (self findXmas: x@y).
			].			
		].
	].
	
	^ result.	
]

{ #category : 'parts' }
AoC2024Day04 >> part2 [
	|  result height width |

	result := 0.

	height := grid size.
	width := grid first size.
	
	2 to: (height - 1) do: [ :y |
		| line |
		line := grid at: y.

		2 to: (width - 1) do: [ :x |
			| c |
			c := line at: x.

			c = $A ifTrue: [ 
				result := result + (self findMas: x@y).
			].			
		].
	].
	
	^ result.	
]

{ #category : 'running' }
AoC2024Day04 >> run [
	Transcript
   		cr;cr;
      show: '2024 Day 4 - by Anders Piniesjö'; cr;
      show: 'Part 1: ';
      show: self part1; cr;
      show: 'Part 2: ';
      show: self part2; cr.
]
