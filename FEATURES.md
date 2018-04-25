# Lemur Features
Lemur does not aim to provide full coverage of all Roblox APIs. Coverage progresses as is necessary, though some APIs may prove difficult or impossible to recreate effectively.

This document should remain up-to-date with current API coverage and status.

## Implemented globals
* require
* script
* spawn (stub)
* tick
* typeof
* wait (stub)
* warn

## Implemented types
* Color3
	* Color3.new()
	* Color3.new(r, g, b)
	* Color3.fromRGB(r, g, b)
	* Color3.fromHSV(h, s, v)
	* Color3.toHSV(color)
	* Color3:lerp()
	* Equality checks (`Color3.new(0, 1, 0) == Color3.new(0, 1, 0) == true`)

## Implemented Instance Members
* Instance
	* Parent
	* Name
	* ClassName
	* FindFirstChild(name)
	* FindFirstChildOfClass(className)
	* FindFirstChildWhichIsA(className)
	* GetChildren()
	* IsA(className) *(partial)*
	* Destroy()
	* GetPropertyChangedSignal(key)
	* GetFullName()
	* ClearAllChildren()
	* FindFirstAncestor(name)
	* FindFirstAncestorOfClass(className)
* Folder
* BindableEvent
	* Fire(...)
* BoolValue, StringValue, IntValue, ObjectValue
	* Value
* ModuleScript
	* Source
* Script (stub)
	* Source
* LocalScript (stub)
	* Source
* Frame

## Implemented Service Members
* ReplicatedStorage
* RunService
	* Heartbeat
* CoreGui
* TestService
	* Error(message)
* HttpService (requires dkjson installed)
	* JSONEncode(input)
	* JSONDecode(input)

## Implemented Enums
*None*
