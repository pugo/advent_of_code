Class {
	#name : 'AoCNode',
	#superclass : 'Object',
	#instVars : [
		'value',
		'next',
		'previous'
	],
	#category : 'AOC',
	#package : 'AOC'
}

{ #category : 'instance creation' }
AoCNode class >> value: anObject [
    ^ self new
        value: anObject;
        yourself
]

{ #category : 'evaluating' }
AoCNode >> insertAfter: newNode [
	"Insert newNode after this node."
    newNode previous: self.
    newNode next: next.

    next ifNotNil: [
        next previous: newNode
    ].

    next := newNode.

    ^ newNode
]

{ #category : 'evaluating' }
AoCNode >> insertBefore: newNode [
	"Insert newNode before this node."
    newNode next: self.
    newNode previous: previous.

    previous ifNotNil: [
        previous next: newNode
    ].

    previous := newNode.

    ^ newNode
]

{ #category : 'evaluating' }
AoCNode >> next [
    ^ next
]

{ #category : 'evaluating' }
AoCNode >> next: aNode [
    next := aNode
]

{ #category : 'evaluating' }
AoCNode >> previous [
    ^ previous

]

{ #category : 'evaluating' }
AoCNode >> previous: aNode [
    previous := aNode
]

{ #category : 'evaluating' }
AoCNode >> remove [
    previous ifNotNil: [
        previous next: next
    ].

    next ifNotNil: [
        next previous: previous
    ].

    previous := nil.
    next := nil.

    ^ self
]

{ #category : 'evaluating' }
AoCNode >> removeFromCircle [
    previous next: next.
    next previous: previous.

    next := self.
    previous := self.
]

{ #category : 'evaluating' }
AoCNode >> value [
    ^ value

]

{ #category : 'evaluating' }
AoCNode >> value: anObject [
    value := anObject

]
