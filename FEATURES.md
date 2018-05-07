# Lemur Features
Lemur does not aim to provide full coverage of all Roblox APIs. Coverage progresses as is necessary, though some APIs may prove difficult or impossible to recreate effectively.

This document should remain up-to-date with current API coverage and status.

## Implemented Enums
- ConnectionState
- EasingDirection
- EasingStyle
- Font
- Platform
- PlaybackState
- ScaleType
- SortOrder
- TextXAlignment
- TextYAlignment
- VirtualInputMode

## Implemented Globals
* require
* script
* spawn (stub)
* tick
* typeof
* wait (stub)
* warn

## Implemented Types
* Color3
	* Color3.new()
	* Color3.new(r, g, b)
	* Color3.fromRGB(r, g, b)
	* Color3.fromHSV(h, s, v)
	* Color3.toHSV(color)
	* Color3:lerp()
	* Operators: `==`
* Rect
	* Rect.new(x, y, width, height)
	* Rect.new(min, max)
	* Operators: `==`
* UDim
	* UDim.new()
	* UDim.new(scale, offset)
	* Operators: `==`, `+`
* UDim2
	* UDim2.new()
	* UDim2.new(xDim, yDim)
	* UDim2.new(xScale, xOffset, yScale, yOffset)
	* UDim2:lerp()
	* Operators: `==`, `+`
* Vector2
	* Vector2.new()
	* Vector2.new(x, y)
	* Operators: `==`, `+`

## Implemented Instance Members
* BindableEvent
	* Fire(...)
* BoolValue, StringValue, IntValue, ObjectValue
	* Value
* Folder
* Frame
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
	* WaitForChild(name)
* LocalScript (stub)
	* Source
* ModuleScript
	* Source
* Script (stub)
	* Source
* ScreenGui
	* DisplayOrder

## Implemented Services
* ContentProvider
	* BaseUrl
* CoreGui
* NotificationService
* GuiService
* HttpService (requires dkjson installed)
	* JSONDecode(input)
	* JSONEncode(input)
* LocalizationService
	* SystemLocaleId
* Players
* ReplicatedStorage
* RunService
	* Heartbeat
	* IsStudio()
* TestService
	* Error(message)
* TextService
* TweenService
* UserInputService