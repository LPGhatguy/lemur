# Lemur Features
Lemur does not aim to provide full coverage of all Roblox APIs. Coverage progresses as is necessary, though some APIs may prove difficult or impossible to recreate effectively.

This document should remain up-to-date with current API coverage and status.

## Implemented enums
* ConnectionState
* EasingDirection
* EasingStyle
* Font
* Platform
* VirtualInputMode

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
* UDim
	* UDim.new()
	* UDim.new(scale, offset)
	* Addition
	* Equality checks
* UDim2
	* UDim2.new()
	* UDim2.new(xDim, yDim)
	* UDim2.new(xScale, xOffset, yScale, yOffset)
	* UDim2:lerp()
	* Operators: `+`, `==`
* Vector2
	* Vector2.new()
	* Vector2.new(x, y)
	* Operators: `+`

## Implemented Instance Members
* Instance
	* ClassName
	* Name
	* Parent
	* ClearAllChildren()
	* Destroy()
	* FindFirstAncestor(name)
	* FindFirstAncestorOfClass(className)
	* FindFirstChild(name)
	* FindFirstChildOfClass(className)
	* FindFirstChildWhichIsA(className)
	* GetChildren()
	* GetFullName()
	* GetPropertyChangedSignal(key)
	* IsA(className) *(partial)*
	* WaitForChild
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
* ContentProvider
	* ContentProvider.BaseUrl
* CoreGui
* GuiService
* HttpService (requires dkjson installed)
	* JSONEncode(input)
	* JSONDecode(input)
* LocalizationService
* Players
* ReplicatedStorage
* RunService
	* Heartbeat
	* IsStudio
* TestService
	* Error(message)
* TextService
* TweenService
* UserInputService

## Implemented Enums
*None*
