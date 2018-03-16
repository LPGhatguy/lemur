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
* Color3 (stub)
	* Color3.new()
	* Color3.new(r, g, b)
	* Color3.fromRGB(r, g, b)
* Enum
	* Enum:GetEnums()
* EnumItem
	* EnumItem:GetEnumItems()

## Implemented Instance Members
* Instance
	* Parent
	* Name
	* ClassName
	* FindFirstChild(name)
	* GetChildren()
	* IsA(className) (stub)
	* Destroy() (stub)
	* GetPropertyChangedSignal(key)
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

## Implemented Enums
* All Enums until 2018-03-15.
