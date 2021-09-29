Class {
	#name : #PLLogic,
	#superclass : #Object,
	#instVars : [
		'db'
	],
	#category : #Pohles
}

{ #category : #adding }
PLLogic >> addEntry: anEntry [
	db ifNil: [ ^self ].
	db execute: 'INSERT INTO entries(name,email,slot,count) VALUES (:name, :email, :slot, :count);' with: { 
	':name' -> anEntry name.
	':email' -> anEntry email.
	':slot' -> anEntry slot.
	':count' -> anEntry count.
	} asDictionary.
]

{ #category : #'as yet unclassified' }
PLLogic >> closeConnection [
	db ifNotNil: [db isOpen ifTrue: [ db close. db := nil ]].
]

{ #category : #'as yet unclassified' }
PLLogic >> listEntries [
	| cursor |
	db ifNil: [ ^nil ].
	cursor := db execute: 'SELECT * FROM entries;'.
	^cursor rows
]

{ #category : #accessing }
PLLogic >> maxCount [
	^ 20
]

{ #category : #'as yet unclassified' }
PLLogic >> reconnect: aString [
	db ifNotNil: [db isOpen ifTrue: [ db close. db := nil ]].
	db ifNil: [ db := SQLite3Connection on: (Smalltalk imageDirectory / aString) fullName ].
	db open.
	db execute: 'CREATE TABLE IF NOT EXISTS entries(
		id INTEGER PRIMARY KEY AUTOINCREMENT,
		name TEXT NOT NULL,
		email TEXT NOT NULL,
		slot INTEGER NOT NULL,
		count INTEGER NOT NULL
	);'.
]
