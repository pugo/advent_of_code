Class {
	#name : 'AoC2024Day12Plot',
	#superclass : 'Object',
	#instVars : [
		'pos',
		'plant',
		'up',
		'right',
		'left',
		'down'
	],
	#category : 'AOC-Utils',
	#package : 'AOC',
	#tag : 'Utils'
}

{ #category : 'accessing' }
AoC2024Day12Plot class >> initializeAt: aPos withPlant: aPlant [
    ^ self new
        initializeAt: aPos withPlant: aPlant. 
]

{ #category : 'accessing' }
AoC2024Day12Plot >> calcRegion: visited [
	| area perimeter todo corners |

	area := 0.
	perimeter := 0.
	corners := 0.
	todo := OrderedCollection with: self.

	[ todo isEmpty ] whileFalse: [ 
		| plot |
		
		plot := todo removeLast.
				
		
		(visited includes: plot) ifFalse: [ 
		corners := corners + plot corners.
			visited add: plot.
			area := area + 1.
			
			plot up
				ifNil: [ 	perimeter := perimeter + 1.	]
				ifNotNil: [ :neighbour |
					neighbour plant = plot plant 
						ifTrue: [ (visited includes: neighbour) ifFalse: [ todo add: neighbour ] ]
						ifFalse: [ perimeter := perimeter + 1 ].			
				].

			plot right
				ifNil: [ 	perimeter := perimeter + 1.	]
				ifNotNil: [ :neighbour |
					neighbour plant = plot plant 
						ifTrue: [ (visited includes: neighbour) ifFalse: [ todo add: neighbour ] ]
						ifFalse: [ perimeter := perimeter + 1 ].			
				].

			plot down
				ifNil: [ 	perimeter := perimeter + 1.	]
				ifNotNil: [ :neighbour |
					neighbour plant = plot plant 
						ifTrue: [ (visited includes: neighbour) ifFalse: [ todo add: neighbour ] ]
						ifFalse: [ perimeter := perimeter + 1 ].			
				].

			plot left
				ifNil: [ 	perimeter := perimeter + 1.	]
				ifNotNil: [ :neighbour |
					neighbour plant = plot plant 
						ifTrue: [ (visited includes: neighbour) ifFalse: [ todo add: neighbour ] ]
						ifFalse: [ perimeter := perimeter + 1 ].			
				].

		].
	].
	^ { area. perimeter . corners }

]

{ #category : 'accessing' }
AoC2024Day12Plot >> corners [
    | upSame downSame leftSame rightSame
      upLeftSame upRightSame downLeftSame downRightSame
      corners |

    upSame := self samePlantAs: up.
    downSame := self samePlantAs: down.
    leftSame := self samePlantAs: left.
    rightSame := self samePlantAs: right.

    upLeftSame := self samePlantAs:
        (up ifNotNil: [ up left ]).

    upRightSame := self samePlantAs:
        (up ifNotNil: [ up right ]).

    downLeftSame := self samePlantAs:
        (down ifNotNil: [ down left ]).

    downRightSame := self samePlantAs:
        (down ifNotNil: [ down right ]).

    corners := 0.

    "Upper left"
    ((upSame not and: [ leftSame not ])
        or: [ upSame and: [ leftSame and: [ upLeftSame not ] ] ])
            ifTrue: [ corners := corners + 1 ].

    "Upper right"
    ((upSame not and: [ rightSame not ])
        or: [ upSame and: [ rightSame and: [ upRightSame not ] ] ])
            ifTrue: [ corners := corners + 1 ].

    "Lower left"
    ((downSame not and: [ leftSame not ])
        or: [ downSame and: [ leftSame and: [ downLeftSame not ] ] ])
            ifTrue: [ corners := corners + 1 ].

    "Lower right"
    ((downSame not and: [ rightSame not ])
        or: [ downSame and: [ rightSame and: [ downRightSame not ] ] ])
            ifTrue: [ corners := corners + 1 ].

    ^ corners

]

{ #category : 'accessing' }
AoC2024Day12Plot >> down [
    ^ down
]

{ #category : 'accessing' }
AoC2024Day12Plot >> down: aDown [
    down := aDown

]

{ #category : 'accessing' }
AoC2024Day12Plot >> initializeAt: aPos withPlant: aPlant [
	pos := aPos.
	plant := aPlant.
		
	up := nil.	
	right := nil.	
	down := nil.	
	left := nil.		

    ^ self
]

{ #category : 'accessing' }
AoC2024Day12Plot >> left [
    ^ left 
]

{ #category : 'accessing' }
AoC2024Day12Plot >> left: aLeft [
    left := aLeft

]

{ #category : 'accessing' }
AoC2024Day12Plot >> plant [
	^ plant.
]

{ #category : 'accessing' }
AoC2024Day12Plot >> pos [
    ^ pos
]

{ #category : 'accessing' }
AoC2024Day12Plot >> printOn: aStream [
    aStream
        nextPutAll: '(';
  			 nextPutAll: pos x asString;	
			 nextPutAll: ', ';
        nextPutAll: pos y asString;
			 nextPutAll: ': ';
        nextPutAll: plant asString;
        nextPutAll: ')'
]

{ #category : 'accessing' }
AoC2024Day12Plot >> right [
    ^ right
]

{ #category : 'accessing' }
AoC2024Day12Plot >> right: aRight [
    right := aRight

]

{ #category : 'accessing' }
AoC2024Day12Plot >> samePlantAs: anotherPlot [
    ^ anotherPlot notNil
        and: [ anotherPlot plant = plant ]
]

{ #category : 'accessing' }
AoC2024Day12Plot >> up [
    ^ up
]

{ #category : 'accessing' }
AoC2024Day12Plot >> up: aUp [
    up := aUp

]

{ #category : 'accessing' }
AoC2024Day12Plot >> visited [
  ^ visited.
]

{ #category : 'accessing' }
AoC2024Day12Plot >> visited: aVisited [
  visited := aVisited.
]
