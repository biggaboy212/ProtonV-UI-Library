-- just test file no tabs and sets to playergui dont use this

local Library = {}
-- This Element manager was made for testing purposes ! IT IS NOT FINAL !
local tweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Library = {
	Tabs = {},
	Elements = {},
}
local Tabs = Library.Tabs
local Elements = Library.Elements

local function changeTransparencyState(frame, frame2, time, transparencyValue, secondTransparencyValue)
	tweenService:Create(frame, TweenInfo.new(time, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Transparency = transparencyValue}):Play()
	tweenService:Create(frame2, TweenInfo.new(time, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {BackgroundTransparency = secondTransparencyValue}):Play()
end

local function EnableDragging(Frame)
	-- thanks visual lib lol
	local StartedDragging, DraggingInput, DragStart, StartPosition

	local function Update(Input)
		local Delta = Input.Position - DragStart
		Frame.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
	end

	Frame.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			StartedDragging = true
			DragStart = Input.Position
			StartPosition = Frame.Position
			Input.Changed:Connect(function()
				if Input.UserInputState == Enum.UserInputState.End then
					StartedDragging = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			DraggingInput = Input
		end
	end)

	UserInputService.InputChanged:Connect(function(Input)
		if Input == DraggingInput and StartedDragging then
			Update(Input)
		end
	end)
end


function Library:CreateWindow(Name)
	local Name = Name or 'Title'
	local Converted = {
		["_ProtonLib"] = Instance.new("ScreenGui");
		["_Library"] = Instance.new("Frame");
		["_Elements"] = Instance.new("Frame");
		["_ElementsList"] = Instance.new("ScrollingFrame");
		["_UIListLayout"] = Instance.new("UIListLayout");
		["_UnClip"] = Instance.new("Frame");
		["_UIStroke"] = Instance.new("UIStroke");
		["_UICorner"] = Instance.new("UICorner");
		["_Sidebar"] = Instance.new("Frame");
		["_UICorner1"] = Instance.new("UICorner");
		["_Roundcut"] = Instance.new("Frame");
		["_Title"] = Instance.new("TextLabel");
		["_Seperator"] = Instance.new("Frame");
		["_TabsList"] = Instance.new("ScrollingFrame");
		["_UIListLayout1"] = Instance.new("UIListLayout");
		["_UnClip1"] = Instance.new("Frame");
		["_Seperator1"] = Instance.new("Frame");
		["_Topbar"] = Instance.new("Frame");
		["_UICorner2"] = Instance.new("UICorner");
		["_Roundcut1"] = Instance.new("Frame");
		["_Close"] = Instance.new("Frame");
		["_UIStroke1"] = Instance.new("UIStroke");
		["_UICorner3"] = Instance.new("UICorner");
		["_CloseIcon"] = Instance.new("ImageLabel");
		["_CloseButton"] = Instance.new("TextButton");
	}

	Converted["_ProtonLib"].DisplayOrder = 100
	Converted["_ProtonLib"].IgnoreGuiInset = true
	Converted["_ProtonLib"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
	Converted["_ProtonLib"].ResetOnSpawn = false
	Converted["_ProtonLib"].Name = "ProtonUILibraryBeta"
	Converted["_ProtonLib"].Parent = game:GetService("Players").LocalPlayer.PlayerGui

	Converted["_Library"].AnchorPoint = Vector2.new(0.5, 0.5)
	Converted["_Library"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Converted["_Library"].ClipsDescendants = true
	Converted["_Library"].Position = UDim2.new(0.499633163, 0, 0.5, 0)
	Converted["_Library"].Size = UDim2.new(0, 650, 0, 385)
	Converted["_Library"].ZIndex = 200
	Converted["_Library"].Name = "Library"
	Converted["_Library"].Parent = Converted["_ProtonLib"]
	EnableDragging(Converted["_Library"])

	Converted["_Elements"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Converted["_Elements"].BackgroundTransparency = 1
	Converted["_Elements"].ClipsDescendants = true
	Converted["_Elements"].Position = UDim2.new(0.166990727, 0, 0.0182708111, 0)
	Converted["_Elements"].Size = UDim2.new(0, 537, 0, 366)
	Converted["_Elements"].ZIndex = 205
	Converted["_Elements"].Name = "Elements"
	Converted["_Elements"].Parent = Converted["_Library"]

	Converted["_ElementsList"].AutomaticCanvasSize = Enum.AutomaticSize.Y
	Converted["_ElementsList"].CanvasSize = UDim2.new(0, 0, 0, 0)
	Converted["_ElementsList"].ScrollBarThickness = 2
	Converted["_ElementsList"].Active = true
	Converted["_ElementsList"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Converted["_ElementsList"].BackgroundTransparency = 1
	Converted["_ElementsList"].BorderSizePixel = 0
	Converted["_ElementsList"].Position = UDim2.new(-0.00535569293, 0, 0.117486335, 0)
	Converted["_ElementsList"].Size = UDim2.new(1.00558627, 0, 0.882513642, 0)
	Converted["_ElementsList"].ZIndex = 205
	Converted["_ElementsList"].Name = "ElementsList"
	Converted["_ElementsList"].Parent = Converted["_Elements"]

	Converted["_UIListLayout"].Padding = UDim.new(0, 6)
	Converted["_UIListLayout"].HorizontalAlignment = Enum.HorizontalAlignment.Center
	Converted["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
	Converted["_UIListLayout"].Parent = Converted["_ElementsList"]

	Converted["_UnClip"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Converted["_UnClip"].BackgroundTransparency = 1
	Converted["_UnClip"].BorderSizePixel = 0
	Converted["_UnClip"].LayoutOrder = -100
	Converted["_UnClip"].Position = UDim2.new(0.0473083183, 0, 0, 0)
	Converted["_UnClip"].ZIndex = 205
	Converted["_UnClip"].Name = "UnClip"
	Converted["_UnClip"].Parent = Converted["_ElementsList"]

	Converted["_UIStroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Converted["_UIStroke"].Color = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
	Converted["_UIStroke"].Parent = Converted["_Library"]
	Converted["_UIStroke"].LineJoinMode = Enum.LineJoinMode.Round
	Converted["_UIStroke"].Thickness = 1
	Converted["_UIStroke"].Transparency = 0.6

	Converted["_UICorner"].Parent = Converted["_Library"]

	Converted["_Sidebar"].BackgroundColor3 = Color3.fromRGB(45.00000111758709, 45.00000111758709, 45.00000111758709)
	Converted["_Sidebar"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Sidebar"].BorderSizePixel = 0
	Converted["_Sidebar"].Size = UDim2.new(0, 105, 0, 384)
	Converted["_Sidebar"].ZIndex = 255
	Converted["_Sidebar"].Name = "Sidebar"
	Converted["_Sidebar"].Parent = Converted["_Library"]

	Converted["_UICorner1"].Parent = Converted["_Sidebar"]

	Converted["_Roundcut"].BackgroundColor3 = Color3.fromRGB(45.00000111758709, 45.00000111758709, 45.00000111758709)
	Converted["_Roundcut"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Roundcut"].BorderSizePixel = 0
	Converted["_Roundcut"].Position = UDim2.new(0.92955935, 0, 0, 0)
	Converted["_Roundcut"].Size = UDim2.new(0, 7, 0, 384)
	Converted["_Roundcut"].ZIndex = 255
	Converted["_Roundcut"].Name = "Roundcut"
	Converted["_Roundcut"].Parent = Converted["_Sidebar"]

	Converted["_Title"].Font = Enum.Font.GothamMedium
	Converted["_Title"].Text = Name
	Converted["_Title"].TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	Converted["_Title"].TextSize = 15
	Converted["_Title"].TextWrapped = true
	Converted["_Title"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_Title"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Title"].BackgroundTransparency = 1
	Converted["_Title"].BorderSizePixel = 0
	Converted["_Title"].Position = UDim2.new(0, 9, 0, 7)
	Converted["_Title"].Size = UDim2.new(0, 486, 0, 28)
	Converted["_Title"].ZIndex = 256
	Converted["_Title"].Name = "Title"
	Converted["_Title"].Parent = Converted["_Sidebar"]

	Converted["_Seperator"].BackgroundColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	Converted["_Seperator"].BackgroundTransparency = 0.75
	Converted["_Seperator"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Seperator"].BorderSizePixel = 0
	Converted["_Seperator"].Position = UDim2.new(0.00952380989, 0, 0.109416641, 0)
	Converted["_Seperator"].Size = UDim2.new(0, 649, 0, 1)
	Converted["_Seperator"].ZIndex = 256
	Converted["_Seperator"].Name = "Seperator"
	Converted["_Seperator"].Parent = Converted["_Sidebar"]

	Converted["_TabsList"].AutomaticCanvasSize = Enum.AutomaticSize.Y
	Converted["_TabsList"].CanvasSize = UDim2.new(0, 0, 0, 0)
	Converted["_TabsList"].ScrollBarThickness = 2
	Converted["_TabsList"].Active = true
	Converted["_TabsList"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Converted["_TabsList"].BackgroundTransparency = 1
	Converted["_TabsList"].BorderSizePixel = 0
	Converted["_TabsList"].Position = UDim2.new(0.0666666701, 0, 0.127645805, 0)
	Converted["_TabsList"].Size = UDim2.new(0.862892687, 0, 0.848916709, 0)
	Converted["_TabsList"].ZIndex = 205
	Converted["_TabsList"].Name = "TabsList"
	Converted["_TabsList"].Parent = Converted["_Sidebar"]

	Converted["_UIListLayout1"].Padding = UDim.new(0, 6)
	Converted["_UIListLayout1"].HorizontalAlignment = Enum.HorizontalAlignment.Center
	Converted["_UIListLayout1"].SortOrder = Enum.SortOrder.LayoutOrder
	Converted["_UIListLayout1"].Parent = Converted["_TabsList"]

	Converted["_UnClip1"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Converted["_UnClip1"].BackgroundTransparency = 1
	Converted["_UnClip1"].BorderSizePixel = 0
	Converted["_UnClip1"].LayoutOrder = -100
	Converted["_UnClip1"].Position = UDim2.new(0.0473083183, 0, 0, 0)
	Converted["_UnClip1"].ZIndex = 205
	Converted["_UnClip1"].Name = "UnClip"
	Converted["_UnClip1"].Parent = Converted["_TabsList"]

	Converted["_Seperator1"].BackgroundColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	Converted["_Seperator1"].BackgroundTransparency = 0.75
	Converted["_Seperator1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Seperator1"].BorderSizePixel = 0
	Converted["_Seperator1"].Position = UDim2.new(1, 0, 0.109416641, 0)
	Converted["_Seperator1"].Size = UDim2.new(0, 1, 0, 341)
	Converted["_Seperator1"].ZIndex = 256
	Converted["_Seperator1"].Name = "Seperator"
	Converted["_Seperator1"].Parent = Converted["_Sidebar"]

	Converted["_Topbar"].BackgroundColor3 = Color3.fromRGB(45.00000111758709, 45.00000111758709, 45.00000111758709)
	Converted["_Topbar"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Topbar"].BorderSizePixel = 0
	Converted["_Topbar"].Size = UDim2.new(0, 650, 0, 43)
	Converted["_Topbar"].ZIndex = 255
	Converted["_Topbar"].Name = "Topbar"
	Converted["_Topbar"].Parent = Converted["_Library"]

	Converted["_UICorner2"].Parent = Converted["_Topbar"]

	Converted["_Roundcut1"].BackgroundColor3 = Color3.fromRGB(45.00000111758709, 45.00000111758709, 45.00000111758709)
	Converted["_Roundcut1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Roundcut1"].BorderSizePixel = 0
	Converted["_Roundcut1"].Position = UDim2.new(0, 0, 0.790697694, 0)
	Converted["_Roundcut1"].Size = UDim2.new(0, 649, 0, 9)
	Converted["_Roundcut1"].ZIndex = 255
	Converted["_Roundcut1"].Name = "Roundcut"
	Converted["_Roundcut1"].Parent = Converted["_Topbar"]

	Converted["_Close"].AnchorPoint = Vector2.new(0, 0.5)
	Converted["_Close"].BackgroundColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	Converted["_Close"].BackgroundTransparency = 0.8999999761581421
	Converted["_Close"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Close"].BorderSizePixel = 0
	Converted["_Close"].Position = UDim2.new(0.948000014, 0, 0.5, 0)
	Converted["_Close"].Size = UDim2.new(0, 23, 0, 23)
	Converted["_Close"].ZIndex = 256
	Converted["_Close"].Name = "Close"
	Converted["_Close"].Parent = Converted["_Topbar"]

	Converted["_UIStroke1"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Converted["_UIStroke1"].Color = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
	Converted["_UIStroke1"].Parent = Converted["_Close"]
	Converted["_UIStroke1"].Thickness = 1
	Converted["_UIStroke1"].Transparency = 0.6

	Converted["_UICorner3"].CornerRadius = UDim.new(0, 4)
	Converted["_UICorner3"].Parent = Converted["_Close"]

	Converted["_CloseIcon"].Image = "rbxassetid://3944676352"
	Converted["_CloseIcon"].ImageColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	Converted["_CloseIcon"].ScaleType = Enum.ScaleType.Fit
	Converted["_CloseIcon"].AnchorPoint = Vector2.new(0.5, 0.5)
	Converted["_CloseIcon"].BackgroundTransparency = 1
	Converted["_CloseIcon"].Position = UDim2.new(0.5, 0, 0.5, 0)
	Converted["_CloseIcon"].Size = UDim2.new(0, 21, 0, 21)
	Converted["_CloseIcon"].ZIndex = 256
	Converted["_CloseIcon"].Name = "CloseIcon"
	Converted["_CloseIcon"].Parent = Converted["_Close"]
	
	Converted["_CloseButton"].Font = Enum.Font.SourceSans
	Converted["_CloseButton"].Text = ""
	Converted["_CloseButton"].TextColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_CloseButton"].TextSize = 14
	Converted["_CloseButton"].AutoButtonColor = false
	Converted["_CloseButton"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_CloseButton"].BackgroundTransparency = 1
	Converted["_CloseButton"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_CloseButton"].BorderSizePixel = 0
	Converted["_CloseButton"].Size = UDim2.new(0, 21, 0, 21)
	Converted["_CloseButton"].ZIndex = 257
	Converted["_CloseButton"].Parent = Converted["_Close"]
	
	Converted["_CloseButton"].MouseButton1Down:Connect(function()
		changeTransparencyState(Converted["_UIStroke1"], Converted["_Close"], 0.2, 0.8, 0.95)
	end)

	Converted["_CloseButton"].MouseButton1Up:Connect(function()
		changeTransparencyState(Converted["_UIStroke1"], Converted["_Close"], 0.2, 0.7, 0.93)
	end)

	Converted["_CloseButton"].MouseEnter:Connect(function()
		changeTransparencyState(Converted["_UIStroke1"], Converted["_Close"], 0.3, 0.7, 0.93)
	end)

	Converted["_CloseButton"].MouseLeave:Connect(function()
		changeTransparencyState(Converted["_UIStroke1"], Converted["_Close"], 0.3, 0.6, 0.9)
	end)
end

function Elements:CreateButton(Name, Description, Callback)
	local Callback = Callback or function() end
	local Name = Name or 'Button'
	local Description = Description or 'Description'
	
	local ButtonTemp = {
		["_ButtonElement"] = Instance.new("Frame");
		["_UICorner"] = Instance.new("UICorner");
		["_Title"] = Instance.new("TextLabel");
		["_UIStroke"] = Instance.new("UIStroke");
		["_Interact"] = Instance.new("TextButton");
		["_Description"] = Instance.new("TextLabel");
	}
	
	ButtonTemp["_ButtonElement"].Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ProtonUILibraryBeta").Library.Elements.ElementsList
	ButtonTemp["_ButtonElement"].BackgroundColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	ButtonTemp["_ButtonElement"].BackgroundTransparency = 0.8999999761581421
	ButtonTemp["_ButtonElement"].BorderSizePixel = 0
	ButtonTemp["_ButtonElement"].Position = UDim2.new(0.0180265661, 0, 0.0167597774, 0)
	ButtonTemp["_ButtonElement"].Size = UDim2.new(0, 518, 0, 40)
	ButtonTemp["_ButtonElement"].ZIndex = 205
	ButtonTemp["_ButtonElement"].Name = "ButtonElement"

	ButtonTemp["_UICorner"].CornerRadius = UDim.new(0, 6)
	ButtonTemp["_UICorner"].Parent = ButtonTemp["_ButtonElement"]

	ButtonTemp["_Title"].Font = Enum.Font.GothamMedium
	ButtonTemp["_Title"].Text = Name
	ButtonTemp["_Title"].TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	ButtonTemp["_Title"].TextSize = 14
	ButtonTemp["_Title"].TextWrapped = true
	ButtonTemp["_Title"].TextXAlignment = Enum.TextXAlignment.Left
	ButtonTemp["_Title"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonTemp["_Title"].BackgroundTransparency = 1
	ButtonTemp["_Title"].BorderSizePixel = 0
	ButtonTemp["_Title"].Position = UDim2.new(0, 18, 0, 12)
	ButtonTemp["_Title"].Size = UDim2.new(0, 246, 0, 16)
	ButtonTemp["_Title"].ZIndex = 205
	ButtonTemp["_Title"].Name = "Title"
	ButtonTemp["_Title"].Parent = ButtonTemp["_ButtonElement"]

	ButtonTemp["_UIStroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	ButtonTemp["_UIStroke"].Color = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
	ButtonTemp["_UIStroke"].Parent = ButtonTemp["_ButtonElement"]
	ButtonTemp["_UIStroke"].Thickness = 1
	ButtonTemp["_UIStroke"].Transparency = 0.5

	ButtonTemp["_Interact"].Font = Enum.Font.SourceSans
	ButtonTemp["_Interact"].Text = ""
	ButtonTemp["_Interact"].TextColor3 = Color3.fromRGB(0, 0, 0)
	ButtonTemp["_Interact"].TextSize = 14
	ButtonTemp["_Interact"].TextTransparency = 1
	ButtonTemp["_Interact"].AnchorPoint = Vector2.new(0.5, 0.5)
	ButtonTemp["_Interact"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonTemp["_Interact"].BackgroundTransparency = 1
	ButtonTemp["_Interact"].BorderSizePixel = 0
	ButtonTemp["_Interact"].Position = UDim2.new(0.499999762, 0, 0.5, 0)
	ButtonTemp["_Interact"].Size = UDim2.new(1, 0, 1, 0)
	ButtonTemp["_Interact"].ZIndex = 210
	ButtonTemp["_Interact"].Name = "Interact"
	ButtonTemp["_Interact"].Parent = ButtonTemp["_ButtonElement"]

	ButtonTemp["_Description"].Font = Enum.Font.GothamMedium
	ButtonTemp["_Description"].Text = Description
	ButtonTemp["_Description"].TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	ButtonTemp["_Description"].TextSize = 14
	ButtonTemp["_Description"].TextTransparency = 0.6000000238418579
	ButtonTemp["_Description"].TextWrapped = true
	ButtonTemp["_Description"].TextXAlignment = Enum.TextXAlignment.Right
	ButtonTemp["_Description"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonTemp["_Description"].BackgroundTransparency = 1
	ButtonTemp["_Description"].BorderSizePixel = 0
	ButtonTemp["_Description"].Position = UDim2.new(0, 264, 0, 12)
	ButtonTemp["_Description"].Size = UDim2.new(0, 237, 0, 16)
	ButtonTemp["_Description"].ZIndex = 205
	ButtonTemp["_Description"].Name = "Description"
	ButtonTemp["_Description"].Parent = ButtonTemp["_ButtonElement"]

	-- Logic
	ButtonTemp["_Interact"].MouseButton1Click:Connect(function()
		task.spawn(function()
			Callback()
		end)
	end)


	ButtonTemp["_Interact"].MouseButton1Down:Connect(function()
		changeTransparencyState(ButtonTemp["_UIStroke"], ButtonTemp["_ButtonElement"], 0.2, 0.8, 0.95)
	end)

	ButtonTemp["_Interact"].MouseButton1Up:Connect(function()
		changeTransparencyState(ButtonTemp["_UIStroke"], ButtonTemp["_ButtonElement"], 0.2, 0.7, 0.93)
	end)

	ButtonTemp["_Interact"].MouseEnter:Connect(function()
		changeTransparencyState(ButtonTemp["_UIStroke"], ButtonTemp["_ButtonElement"], 0.3, 0.7, 0.93)
	end)

	ButtonTemp["_Interact"].MouseLeave:Connect(function()
		changeTransparencyState(ButtonTemp["_UIStroke"], ButtonTemp["_ButtonElement"], 0.3, 0.5, 0.9)
	end)
end


-- Create Toggle
function Elements:CreateToggle(Name, Default, Callback)
	local Callback = Callback or function() end
	local Default = Default or false
	local Name = Name or 'Toggle'

	local ToggleTemp = {
		["_ToggleElement"] = Instance.new("Frame");
		["_UICorner"] = Instance.new("UICorner");
		["_Title"] = Instance.new("TextLabel");
		["_UIStroke"] = Instance.new("UIStroke");
		["_Toggle"] = Instance.new("Frame");
		["_UICorner1"] = Instance.new("UICorner");
		["_UIStroke1"] = Instance.new("UIStroke");
		["_ToggledValue"] = Instance.new("Frame");
		["_UICorner2"] = Instance.new("UICorner");
		["_UIStroke2"] = Instance.new("UIStroke");
		["_Interact"] = Instance.new("TextButton");
	}

	ToggleTemp["_ToggleElement"].BackgroundColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	ToggleTemp["_ToggleElement"].BackgroundTransparency = 0.8999999761581421
	ToggleTemp["_ToggleElement"].BorderSizePixel = 0
	ToggleTemp["_ToggleElement"].Position = UDim2.new(0.0180265661, 0, 0.0167597774, 0)
	ToggleTemp["_ToggleElement"].Size = UDim2.new(0, 518, 0, 40)
	ToggleTemp["_ToggleElement"].ZIndex = 205
	ToggleTemp["_ToggleElement"].Name = "ToggleElement"
	ToggleTemp["_ToggleElement"].Parent =  game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ProtonUILibraryBeta").Library.Elements.ElementsList

	ToggleTemp["_UICorner"].CornerRadius = UDim.new(0, 6)
	ToggleTemp["_UICorner"].Parent = ToggleTemp["_ToggleElement"]

	ToggleTemp["_Title"].Font = Enum.Font.GothamMedium
	ToggleTemp["_Title"].Text = Name
	ToggleTemp["_Title"].TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	ToggleTemp["_Title"].TextSize = 14
	ToggleTemp["_Title"].TextWrapped = true
	ToggleTemp["_Title"].TextXAlignment = Enum.TextXAlignment.Left
	ToggleTemp["_Title"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleTemp["_Title"].BackgroundTransparency = 1
	ToggleTemp["_Title"].BorderSizePixel = 0
	ToggleTemp["_Title"].Position = UDim2.new(0, 18, 0, 12)
	ToggleTemp["_Title"].Size = UDim2.new(0, 333, 0, 16)
	ToggleTemp["_Title"].ZIndex = 205
	ToggleTemp["_Title"].Name = "Title"
	ToggleTemp["_Title"].Parent = ToggleTemp["_ToggleElement"]

	ToggleTemp["_UIStroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	ToggleTemp["_UIStroke"].Color = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
	ToggleTemp["_UIStroke"].Parent = ToggleTemp["_ToggleElement"]
	ToggleTemp["_UIStroke"].LineJoinMode = Enum.LineJoinMode.Round
	ToggleTemp["_UIStroke"].Thickness = 1
	ToggleTemp["_UIStroke"].Transparency = 0.5

	ToggleTemp["_Toggle"].AnchorPoint = Vector2.new(1, 0.5)
	ToggleTemp["_Toggle"].BackgroundColor3 = Color3.fromRGB(50.00000461935997, 50.00000461935997, 50.00000461935997)
	ToggleTemp["_Toggle"].BackgroundTransparency = 1
	ToggleTemp["_Toggle"].BorderSizePixel = 0
	ToggleTemp["_Toggle"].Position = UDim2.new(1, -12, 0.5, 0)
	ToggleTemp["_Toggle"].Size = UDim2.new(0, 43, 0, 21)
	ToggleTemp["_Toggle"].ZIndex = 205
	ToggleTemp["_Toggle"].Name = "Toggle"
	ToggleTemp["_Toggle"].Parent = ToggleTemp["_ToggleElement"]

	ToggleTemp["_UICorner1"].CornerRadius = UDim.new(0, 15)
	ToggleTemp["_UICorner1"].Parent = ToggleTemp["_Toggle"]

	ToggleTemp["_UIStroke1"].Color = Color3.fromRGB(100.00000923871994, 100.00000923871994, 100.00000923871994)
	ToggleTemp["_UIStroke1"].Parent = ToggleTemp["_Toggle"]
	ToggleTemp["_UIStroke1"].LineJoinMode = Enum.LineJoinMode.Round
	ToggleTemp["_UIStroke1"].Thickness = 1
	ToggleTemp["_UIStroke1"].Transparency = 0.5

	ToggleTemp["_ToggledValue"].AnchorPoint = Vector2.new(0, 0.5)
	ToggleTemp["_ToggledValue"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleTemp["_ToggledValue"].BackgroundTransparency = 0.75
	ToggleTemp["_ToggledValue"].BorderSizePixel = 0
	ToggleTemp["_ToggledValue"].Position = UDim2.new(1, -40, 0.5, 0)
	ToggleTemp["_ToggledValue"].Size = UDim2.new(0, 17, 0, 17)
	ToggleTemp["_ToggledValue"].ZIndex = 205
	ToggleTemp["_ToggledValue"].Name = "ToggledValue"
	ToggleTemp["_ToggledValue"].Parent = ToggleTemp["_Toggle"]

	ToggleTemp["_UICorner2"].CornerRadius = UDim.new(1, 0)
	ToggleTemp["_UICorner2"].Parent = ToggleTemp["_ToggledValue"]

	ToggleTemp["_UIStroke2"].Color = Color3.fromRGB(255, 255, 255)
	ToggleTemp["_UIStroke2"].Thickness = 1.2000000476837158
	ToggleTemp["_UIStroke2"].Parent = ToggleTemp["_ToggledValue"]
	ToggleTemp["_UIStroke2"].LineJoinMode = Enum.LineJoinMode.Round
	ToggleTemp["_UIStroke2"].Thickness = 1
	ToggleTemp["_UIStroke2"].Transparency = 0.66

	ToggleTemp["_Interact"].Font = Enum.Font.SourceSans
	ToggleTemp["_Interact"].Text = ""
	ToggleTemp["_Interact"].TextColor3 = Color3.fromRGB(0, 0, 0)
	ToggleTemp["_Interact"].TextSize = 14
	ToggleTemp["_Interact"].TextTransparency = 1
	ToggleTemp["_Interact"].AnchorPoint = Vector2.new(0.5, 0.5)
	ToggleTemp["_Interact"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleTemp["_Interact"].BackgroundTransparency = 1
	ToggleTemp["_Interact"].BorderSizePixel = 0
	ToggleTemp["_Interact"].Position = UDim2.new(0.499999762, 0, 0.5, 0)
	ToggleTemp["_Interact"].Size = UDim2.new(1, 0, 1, 0)
	ToggleTemp["_Interact"].ZIndex = 210
	ToggleTemp["_Interact"].Name = "Interact"
	ToggleTemp["_Interact"].Parent = ToggleTemp["_ToggleElement"]


	-- Variables
	local DEBOUNCE_TIME = 0.5
	local toggleValue = false
	local debounce = false

	-- Functions
	local function startDebounce(debounceTime)
		if not debounce then
			coroutine.resume(coroutine.create(function()
				debounce = true
				task.wait(debounceTime)
				debounce = false
			end))
		end
	end


	local function changeState(state)
		if state and not debounce then
			startDebounce(DEBOUNCE_TIME)
			tweenService:Create(ToggleTemp["_ToggledValue"], TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Position = UDim2.new(1.465, -40, 0.5, 0)}):Play()
		elseif not state and not debounce then
			startDebounce(DEBOUNCE_TIME)
			tweenService:Create(ToggleTemp["_ToggledValue"], TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
		end
	end

	if Default then
		changeState(Default)
		toggleValue = Default
		task.spawn(function()                    
			pcall(Callback, Default)
		end)
	end

	local function toggleButtonClick()
		if not debounce then
			toggleValue = not toggleValue
			task.spawn(function()                    
				pcall(Callback, toggleValue)
			end)
		end

		changeState(toggleValue)
	end


	-- Logic
	ToggleTemp["_Interact"].MouseButton1Click:Connect(toggleButtonClick)

	ToggleTemp["_Interact"].MouseButton1Down:Connect(function()
		changeTransparencyState(ToggleTemp["_UIStroke"], ToggleTemp["_ToggleElement"], 0.2, 0.8, 0.95)
	end)

	ToggleTemp["_Interact"].MouseButton1Up:Connect(function()
		changeTransparencyState(ToggleTemp["_UIStroke"], ToggleTemp["_ToggleElement"], 0.2, 0.7, 0.93)
	end)

	ToggleTemp["_Interact"].MouseEnter:Connect(function()
		changeTransparencyState(ToggleTemp["_UIStroke"], ToggleTemp["_ToggleElement"], 0.3, 0.7, 0.93)
	end)

	ToggleTemp["_Interact"].MouseLeave:Connect(function()
		changeTransparencyState(ToggleTemp["_UIStroke"], ToggleTemp["_ToggleElement"], 0.3, 0.5, 0.9)
	end)
end

function Elements:CreateInput(Name, Placeholder, Type, Callback)
	local Name = Name or 'Textbox'
	local Placeholder = Placeholder or 'Input'
	local Type = Type or 'All'
	local Callback = Callback or function() end
	
	local Converted = {
		["_TextInputElement"] = Instance.new("Frame");
		["_UICorner"] = Instance.new("UICorner");
		["_Title"] = Instance.new("TextLabel");
		["_UIStroke"] = Instance.new("UIStroke");
		["_Interact"] = Instance.new("TextButton");
		["_Frame"] = Instance.new("Frame");
		["_InputBox"] = Instance.new("TextBox");
		["_LocalScript"] = Instance.new("LocalScript");
		["_UIStroke1"] = Instance.new("UIStroke");
		["_UICorner1"] = Instance.new("UICorner");
	}


	Converted["_TextInputElement"].BackgroundColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	Converted["_TextInputElement"].BackgroundTransparency = 0.8999999761581421
	Converted["_TextInputElement"].BorderSizePixel = 0
	Converted["_TextInputElement"].Position = UDim2.new(0.0180265661, 0, 0.0167597774, 0)
	Converted["_TextInputElement"].Size = UDim2.new(0, 518, 0, 40)
	Converted["_TextInputElement"].ZIndex = 205
	Converted["_TextInputElement"].Name = "TextInputElement"
	Converted["_TextInputElement"].Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ProtonUILibraryBeta").Library.Elements.ElementsList

	Converted["_UICorner"].CornerRadius = UDim.new(0, 6)
	Converted["_UICorner"].Parent = Converted["_TextInputElement"]

	Converted["_Title"].Font = Enum.Font.GothamMedium
	Converted["_Title"].Text = Name
	Converted["_Title"].TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	Converted["_Title"].TextSize = 14
	Converted["_Title"].TextWrapped = true
	Converted["_Title"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_Title"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Title"].BackgroundTransparency = 1
	Converted["_Title"].BorderSizePixel = 0
	Converted["_Title"].Position = UDim2.new(0, 18, 0, 12)
	Converted["_Title"].Size = UDim2.new(0, 190, 0, 16)
	Converted["_Title"].ZIndex = 205
	Converted["_Title"].Name = "Title"
	Converted["_Title"].Parent = Converted["_TextInputElement"]

	Converted["_UIStroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Converted["_UIStroke"].Color = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
	Converted["_UIStroke"].Parent = Converted["_TextInputElement"]
	Converted["_UIStroke"].Thickness = 1
	Converted["_UIStroke"].Transparency = 0.5

	Converted["_Interact"].Font = Enum.Font.SourceSans
	Converted["_Interact"].Text = ""
	Converted["_Interact"].TextColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Interact"].TextSize = 14
	Converted["_Interact"].TextTransparency = 1
	Converted["_Interact"].AnchorPoint = Vector2.new(0.5, 0.5)
	Converted["_Interact"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Interact"].BackgroundTransparency = 1
	Converted["_Interact"].BorderSizePixel = 0
	Converted["_Interact"].Position = UDim2.new(0.499999762, 0, 0.5, 0)
	Converted["_Interact"].Size = UDim2.new(1, 0, 1, 0)
	Converted["_Interact"].ZIndex = 210
	Converted["_Interact"].Name = "Interact"
	Converted["_Interact"].Parent = Converted["_TextInputElement"]

	Converted["_Frame"].AnchorPoint = Vector2.new(1, 0.5)
	Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_Frame"].BorderSizePixel = 0
	Converted["_Frame"].Position = UDim2.new(0.976834357, 0, 0.5, 0)
	Converted["_Frame"].Size = UDim2.new(0, 64, 0, 25)
	Converted["_Frame"].ZIndex = 209
	Converted["_Frame"].Parent = Converted["_TextInputElement"]

	Converted["_InputBox"].CursorPosition = -1
	Converted["_InputBox"].Font = Enum.Font.GothamMedium
	Converted["_InputBox"].PlaceholderColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	Converted["_InputBox"].PlaceholderText = Placeholder
	Converted["_InputBox"].Text = ""
	Converted["_InputBox"].TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	Converted["_InputBox"].TextSize = 14
	Converted["_InputBox"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Converted["_InputBox"].BackgroundTransparency = 1
	Converted["_InputBox"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Converted["_InputBox"].BorderSizePixel = 0
	Converted["_InputBox"].Position = UDim2.new(9.53674316e-07, 0, 0, 0)
	Converted["_InputBox"].Size = UDim2.new(0, 64, 0, 25)
	Converted["_InputBox"].ZIndex = 211
	Converted["_InputBox"].Name = "InputBox"
	Converted["_InputBox"].Parent = Converted["_Frame"]

	Converted["_UIStroke1"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Converted["_UIStroke1"].Color = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
	Converted["_UIStroke1"].Parent = Converted["_Frame"]
	Converted["_UIStroke1"].Thickness = 1
	Converted["_UIStroke1"].Transparency = 0.5

	Converted["_UICorner1"].CornerRadius = UDim.new(0, 6)
	Converted["_UICorner1"].Parent = Converted["_Frame"]

	
	Converted["_Interact"].MouseButton1Down:Connect(function()
		changeTransparencyState(Converted["_UIStroke"], Converted["_TextInputElement"], 0.2, 0.8, 0.95)
	end)

	Converted["_Interact"].MouseButton1Up:Connect(function()
		changeTransparencyState(Converted["_UIStroke"], Converted["_TextInputElement"], 0.2, 0.7, 0.93)
	end)

	Converted["_Interact"].MouseEnter:Connect(function()
		changeTransparencyState(Converted["_UIStroke"], Converted["_TextInputElement"], 0.3, 0.7, 0.93)
	end)

	Converted["_Interact"].MouseLeave:Connect(function()
		changeTransparencyState(Converted["_UIStroke"] ,Converted["_TextInputElement"], 0.3, 0.5, 0.9)
	end)
	
	local TweenService = game:GetService("TweenService")

	local function updateFrameSize(textBox)
		local parentFrame = textBox.Parent
		local textBounds = textBox.TextBounds

		local newFrameSize = UDim2.new(0, textBounds.X + 16, 0, 24)

		TweenService:Create(parentFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = newFrameSize}):Play()
		TweenService:Create(textBox, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0)}):Play()
	end
	
	updateFrameSize(Converted["_InputBox"])
	
	Converted["_InputBox"]:GetPropertyChangedSignal("Text"):Connect(function()
		if Type == "Numbers" or Type == "numbers" then
			Converted["_InputBox"].Text = Converted["_InputBox"].Text:gsub("[^%-%d.]", "")
		elseif Type == "Letters" or Type == "letters" then
			Converted["_InputBox"].Text = Converted["_InputBox"].Text:gsub("[%d]", "")
		end

		updateFrameSize(Converted["_InputBox"])
	end)

	Converted["_Interact"].MouseButton1Click:Connect(function()
		Converted["_InputBox"]:CaptureFocus()
	end)

	Converted["_InputBox"].FocusLost:Connect(function()
		task.spawn(function()
			Callback(Converted["_InputBox"].Text)
		end)
	end)

end

return Library
