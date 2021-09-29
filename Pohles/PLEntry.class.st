Class {
	#name : #PLEntry,
	#superclass : #Object,
	#instVars : [
		'name',
		'email',
		'slot',
		'count'
	],
	#category : #Pohles
}

{ #category : #'as yet unclassified' }
PLEntry class >> name: aName email: anEmail slot: aSlot count: aCount [
	^self new
		name: aName;
		email: anEmail;
		slot: aSlot;
		count: aCount;
		yourself
]

{ #category : #accessing }
PLEntry >> count [

	^ count
]

{ #category : #accessing }
PLEntry >> count: anObject [

	count := anObject
]

{ #category : #accessing }
PLEntry >> email [

	^ email
]

{ #category : #accessing }
PLEntry >> email: anObject [

	email := anObject
]

{ #category : #accessing }
PLEntry >> name [

	^ name
]

{ #category : #accessing }
PLEntry >> name: anObject [

	name := anObject
]

{ #category : #accessing }
PLEntry >> slot [

	^ slot
]

{ #category : #accessing }
PLEntry >> slot: anObject [

	slot := anObject
]
