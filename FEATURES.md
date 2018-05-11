# Lemur Features
Lemur does not aim to provide full coverage of all Roblox APIs. Coverage progresses as is necessary, though some APIs may prove difficult or impossible to recreate effectively.

This document should remain up-to-date with current API coverage and status.

## Implemented Enums
- ConnectionState
- EasingDirection
- EasingStyle
- Font
- HorizontalAlignment
- Platform
- PlaybackState
- ScaleType
- SizeConstraint
- SortOrder
- TextXAlignment
- TextYAlignment
- ThumbnailSize
- ThumbnailType
- VerticalAlignment
- VirtualInputMode

## Implemented Globals
* require
* script
* settings
	* Rendering
		* QualityLevel
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
* AnalyticsService
* BindableEvent
	* Fire(...)
* BoolValue, StringValue, IntValue, ObjectValue
	* Value
* Folder
* Frame
* GuiObject
	* AbsoluteSize
	* Active
	* AnchorPoint
	* AutoButtonColor
	* BackgroundColor3
	* BackgroundTransparency
	* BorderSizePixel
	* ClipsDescendants
	* Frame
	* InputBegan
	* InputEnded
	* LayoutOrder
	* Position
	* Size
	* SizeConstraint
	* Visible
* ImageButton
	* Image
	* ImageColor3
	* ScaleType
	* SliceCenter
* ImageLabel
	* Image
	* ImageColor3
	* ScaleType
	* SliceCenter
* Instance
	* AncestryChanged
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
	* IsA(className)
	* WaitForChild(name)
* LocalScript (stub)
	* Source
* ModuleScript
	* Source
* Script (stub)
	* Source
* ScreenGui
	* AbsoluteSize
	* DisplayOrder
* UIGridStyleLayout
	* HorizontalAlignment
	* SortOrder
	* VerticalAlignment
* UIListLayout
	* Padding

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
* LocalizationTable
* Players
	* LocalPlayer
		* UserId
* ReplicatedStorage
* RunService
	* Heartbeat
	* RenderStepped
	* IsStudio()
* Stats
* TestService
	* Error(message)
* TextService
	* GetTextSize(text, fontSize, font, frameSize)
* TweenService
* UserInputService
* VirtualInputManager
* Workspace
	* CurrentCamera
		* ViewportSize