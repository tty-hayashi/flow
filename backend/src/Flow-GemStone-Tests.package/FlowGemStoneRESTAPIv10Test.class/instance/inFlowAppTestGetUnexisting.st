other
inFlowAppTestGetUnexisting
  | anId apiResponse |
  anId := UUID new asString.
  self do: [ self assert: (Thing findId: anId) isNil ].
  apiResponse := ZnEasy get: self apiUrl , '/things/' , anId.
  self assert: apiResponse code = 404.
  self assert: ('*' , anId , '*' match: apiResponse contents).
  System abortTransaction