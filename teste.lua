local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/biggaboy212/ProtonV-UI-Library/main/test.lua'))()
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local jump

function boostSpeed(Amount)
	do
		Character:WaitForChild("Humanoid").WalkSpeed = Amount
	end
end

--[[
~~ Create Window ~~

PARAMETERS: Name

~Descriptions~
Name: Name of Window
]]

local Window = Library:CreateWindow('ProtonV UI Library')

--[[ 
~~ Button Element ~~

PARAMETERS: Name, Description, Callback

~Descriptions~
Name: Name of the Element.
Description: Description of Element
Callback: Callback after Input
]]

local Button = Library.Elements:CreateButton('Respawn','Respawns your character', function()
	Character:BreakJoints()
end)

--[[ 
~~ Toggle Element ~~

PARAMETERS: Name, Default, Callback

~Descriptions~
Name: Name of the Element.
Default: Sets the default toggle state
Callback: Callback after Input
]]

local Toggle = Library.Elements:CreateToggle('Infinite Jump', false, function(Value)
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
end)


--[[ 
~~ Input Element ~~

PARAMETERS: Name, Placeholder, Type, Callback

~Descriptions~
Name: Name of the Element.
Placeholder: Sets PlaceholderText of Element
Type: Type of Input, Rejects any input other than set type. ('All', 'Numbers', 'Letters') Use 'All' to allow all input.
Callback: Callback after Input
]]

local Input = Library.Elements:CreateInput('Walkspeed', 'Amount', 'Numbers', function(Value)
	boostSpeed(Value)
end)
