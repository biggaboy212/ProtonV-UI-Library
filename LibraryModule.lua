--[[
BETA MODULE FOR ROBLOX STUDIO

Module and Module handler made by biggaboy212
]]

local Library = {}

local Library = {
	Tabs = {},
	Elements = {},
}

local newName = game:GetService("HttpService"):GenerateGUID()
local tweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local Mouse = Players.LocalPlayer:GetMouse()

local Tabs = Library.Tabs
local Elements = Library.Elements

local WindowParent


-- Utilities
local function changeTransparencyState(frame, frame2, time, transparencyValue, secondTransparencyValue)
	tweenService:Create(frame, TweenInfo.new(time, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Transparency = transparencyValue}):Play()
	tweenService:Create(frame2, TweenInfo.new(time, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {BackgroundTransparency = secondTransparencyValue}):Play()
end


function Tween(Instance, Properties, Duration, ...)
	local TweenInfo = TweenInfo.new(Duration, ...)
	tweenService:Create(Instance, TweenInfo, Properties):Play()
end


local function EnableDragging(Frame)
	-- Dragging script creds: Visual UI Lib
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



-- Element functions
function Library:CreateWindow(Name)
	local Name = Name or 'Title'
	local Window = {
		["_ProtonLib"] = Instance.new("ScreenGui");
		["_Library"] = Instance.new("Frame");
		["_Elements"] = Instance.new("Frame");
		["_ElementsList"] = Instance.new("ScrollingFrame");
		["_UIListLayout"] = Instance.new("UIListLayout");
		["_UnClip"] = Instance.new("Frame");
		["_UnClip1"] = Instance.new("Frame");
		["_UIStroke"] = Instance.new("UIStroke");
		["_UICorner"] = Instance.new("UICorner");
		["_Sidebar"] = Instance.new("Frame");
		["_UICorner1"] = Instance.new("UICorner");
		["_Roundcut"] = Instance.new("Frame");
		["_Seperator"] = Instance.new("Frame");
		["_TabsList"] = Instance.new("ScrollingFrame");
		["_UIListLayout1"] = Instance.new("UIListLayout");
		["_UnClip2"] = Instance.new("Frame");
		["_Seperator1"] = Instance.new("Frame");
		["_Topbar"] = Instance.new("Frame");
		["_UICorner2"] = Instance.new("UICorner");
		["_Close"] = Instance.new("Frame");
		["_UIStroke1"] = Instance.new("UIStroke");
		["_UICorner3"] = Instance.new("UICorner");
		["_CloseIcon"] = Instance.new("ImageLabel");
		["_TextButton"] = Instance.new("TextButton");
		["_Minimize"] = Instance.new("Frame");
		["_UIStroke2"] = Instance.new("UIStroke");
		["_UICorner4"] = Instance.new("UICorner");
		["_TextButton1"] = Instance.new("TextButton");
		["_Minimize1"] = Instance.new("ImageLabel");
		["_Maximize"] = Instance.new("ImageLabel");
		["_Roundcut1"] = Instance.new("Frame");
		["_Title"] = Instance.new("TextLabel");
	}

	Window["_ProtonLib"].DisplayOrder = 999999999
	Window["_ProtonLib"].IgnoreGuiInset = true
	Window["_ProtonLib"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
	Window["_ProtonLib"].ResetOnSpawn = false
	Window["_ProtonLib"].Name = newName
	WindowParent = Players.LocalPlayer:WaitForChild("PlayerGui")
	Window["_ProtonLib"].Parent = WindowParent

	Window["_Library"].AnchorPoint = Vector2.new(0.5, 0.5)
	Window["_Library"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Window["_Library"].ClipsDescendants = true
	Window["_Library"].Position = UDim2.new(0.5, 0, 0.5, 0)
	Window["_Library"].Size = UDim2.new(0, 650, 0, 385)
	Window["_Library"].ZIndex = 200
	Window["_Library"].Name = "Library"
	Window["_Library"].Parent = Window["_ProtonLib"]
	EnableDragging(Window["_Library"])

	Window["_Elements"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Window["_Elements"].BackgroundTransparency = 1
	Window["_Elements"].ClipsDescendants = true
	Window["_Elements"].Position = UDim2.new(0.166990727, 0, 0.0182708111, 0)
	Window["_Elements"].Size = UDim2.new(0, 537, 0, 366)
	Window["_Elements"].ZIndex = 205
	Window["_Elements"].Name = "Elements"
	Window["_Elements"].Parent = Window["_Library"]

	Window["_ElementsList"].AutomaticCanvasSize = Enum.AutomaticSize.Y
	Window["_ElementsList"].CanvasSize = UDim2.new(0, 0, 0, 0)
	Window["_ElementsList"].ScrollBarThickness = 2
	Window["_ElementsList"].Active = true
	Window["_ElementsList"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Window["_ElementsList"].BackgroundTransparency = 1
	Window["_ElementsList"].BorderSizePixel = 0
	Window["_ElementsList"].Position = UDim2.new(-0.00535569293, 0, 0.117486335, 0)
	Window["_ElementsList"].Size = UDim2.new(1.00558627, 0, 0.882513642, 0)
	Window["_ElementsList"].ZIndex = 205
	Window["_ElementsList"].Name = "ElementsList"
	Window["_ElementsList"].Parent = Window["_Elements"]

	Window["_UIListLayout"].Padding = UDim.new(0, 6)
	Window["_UIListLayout"].HorizontalAlignment = Enum.HorizontalAlignment.Center
	Window["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
	Window["_UIListLayout"].Parent = Window["_ElementsList"]

	Window["_UnClip1"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Window["_UnClip1"].BackgroundTransparency = 1
	Window["_UnClip1"].BorderSizePixel = 0
	Window["_UnClip1"].LayoutOrder = 100000000
	Window["_UnClip1"].Position = UDim2.new(0.0473083183, 0, 0, 0)
	Window["_UnClip1"].ZIndex = 205
	Window["_UnClip1"].Name = "UnClip"
	Window["_UnClip1"].Parent = Window["_ElementsList"]

	Window["_UIStroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Window["_UIStroke"].Color = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
	Window["_UIStroke"].Parent = Window["_Library"]
	Window["_UIStroke"].LineJoinMode = Enum.LineJoinMode.Round
	Window["_UIStroke"].Thickness = 1
	Window["_UIStroke"].Transparency = 0.6

	Window["_UICorner"].Parent = Window["_Library"]

	Window["_Sidebar"].BackgroundColor3 = Color3.fromRGB(45.00000111758709, 45.00000111758709, 45.00000111758709)
	Window["_Sidebar"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window["_Sidebar"].BorderSizePixel = 0
	Window["_Sidebar"].Size = UDim2.new(0, 105, 0, 384)
	Window["_Sidebar"].ZIndex = 255
	Window["_Sidebar"].Name = "Sidebar"
	Window["_Sidebar"].Parent = Window["_Library"]

	Window["_UICorner1"].Parent = Window["_Sidebar"]

	Window["_Roundcut"].BackgroundColor3 = Color3.fromRGB(45.00000111758709, 45.00000111758709, 45.00000111758709)
	Window["_Roundcut"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window["_Roundcut"].BorderSizePixel = 0
	Window["_Roundcut"].Position = UDim2.new(0.92955935, 0, 0, 0)
	Window["_Roundcut"].Size = UDim2.new(0, 7, 0, 384)
	Window["_Roundcut"].ZIndex = 255
	Window["_Roundcut"].Name = "Roundcut"
	Window["_Roundcut"].Parent = Window["_Sidebar"]

	Window["_Seperator"].BackgroundColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	Window["_Seperator"].BackgroundTransparency = 0.75
	Window["_Seperator"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window["_Seperator"].BorderSizePixel = 0
	Window["_Seperator"].Position = UDim2.new(0.00952380989, 0, 0.109416641, 0)
	Window["_Seperator"].Size = UDim2.new(0, 649, 0, 1)
	Window["_Seperator"].ZIndex = 256
	Window["_Seperator"].Name = "Seperator"
	Window["_Seperator"].Parent = Window["_Sidebar"]

	Window["_TabsList"].AutomaticCanvasSize = Enum.AutomaticSize.Y
	Window["_TabsList"].CanvasSize = UDim2.new(0, 0, 0, 0)
	Window["_TabsList"].ScrollBarThickness = 2
	Window["_TabsList"].Active = true
	Window["_TabsList"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Window["_TabsList"].BackgroundTransparency = 1
	Window["_TabsList"].BorderSizePixel = 0
	Window["_TabsList"].Position = UDim2.new(0.0666666701, 0, 0.127645805, 0)
	Window["_TabsList"].Size = UDim2.new(0.862892687, 0, 0.848916709, 0)
	Window["_TabsList"].ZIndex = 205
	Window["_TabsList"].Name = "TabsList"
	Window["_TabsList"].Parent = Window["_Sidebar"]

	Window["_UIListLayout1"].Padding = UDim.new(0, 6)
	Window["_UIListLayout1"].HorizontalAlignment = Enum.HorizontalAlignment.Center
	Window["_UIListLayout1"].SortOrder = Enum.SortOrder.LayoutOrder
	Window["_UIListLayout1"].Parent = Window["_TabsList"]

	Window["_UnClip2"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Window["_UnClip2"].BackgroundTransparency = 1
	Window["_UnClip2"].BorderSizePixel = 0
	Window["_UnClip2"].LayoutOrder = -100
	Window["_UnClip2"].Position = UDim2.new(0.0473083183, 0, 0, 0)
	Window["_UnClip2"].ZIndex = 205
	Window["_UnClip2"].Name = "UnClip"
	Window["_UnClip2"].Parent = Window["_TabsList"]

	Window["_Seperator1"].BackgroundColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	Window["_Seperator1"].BackgroundTransparency = 0.75
	Window["_Seperator1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window["_Seperator1"].BorderSizePixel = 0
	Window["_Seperator1"].Position = UDim2.new(1, 0, 0.109416641, 0)
	Window["_Seperator1"].Size = UDim2.new(0, 1, 0, 341)
	Window["_Seperator1"].ZIndex = 256
	Window["_Seperator1"].Name = "Seperator"
	Window["_Seperator1"].Parent = Window["_Sidebar"]

	Window["_Topbar"].BackgroundColor3 = Color3.fromRGB(45.00000111758709, 45.00000111758709, 45.00000111758709)
	Window["_Topbar"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window["_Topbar"].BorderSizePixel = 0
	Window["_Topbar"].Size = UDim2.new(0, 650, 0, 43)
	Window["_Topbar"].ZIndex = 255
	Window["_Topbar"].Name = "Topbar"
	Window["_Topbar"].Parent = Window["_Library"]

	Window["_UICorner2"].Parent = Window["_Topbar"]

	Window["_Close"].AnchorPoint = Vector2.new(0, 0.5)
	Window["_Close"].BackgroundColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	Window["_Close"].BackgroundTransparency = 0.8999999761581421
	Window["_Close"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window["_Close"].BorderSizePixel = 0
	Window["_Close"].Position = UDim2.new(0.949999988, 0, 0.5, 0)
	Window["_Close"].Size = UDim2.new(0, 23, 0, 23)
	Window["_Close"].ZIndex = 256
	Window["_Close"].Name = "Close"
	Window["_Close"].Parent = Window["_Topbar"]

	Window["_UIStroke1"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Window["_UIStroke1"].Color = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
	Window["_UIStroke1"].Parent = Window["_Close"]
	Window["_UIStroke1"].Thickness = 1
	Window["_UIStroke1"].Transparency = 0.6

	Window["_UICorner3"].CornerRadius = UDim.new(0, 4)
	Window["_UICorner3"].Parent = Window["_Close"]

	Window["_CloseIcon"].Image = "rbxassetid://10747384394"
	Window["_CloseIcon"].ImageColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	Window["_CloseIcon"].ScaleType = Enum.ScaleType.Fit
	Window["_CloseIcon"].AnchorPoint = Vector2.new(0.5, 0.5)
	Window["_CloseIcon"].BackgroundTransparency = 1
	Window["_CloseIcon"].Position = UDim2.new(0.5, 0, 0.5, 0)
	Window["_CloseIcon"].Size = UDim2.new(0, 21, 0, 21)
	Window["_CloseIcon"].ZIndex = 256
	Window["_CloseIcon"].Name = "CloseIcon"
	Window["_CloseIcon"].Parent = Window["_Close"]

	Window["_TextButton"].Font = Enum.Font.SourceSans
	Window["_TextButton"].Text = ""
	Window["_TextButton"].TextColor3 = Color3.fromRGB(0, 0, 0)
	Window["_TextButton"].TextSize = 14
	Window["_TextButton"].AutoButtonColor = false
	Window["_TextButton"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Window["_TextButton"].BackgroundTransparency = 1
	Window["_TextButton"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window["_TextButton"].BorderSizePixel = 0
	Window["_TextButton"].Size = UDim2.new(0, 21, 0, 21)
	Window["_TextButton"].ZIndex = 257
	Window["_TextButton"].Parent = Window["_Close"]

	Window["_Minimize"].AnchorPoint = Vector2.new(0, 0.5)
	Window["_Minimize"].BackgroundColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	Window["_Minimize"].BackgroundTransparency = 0.8999999761581421
	Window["_Minimize"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window["_Minimize"].BorderSizePixel = 0
	Window["_Minimize"].Position = UDim2.new(0.904999971, 0, 0.5, 0)
	Window["_Minimize"].Size = UDim2.new(0, 23, 0, 23)
	Window["_Minimize"].ZIndex = 256
	Window["_Minimize"].Name = "Minimize"
	Window["_Minimize"].Parent = Window["_Topbar"]

	Window["_UIStroke2"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Window["_UIStroke2"].Color = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
	Window["_UIStroke2"].Parent = Window["_Minimize"]
	Window["_UIStroke2"].Thickness = 1
	Window["_UIStroke2"].Transparency = 0.6

	Window["_UICorner4"].CornerRadius = UDim.new(0, 4)
	Window["_UICorner4"].Parent = Window["_Minimize"]

	Window["_TextButton1"].Font = Enum.Font.SourceSans
	Window["_TextButton1"].Text = ""
	Window["_TextButton1"].TextColor3 = Color3.fromRGB(0, 0, 0)
	Window["_TextButton1"].TextSize = 14
	Window["_TextButton1"].AutoButtonColor = false
	Window["_TextButton1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Window["_TextButton1"].BackgroundTransparency = 1
	Window["_TextButton1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window["_TextButton1"].BorderSizePixel = 0
	Window["_TextButton1"].Size = UDim2.new(0, 21, 0, 21)
	Window["_TextButton1"].ZIndex = 257
	Window["_TextButton1"].Parent = Window["_Minimize"]

	Window["_Minimize1"].Image = "rbxassetid://10734896206"
	Window["_Minimize1"].ImageColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	Window["_Minimize1"].ScaleType = Enum.ScaleType.Fit
	Window["_Minimize1"].AnchorPoint = Vector2.new(0.5, 0.5)
	Window["_Minimize1"].BackgroundTransparency = 1
	Window["_Minimize1"].Position = UDim2.new(0.5, 0, 0.5, 0)
	Window["_Minimize1"].Size = UDim2.new(0, 21, 0, 21)
	Window["_Minimize1"].ZIndex = 256
	Window["_Minimize1"].Name = "Minimize"
	Window["_Minimize1"].Parent = Window["_Minimize"]

	Window["_Maximize"].Image = "rbxassetid://10734924532"
	Window["_Maximize"].ImageColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	Window["_Maximize"].ImageTransparency = 1
	Window["_Maximize"].ScaleType = Enum.ScaleType.Fit
	Window["_Maximize"].AnchorPoint = Vector2.new(0.5, 0.5)
	Window["_Maximize"].BackgroundTransparency = 1
	Window["_Maximize"].Position = UDim2.new(0.5, 0, 0.5, 0)
	Window["_Maximize"].Size = UDim2.new(0, 21, 0, 21)
	Window["_Maximize"].ZIndex = 256
	Window["_Maximize"].Name = "Maximize"
	Window["_Maximize"].Parent = Window["_Minimize"]

	Window["_Roundcut1"].BackgroundColor3 = Color3.fromRGB(45.00000111758709, 45.00000111758709, 45.00000111758709)
	Window["_Roundcut1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Window["_Roundcut1"].BorderSizePixel = 0
	Window["_Roundcut1"].Position = UDim2.new(0, 0, 0.790697694, 0)
	Window["_Roundcut1"].Size = UDim2.new(0, 649, 0, 9)
	Window["_Roundcut1"].ZIndex = 255
	Window["_Roundcut1"].Name = "Roundcut"
	Window["_Roundcut1"].Parent = Window["_Topbar"]

	Window["_Title"].Font = Enum.Font.GothamMedium
	Window["_Title"].Text = Name
	Window["_Title"].TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	Window["_Title"].TextSize = 15
	Window["_Title"].TextWrapped = true
	Window["_Title"].TextXAlignment = Enum.TextXAlignment.Left
	Window["_Title"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Window["_Title"].BackgroundTransparency = 1
	Window["_Title"].BorderSizePixel = 0
	Window["_Title"].Position = UDim2.new(0, 9, 0, 7)
	Window["_Title"].Size = UDim2.new(0, 486, 0, 28)
	Window["_Title"].ZIndex = 256
	Window["_Title"].Name = "Title"
	Window["_Title"].Parent = Window["_Topbar"]
	
	-- Logic
	local function Close()
		tweenService:Create(Window["_Library"], TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 650, 0, 0)}):Play()
		task.wait(1)
		Window["_ProtonLib"]:Destroy()
	end
	
	Window["_TextButton"].MouseButton1Click:Connect(function()
		Close()
	end)

	local Library = Window["_Library"]
	local Topbar = Window["_Topbar"]
	local RoundCut = Window["_Roundcut1"]
	local SideBar = Window["_Sidebar"]
	local MinimizeFrame = Window["_Minimize"]
	local MinimizeButton = Window["_Minimize1"]
	local MaximizeButton = Window["_Maximize"]
	local TweenTransparency = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, false, 0)

	local Minimized = false
	local Debounce = false
	local DEBOUNCE_TIME = 0.5

	local function createTransparencyTween(object, endTransparency)
		return tweenService:Create(object, TweenTransparency, { ImageTransparency = endTransparency })
	end

	local function startDebounce()
		coroutine.resume(coroutine.create(function()
			Debounce = true
			wait(DEBOUNCE_TIME)
			Debounce = false
		end))
	end

	local function Minimize()
		coroutine.resume(coroutine.create(function()
			tweenService:Create(Library, TweenInfo.new(0.85, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 650,0, 42)}):Play()
			task.wait(0.65)
			RoundCut.Visible = false
			SideBar.Visible = false
		end))
	end

	local function Maximize()
		coroutine.resume(coroutine.create(function()
			tweenService:Create(Library, TweenInfo.new(0.85, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 650, 0, 385, 0)}):Play()
			task.wait(0.1)
			RoundCut.Visible = true
			SideBar.Visible = true
		end))
	end

	Window["_TextButton1"].MouseButton1Click:Connect(function()
		if not Debounce then
			startDebounce()

			Minimized = not Minimized

			if Minimized then
				Minimize()
			elseif not Minimized then
				Maximize()
			end

			local transparencyTween1 = createTransparencyTween(MaximizeButton, Minimized and 0 or 1)
			local transparencyTween2 = createTransparencyTween(MinimizeButton, Minimized and 1 or 0)

			transparencyTween1:Play()
			transparencyTween2:Play()
		end
	end)

	-- Close Button Mouse effects
	Window["_TextButton"].MouseButton1Down:Connect(function()
		changeTransparencyState(Window["_UIStroke1"], Window["_Close"], 0.2, 0.8, 0.95)
	end)

	Window["_TextButton"].MouseButton1Up:Connect(function()
		changeTransparencyState(Window["_UIStroke1"], Window["_Close"], 0.2, 0.7, 0.93)
	end)

	Window["_TextButton"].MouseEnter:Connect(function()
		changeTransparencyState(Window["_UIStroke1"], Window["_Close"], 0.3, 0.7, 0.93)
	end)

	Window["_TextButton"].MouseLeave:Connect(function()
		changeTransparencyState(Window["_UIStroke1"], Window["_Close"], 0.3, 0.6, 0.9)
	end)
	
	-- Minimize Mouse effects
	
	Window["_TextButton1"].MouseButton1Down:Connect(function()
		changeTransparencyState(Window["_UIStroke2"], Window["_Minimize"], 0.2, 0.8, 0.95)
	end)

	Window["_TextButton1"].MouseButton1Up:Connect(function()
		changeTransparencyState(Window["_UIStroke2"], Window["_Minimize"], 0.2, 0.7, 0.93)
	end)

	Window["_TextButton1"].MouseEnter:Connect(function()
		changeTransparencyState(Window["_UIStroke2"], Window["_Minimize"], 0.3, 0.7, 0.93)
	end)

	Window["_TextButton1"].MouseLeave:Connect(function()
		changeTransparencyState(Window["_UIStroke2"], Window["_Minimize"], 0.3, 0.6, 0.9)
	end)
end

function Library:NewSection(Name)
	local Name = Name or 'New Section'
	local Converted = {
		["_SectionElement"] = Instance.new("Frame");
		["_Title"] = Instance.new("TextLabel");
	}

	Converted["_SectionElement"].BackgroundColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	Converted["_SectionElement"].BackgroundTransparency = 1
	Converted["_SectionElement"].BorderSizePixel = 0
	Converted["_SectionElement"].Position = UDim2.new(0.0203702077, 0, 0.625387073, 0)
	Converted["_SectionElement"].Size = UDim2.new(0, 518, 0, 29)
	Converted["_SectionElement"].ZIndex = 205
	Converted["_SectionElement"].Name = "SectionElement"
	Converted["_SectionElement"].Parent = WindowParent:WaitForChild(newName).Library.Elements.ElementsList

	Converted["_Title"].Font = Enum.Font.GothamMedium
	Converted["_Title"].Text = Name
	Converted["_Title"].TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	Converted["_Title"].TextSize = 14
	Converted["_Title"].TextTransparency = 0.6000000238418579
	Converted["_Title"].TextWrapped = true
	Converted["_Title"].TextXAlignment = Enum.TextXAlignment.Left
	Converted["_Title"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Converted["_Title"].BackgroundTransparency = 1
	Converted["_Title"].BorderSizePixel = 0
	Converted["_Title"].Position = UDim2.new(0, 7, 0, 10)
	Converted["_Title"].Size = UDim2.new(0, 257, 0, 16)
	Converted["_Title"].ZIndex = 205
	Converted["_Title"].Name = "Title"
	Converted["_Title"].Parent = Converted["_SectionElement"]
end

function Library:InsertSeperation()
	local Section = {
		["_UnClip"] = Instance.new("Frame");
	}
	
	Section["_UnClip"].Parent = WindowParent:WaitForChild(newName).Library.Elements.ElementsList
	Section["_UnClip"].BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Section["_UnClip"].BackgroundTransparency = 1
	Section["_UnClip"].BorderSizePixel = 0
	Section["_UnClip"].LayoutOrder = 0
	Section["_UnClip"].Position = UDim2.new(0, 0, 0, 0)
	Section["_UnClip"].Size = UDim2.new(0, 0, 0, 5)
	Section["_UnClip"].ZIndex = 205
	Section["_UnClip"].Name = "NewSeperation"
end

function Elements:CreateButton( Name, Description, Callback)
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
	
	ButtonTemp["_ButtonElement"].Parent = WindowParent:WaitForChild(newName).Library.Elements.ElementsList
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
	ToggleTemp["_ToggleElement"].Parent =  WindowParent:WaitForChild(newName).Library.Elements.ElementsList

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
			tweenService:Create(ToggleTemp["_ToggledValue"], TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {Position = UDim2.new(1.465, -40, 0.5, 0)}):Play()
		elseif not state and not debounce then
			startDebounce(DEBOUNCE_TIME)
			tweenService:Create(ToggleTemp["_ToggledValue"], TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
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
	
	local Input = {
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


	Input["_TextInputElement"].BackgroundColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	Input["_TextInputElement"].BackgroundTransparency = 0.8999999761581421
	Input["_TextInputElement"].BorderSizePixel = 0
	Input["_TextInputElement"].Position = UDim2.new(0.0180265661, 0, 0.0167597774, 0)
	Input["_TextInputElement"].Size = UDim2.new(0, 518, 0, 40)
	Input["_TextInputElement"].ZIndex = 205
	Input["_TextInputElement"].Name = "TextInputElement"
	Input["_TextInputElement"].Parent = WindowParent:WaitForChild(newName).Library.Elements.ElementsList

	Input["_UICorner"].CornerRadius = UDim.new(0, 6)
	Input["_UICorner"].Parent = Input["_TextInputElement"]

	Input["_Title"].Font = Enum.Font.GothamMedium
	Input["_Title"].Text = Name
	Input["_Title"].TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	Input["_Title"].TextSize = 14
	Input["_Title"].TextWrapped = true
	Input["_Title"].TextXAlignment = Enum.TextXAlignment.Left
	Input["_Title"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Input["_Title"].BackgroundTransparency = 1
	Input["_Title"].BorderSizePixel = 0
	Input["_Title"].Position = UDim2.new(0, 18, 0, 12)
	Input["_Title"].Size = UDim2.new(0, 190, 0, 16)
	Input["_Title"].ZIndex = 205
	Input["_Title"].Name = "Title"
	Input["_Title"].Parent = Input["_TextInputElement"]

	Input["_UIStroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Input["_UIStroke"].Color = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
	Input["_UIStroke"].Parent = Input["_TextInputElement"]
	Input["_UIStroke"].Thickness = 1
	Input["_UIStroke"].Transparency = 0.5

	Input["_Interact"].Font = Enum.Font.SourceSans
	Input["_Interact"].Text = ""
	Input["_Interact"].TextColor3 = Color3.fromRGB(0, 0, 0)
	Input["_Interact"].TextSize = 14
	Input["_Interact"].TextTransparency = 1
	Input["_Interact"].AnchorPoint = Vector2.new(0.5, 0.5)
	Input["_Interact"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Input["_Interact"].BackgroundTransparency = 1
	Input["_Interact"].BorderSizePixel = 0
	Input["_Interact"].Position = UDim2.new(0.499999762, 0, 0.5, 0)
	Input["_Interact"].Size = UDim2.new(1, 0, 1, 0)
	Input["_Interact"].ZIndex = 210
	Input["_Interact"].Name = "Interact"
	Input["_Interact"].Parent = Input["_TextInputElement"]

	Input["_Frame"].AnchorPoint = Vector2.new(1, 0.5)
	Input["_Frame"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Input["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Input["_Frame"].BorderSizePixel = 0
	Input["_Frame"].Position = UDim2.new(0.976834357, 0, 0.5, 0)
	Input["_Frame"].Size = UDim2.new(0, 64, 0, 25)
	Input["_Frame"].ZIndex = 209
	Input["_Frame"].Parent = Input["_TextInputElement"]

	Input["_InputBox"].CursorPosition = -1
	Input["_InputBox"].Font = Enum.Font.GothamMedium
	Input["_InputBox"].PlaceholderColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	Input["_InputBox"].PlaceholderText = Placeholder
	Input["_InputBox"].Text = ""
	Input["_InputBox"].TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	Input["_InputBox"].TextSize = 14
	Input["_InputBox"].BackgroundColor3 = Color3.fromRGB(35.00000171363354, 35.00000171363354, 35.00000171363354)
	Input["_InputBox"].BackgroundTransparency = 1
	Input["_InputBox"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	Input["_InputBox"].BorderSizePixel = 0
	Input["_InputBox"].Position = UDim2.new(9.53674316e-07, 0, 0, 0)
	Input["_InputBox"].Size = UDim2.new(0, 64, 0, 25)
	Input["_InputBox"].ZIndex = 211
	Input["_InputBox"].Name = "InputBox"
	Input["_InputBox"].Parent = Input["_Frame"]

	Input["_UIStroke1"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Input["_UIStroke1"].Color = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
	Input["_UIStroke1"].Parent = Input["_Frame"]
	Input["_UIStroke1"].Thickness = 1
	Input["_UIStroke1"].Transparency = 0.5

	Input["_UICorner1"].CornerRadius = UDim.new(0, 6)
	Input["_UICorner1"].Parent = Input["_Frame"]

	
	Input["_Interact"].MouseButton1Down:Connect(function()
		changeTransparencyState(Input["_UIStroke"], Input["_TextInputElement"], 0.2, 0.8, 0.95)
	end)

	Input["_Interact"].MouseButton1Up:Connect(function()
		changeTransparencyState(Input["_UIStroke"], Input["_TextInputElement"], 0.2, 0.7, 0.93)
	end)

	Input["_Interact"].MouseEnter:Connect(function()
		changeTransparencyState(Input["_UIStroke"], Input["_TextInputElement"], 0.3, 0.7, 0.93)
	end)

	Input["_Interact"].MouseLeave:Connect(function()
		changeTransparencyState(Input["_UIStroke"] ,Input["_TextInputElement"], 0.3, 0.5, 0.9)
	end)
	

	local function updateFrameSize(textBox)
		local parentFrame = textBox.Parent
		local textBounds = textBox.TextBounds

		local newFrameSize = UDim2.new(0, textBounds.X + 16, 0, 24)

		tweenService:Create(parentFrame, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = newFrameSize}):Play()
		tweenService:Create(textBox, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0)}):Play()
	end
	
	-- Logic
	
	updateFrameSize(Input["_InputBox"])
	
	Input["_InputBox"]:GetPropertyChangedSignal("Text"):Connect(function()
		if Type == "Numbers" or Type == "numbers" then
			Input["_InputBox"].Text = Input["_InputBox"].Text:gsub("[^%-%d.]", "")
		elseif Type == "Letters" or Type == "letters" then
			Input["_InputBox"].Text = Input["_InputBox"].Text:gsub("[%d]", "")
		end

		updateFrameSize(Input["_InputBox"])
	end)

	Input["_Interact"].MouseButton1Click:Connect(function()
		Input["_InputBox"]:CaptureFocus()
	end)

	Input["_InputBox"].FocusLost:Connect(function()
		
		if Input["_InputBox"].Text ~= "" then
			task.spawn(function()
				Callback(Input["_InputBox"].Text)
			end)
		end
	end)
	
end

function Elements:CreateSlider(Name, Default, MinimumValue, MaximumValue, Callback)
	local Callback = Callback or function() end
	local Name = Name or "Slider"
	local MinimumValue = MinimumValue or 1
	local MaximumValue = MaximumValue or 50
	local CurrentValue = Default or MinimumValue

	local NewSlider = {
		["_SliderElement"] = Instance.new("Frame");
		["_UICorner"] = Instance.new("UICorner");
		["_Title"] = Instance.new("TextLabel");
		["_UIStroke"] = Instance.new("UIStroke");
		["_Interact"] = Instance.new("TextButton");
		["_SliderContainer"] = Instance.new("Frame");
		["_UICorner1"] = Instance.new("UICorner");
		["_Slider"] = Instance.new("Frame");
		["_UICorner2"] = Instance.new("UICorner");
		["_UIStroke1"] = Instance.new("UIStroke");
		["_SliderValue"] = Instance.new("TextLabel");
	}

	NewSlider["_SliderElement"].BackgroundColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	NewSlider["_SliderElement"].BackgroundTransparency = 0.8999999761581421
	NewSlider["_SliderElement"].BorderSizePixel = 0
	NewSlider["_SliderElement"].Position = UDim2.new(0.0277776178, 0, 0.44582054, 0)
	NewSlider["_SliderElement"].Size = UDim2.new(0, 518, 0, 52)
	NewSlider["_SliderElement"].ZIndex = 205
	NewSlider["_SliderElement"].Name = "SliderElement"
	NewSlider["_SliderElement"].Parent = WindowParent:WaitForChild(newName).Library.Elements.ElementsList

	NewSlider["_UICorner"].CornerRadius = UDim.new(0, 6)
	NewSlider["_UICorner"].Parent = NewSlider["_SliderElement"]

	NewSlider["_Title"].Font = Enum.Font.GothamMedium
	NewSlider["_Title"].Text = Name
	NewSlider["_Title"].TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	NewSlider["_Title"].TextSize = 14
	NewSlider["_Title"].TextWrapped = true
	NewSlider["_Title"].TextXAlignment = Enum.TextXAlignment.Left
	NewSlider["_Title"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NewSlider["_Title"].BackgroundTransparency = 1
	NewSlider["_Title"].BorderSizePixel = 0
	NewSlider["_Title"].Position = UDim2.new(0, 18, 0, 8)
	NewSlider["_Title"].Size = UDim2.new(0, 246, 0, 16)
	NewSlider["_Title"].ZIndex = 205
	NewSlider["_Title"].Name = "Title"
	NewSlider["_Title"].Parent = NewSlider["_SliderElement"]

	NewSlider["_UIStroke"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	NewSlider["_UIStroke"].Color = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
	NewSlider["_UIStroke"].Parent = NewSlider["_SliderElement"]
	NewSlider["_UIStroke"].Thickness = 1
	NewSlider["_UIStroke"].Transparency = 0.5

	NewSlider["_Interact"].Font = Enum.Font.SourceSans
	NewSlider["_Interact"].Text = ""
	NewSlider["_Interact"].TextColor3 = Color3.fromRGB(0, 0, 0)
	NewSlider["_Interact"].TextSize = 14
	NewSlider["_Interact"].TextTransparency = 1
	NewSlider["_Interact"].AnchorPoint = Vector2.new(0.5, 0.5)
	NewSlider["_Interact"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NewSlider["_Interact"].BackgroundTransparency = 1
	NewSlider["_Interact"].BorderSizePixel = 0
	NewSlider["_Interact"].Position = UDim2.new(0.5,0,0.5,0)
	NewSlider["_Interact"].Size = UDim2.new(1,0,1,0)
	NewSlider["_Interact"].ZIndex = 300
	NewSlider["_Interact"].Name = "Interact"
	NewSlider["_Interact"].Parent = NewSlider["_SliderElement"]

	NewSlider["_SliderContainer"].BackgroundColor3 = Color3.fromRGB(45.00000111758709, 45.00000111758709, 45.00000111758709)
	NewSlider["_SliderContainer"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	NewSlider["_SliderContainer"].BorderSizePixel = 0
	NewSlider["_SliderContainer"].ClipsDescendants = true
	NewSlider["_SliderContainer"].Position = UDim2.new(0.0309999995, 0, 0.577000022, 0)
	NewSlider["_SliderContainer"].Size = UDim2.new(0, 485, 0, 14)
	NewSlider["_SliderContainer"].ZIndex = 205
	NewSlider["_SliderContainer"].Name = "SliderContainer"
	NewSlider["_SliderContainer"].Parent = NewSlider["_SliderElement"]

	NewSlider["_UICorner1"].CornerRadius = UDim.new(0, 40)
	NewSlider["_UICorner1"].Parent = NewSlider["_SliderContainer"]

	NewSlider["_Slider"].BackgroundColor3 = Color3.fromRGB(240, 240, 240)
	NewSlider["_Slider"].BackgroundTransparency = 0.6
	NewSlider["_Slider"].BorderColor3 = Color3.fromRGB(0, 0, 0)
	NewSlider["_Slider"].BorderSizePixel = 0
	NewSlider["_Slider"].Size = UDim2.new(0, 0, 0, 14)
	NewSlider["_Slider"].ZIndex = 206
	NewSlider["_Slider"].Name = "Slider"
	NewSlider["_Slider"].Parent = NewSlider["_SliderContainer"]

	NewSlider["_UICorner2"].CornerRadius = UDim.new(0, 40)
	NewSlider["_UICorner2"].Parent = NewSlider["_Slider"]

	NewSlider["_UIStroke1"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	NewSlider["_UIStroke1"].Color = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
	NewSlider["_UIStroke1"].Parent = NewSlider["_SliderContainer"]
	NewSlider["_UIStroke1"].Thickness = 1
	NewSlider["_UIStroke1"].Transparency = 0.5

	NewSlider["_SliderValue"].Font = Enum.Font.GothamMedium
	NewSlider["_SliderValue"].Text = "16"
	NewSlider["_SliderValue"].TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967)
	NewSlider["_SliderValue"].TextSize = 14
	NewSlider["_SliderValue"].TextTransparency = 0.6000000238418579
	NewSlider["_SliderValue"].TextWrapped = true
	NewSlider["_SliderValue"].TextXAlignment = Enum.TextXAlignment.Right
	NewSlider["_SliderValue"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NewSlider["_SliderValue"].BackgroundTransparency = 1
	NewSlider["_SliderValue"].BorderSizePixel = 0
	NewSlider["_SliderValue"].Position = UDim2.new(0, 501, 0, 8)
	NewSlider["_SliderValue"].Size = UDim2.new(0, -237, 0, 16)
	NewSlider["_SliderValue"].ZIndex = 205
	NewSlider["_SliderValue"].Name = "SliderValue"
	NewSlider["_SliderValue"].Parent = NewSlider["_SliderElement"]
	
	-- Logic
	NewSlider["_Interact"].MouseEnter:Connect(function()
		changeTransparencyState(NewSlider["_UIStroke"], NewSlider["_SliderElement"], 0.3, 0.7, 0.93)
	end)

	NewSlider["_Interact"].MouseLeave:Connect(function()
		changeTransparencyState(NewSlider["_UIStroke"] ,NewSlider["_SliderElement"], 0.3, 0.5, 0.9)
	end)

	local Mouse = Players.LocalPlayer:GetMouse()

	local function UpdateSlider()
		task.spawn(function()
			Callback(math.round(CurrentValue))
		end)

		local Value = ((CurrentValue - MinimumValue) / (MaximumValue - MinimumValue)) * NewSlider["_SliderContainer"].AbsoluteSize.X
		Tween(NewSlider["_Slider"], {Size = UDim2.new(0, math.clamp(Value, 0, NewSlider["_SliderContainer"].AbsoluteSize.X), 0, NewSlider["_SliderContainer"].AbsoluteSize.Y)}, 0.15)
	end


	local function UpdateText()
		NewSlider["_SliderValue"].Text = tostring(math.round(CurrentValue))
	end
	
	if Default then
		UpdateSlider()
		UpdateText()
	end
	
	-- Using function so we can set default later
	local function Fire()
		local MovingConnection
		local ReleasedConnection

		local function UpdateFromMouse()
			local MouseX = math.clamp(Mouse.X - NewSlider["_SliderContainer"].AbsolutePosition.X, 0, NewSlider["_SliderContainer"].AbsoluteSize.X)
			local Value = (MouseX / NewSlider["_SliderContainer"].AbsoluteSize.X) * (MaximumValue - MinimumValue) + MinimumValue
			CurrentValue = math.round(Value)
			UpdateSlider()
			UpdateText()
		end

		MovingConnection = Mouse.Move:Connect(UpdateFromMouse)
		ReleasedConnection = UserInputService.InputEnded:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				MovingConnection:Disconnect()
				ReleasedConnection:Disconnect()
			end
		end)

		UpdateFromMouse()
	end


	NewSlider["_Interact"].MouseButton1Down:Connect(Fire)
	end

return Library
