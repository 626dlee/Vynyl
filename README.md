
# Vynyl
Vynyl coding exercise by David Lee
>### The Prompt
> Write some code to flatten an array of arbitrarily nested arrays of strings into a flat array of strings (e.g., [['one','two',['three']],'four'] -> ['one','two','three','four'].
# THE CODE
The code to flatten the array is located in `Vynyl/DavidLee_Vynyl/ArrayFlattener.swift`

```
func flattenArray(_ arr: [Any]) -> [String] {

	// array structure that we use to hold data to be returned
	var flattened: [String] = []
	
	// loop through input
	for element in arr {
	
		// current element is the desired data type
		if let element = element as? String {
		
			// append to answer if it is correct data type
			flattened.append(element)
		}
		
		// current element is an array and needs to be broken down
		if let element = element as? [Any] {
		
			// recursive call to flattenArray to flatten the current array
			let subElements = flattenArray(element)
			
			// append subelements to the answer
			for subElement in subElements {
				flattened.append(subElement)
			}
		}
	}
return flattened
}
```
This function is where all the logic resides to flatten arbitrarily nested arrays of `Strings`.

A for-loop is used to iterate through the first layer of the input array and for each element of the array, we will check to see if it is the correct data type that we are looking for: `String`.
```
if let element = element as? String {	
	// append to answer if it is correct data type
	flattened.append(element)
}
```
If the current element is a valid `String`, then we will append that element to our existing array `flattened`.
```
// current element is an array and needs to be broken down
if let element = element as? [Any] {
		
// recursive call to flattenArray to flatten the current array
	let subElements = flattenArray(element)
			
	// append subelements to the answer
	for subElement in subElements {
		flattened.append(subElement)
	}
}
```
We check to see if the current element is an array, in which case needs to be broken down further into `subElements`. We break these arrays down with a recursive call to `flattenArray` which will return an array of the `subElements`.  Then, we will append each `subElement` to our `flattened` array.

> Note:
> Nested arrays that are inside `subElements` will be further broken down in its own recursive `flattenArray` call

# THE TESTS
The code to test the flattenArray function is located in `Vynyl/DavidLee_VynylTests/DavidLee_VynylTests.swift`

```
private  var arrayFlattener: ArrayFlattener!
override func setUp() {
	super.setUp()
	arrayFlattener = ArrayFlattener()
}
```
This code block is where an ArrayFlattener instance is initialized, whose function `flattenArray` we will be testing.

```
func testExample() throws {
	// Use XCTAssert and related functions to verify your tests produce the correct results.
	let data1: [Any] = [["one", "two", ["three"]], "four"]
	let data2: [Any] = ["one", ["two", ["three"], []], [["four"]]]
	let data3: [Any] = [] // tests empty array edge case
	let data4: [Any] = [[["one","two"], 3, ["three"]], "four"] // tests ignoring non-string element edge case
	
	XCTAssertEqual(arrayFlattener.flattenArray(data1), ["one", "two", "three", "four"])
	XCTAssertEqual(arrayFlattener.flattenArray(data2), ["one", "two", "three", "four"])
	XCTAssertEqual(arrayFlattener.flattenArray(data3), [])
	XCTAssertEqual(arrayFlattener.flattenArray(data4), ["one", "two", "three", "four"])
}
```
This function is where we test our `flattenArray` function with a few arbitrarily nested arrays of strings against their expected outputs.

1. **data1** contains the original input included in the prompt. 
	- Input: `[["one", "two", ["three"]], "four"]`
	- Expected Output: `["one", "two", "three", "four"]`
2. **data2** contains a variation of the original input; the four main elements are nested in a different arbitrary manner.
	- Input: `["one", ["two", ["three"], []], [["four"]]]`
	- Expected Output: `["one", "two", "three", "four"]`
3. **data3** contains an empty array to test the way it is handled (edge case)
	- Input: `[]`
	- Expected Output: `[]`
		- We expect an empty array to return an empty array when it is flattened
4. **data4** contains an arbitrarily nested array, with an element being an `Int` instead of `String`
	- Input: `[[["one","two"], 3, ["three"]], "four"]`
	- Expected Output: `["one", "two", "three", "four"]`
		- We want the program to flatten nested arrays of `Strings` and therefore any other data types should be ignored
