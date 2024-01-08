--[[
BETA MODULE FOR ROBLOX STUDIO (Test handler)

Module and Module handler made by biggaboy212
]]

local Library = require(script.LibraryModule)
local Player = game.Players.LocalPlayer

local jump

local function boostSpeed(Amount)
	local Character = Player.Character or Player.CharacterAdded:Wait()
	local Humanoid = Character:WaitForChild("Humanoid")
	Humanoid.WalkSpeed = Amount
end



local Window = Library:CreateWindow('ProtonV UI Library')

----

Library:NewSection('Main Section')

----

local ToolsButton = Library.Elements:CreateButton('Give all tools', 'Gives you every tool in the game', function()
	-- game.ReplicatedStorage.MainEvent:FireServer()
end)

----

local InfjumpToggle = Library.Elements:CreateToggle('Infinite Jump', false, function(Value)
	local Character = Player.Character or Player.CharacterAdded:Wait()
	if Character then
		local Humanoid = Character:WaitForChild("Humanoid")
		local function jumpRequest()
			if Value then
				Humanoid:ChangeState("Jumping")
			end
		end

		if Value then
			if not jump then
				jump = game:GetService("UserInputService").JumpRequest:Connect(jumpRequest)
			end
		else
			if jump then
				jump:Disconnect()
				jump = nil
			end
		end
	end
end)

----

local WalkspeedInput = Library.Elements:CreateSlider('Walkspeed', 16, 0, 100, function(Value)
	local Character = Player.Character
	if Character then
		boostSpeed(Value)
	end
end)

----

local FloatInput = Library.Elements:CreateInput('Float', 'Amount', 'Numbers', function(Value)
	local Character = Player.Character or Player.CharacterAdded:Wait()
	
	if Character then
		Character:WaitForChild("Humanoid").HipHeight = Value
	end
end)

----

Library:NewSection('Test Section')
local PrintButton = Library.Elements:CreateButton('Print "Hello World!"', 'Prints "Hello World!" to the output.', function()
	print("Hello World!")
end)

----

local PrintToggle = Library.Elements:CreateToggle('Print State', true, function(Value)
	print(Value)
end)

----

Library:InsertSeperation()

----

local PrintInput = Library.Elements:CreateInput('Print Input', 'Input', 'All', function(Value)
	print(Value)
end)

--------

local PrintSlider = Library.Elements:CreateSlider('Print Value', 50,0,350, function(Value)
	print(Value)
end)


--[[
 ['Documentation']


~~ Create Window ~~

PARAMETERS: Name

~Descriptions~
Name: Name of Window

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

~~ NewSection ~~
PARAMETERS: Name

~~Descriptions~~
Name: Name of the section

Inserts a new function to seperate different Elements from eachother
Use this function between the elements you want to seperate

**** !!!WARNING!!! ****
If no Section is added before your first element in a tab, then the first Element will be clipped at the top


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


~~ InsertSeperation ~~

~Descriptions~
Inserts a blank section to mildly seperate elements, use this if you want the elements to be in the same section, but stil be seperated
Use this function between the elements you want to seperate


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


~~ Button Element ~~

PARAMETERS: Name, Description, Callback

~Descriptions~
Window: The window that the Element parents to
Name: Name of the Element.
Description: Description of Element
Callback: Callback after Input


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


~~ Toggle Element ~~

PARAMETERS: Name, Default, Callback

~Descriptions~
Name: Name of the Element.
Default: Sets the default toggle state
Callback: Callback after Input


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


~~ Slider Element ~~

PARAMETERS: Name, Default, MinimumValue, MaximumValue, Callback

~Descriptions~
Name: Name of the Element.
Default: The default value the slider is set to
MinimumValue: The minimum value you can slide to
MaximumValue: The maximum value you can slide to
Callback: Callback after Input


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------


~~ Input Element ~~

PARAMETERS: Name, Placeholder, Type, Callback

~Descriptions~
Name: Name of the Element.
Placeholder: Sets PlaceholderText of Element
Type: Type of Input, Rejects any input other than set type. ('All', 'Numbers', 'Letters') Use 'All' to allow all input.
Callback: Callback after Input
]]
