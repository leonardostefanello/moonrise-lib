------------------------------//Services//------------------------------
local MoonriseLib = {}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")

----------//Info//----------
local pfp
local user
local tag
local userinfo = {}

----------//SWFL-Phone//----------
local phoneUI = LocalPlayer.PlayerGui.phoneUI
local homeF = LocalPlayer.PlayerGui.phoneUI.screenF.screenFrame.homeF

----------//Functions//----------
pcall(function()
	userinfo = HttpService:JSONDecode(readfile("moonrisephoneinfo.txt"));
end)

pfp = userinfo["pfp"] or "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"
user =  userinfo["user"] or game.Players.LocalPlayer.Name
tag = userinfo["tag"] or tostring(math.random(1000,9999))

local function SaveInfo()
	userinfo["pfp"] = pfp
	userinfo["user"] = user
	userinfo["tag"] = tag
	writefile("moonrisephoneinfo.txt", HttpService:JSONEncode(userinfo));
end

----------//Icons//----------
--Feather Icons https://github.com/evoincorp/lucideblox/tree/master/src/modules/util - Created by 7kayoh
local Icons = {}
local Success, Response = pcall(function()
	Icons = HttpService:JSONDecode(game:HttpGetAsync("https://raw.githubusercontent.com/evoincorp/lucideblox/master/src/modules/util/icons.json")).icons
end)

if not Success then
	warn("\Moonrise Library - Failed to load Feather Icons. Error code: " .. Response .. "\n")
end	

local function GetIcon(IconName)
	if Icons[IconName] ~= nil then
		return Icons[IconName]
	else
		return nil
	end
end   

------------------------------//UI//------------------------------
local Moonrise = Instance.new("ScreenGui")
Moonrise.Name = "Moonrise"
Moonrise.Parent = game.CoreGui
Moonrise.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

--//app folder 1
local msApps1 = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")

msApps1.Name = "msApps1"
msApps1.Parent = homeF.appButtons
msApps1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
msApps1.BackgroundTransparency = 1.000
msApps1.BorderSizePixel = 0
msApps1.ClipsDescendants = true
msApps1.Position = UDim2.new(0.0620429032, 0, 0.209715754, 0)
msApps1.Size = UDim2.new(0.400914609, 0, 0.65028429, 0)
msApps1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
--UIGridLayout
UIGridLayout.Parent = msApps1
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0.126000002, 0, 0.064000003, 0)
UIGridLayout.CellSize = UDim2.new(0, 40, 0, 41)

--//app folder 2
local msApps2 = Instance.new("Frame")
local UIGridLayout2 = Instance.new("UIGridLayout")

msApps2.Name = "msApps2"
msApps2.Parent = homeF.appButtons
msApps2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
msApps2.BackgroundTransparency = 1.000
msApps2.BorderSizePixel = 0
msApps2.ClipsDescendants = true
msApps2.Position = UDim2.new(0.537042737, 0, 0.209715694, 0)
msApps2.Size = UDim2.new(0.400913656, 0, 0.65028429, 0)
msApps2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
--UIGridLayout2
UIGridLayout2.Parent = msApps2
UIGridLayout2.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout2.CellPadding = UDim2.new(0.126000002, 0, 0.064000003, 0)
UIGridLayout2.CellSize = UDim2.new(0, 40, 0, 41)

--//app folder REWRITE
local msNew = Instance.new("Frame")

msNew.Name = "msNew"
msNew.Parent = homeF.appButtons
msNew.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
msNew.BackgroundTransparency = 1.000
msNew.BorderSizePixel = 0
msNew.ClipsDescendants = true
msNew.Size = UDim2.new(1, 0, 1, 0)
msNew.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

--//pages folder
local msPages = Instance.new("Frame")

msPages.Name = "msPages"
msPages.Parent = homeF.apps
msPages.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
msPages.BackgroundTransparency = 1.000
msPages.BorderSizePixel = 0
msPages.ClipsDescendants = true
msPages.Size = UDim2.new(1, 0, 1, 0)
msPages.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

------------------------------//functions//------------------------------
--//make app
function MoonriseLib:App(Name, Icon, Parent)
	local NewApp = Instance.new("Frame")
	local appIcon = Instance.new("ImageButton")
	local appName = Instance.new("TextLabel")
	local UICorner = Instance.new("UICorner")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	NewApp.Name = string.lower(Name).."App"
	NewApp.Parent = Parent
	NewApp.AnchorPoint = Vector2.new(0.5, 0.5)
	NewApp.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	NewApp.BackgroundTransparency = 1.000
	NewApp.BorderSizePixel = 0
	NewApp.Position = UDim2.new(0.150000006, 0, 0.25, 0)
	NewApp.Size = UDim2.new(0.175914049, 0, 0.0806562379, 0)

	appIcon.Name = "appIcon"
	appIcon.Parent = NewApp
	appIcon.AnchorPoint = Vector2.new(0.5, 0.5)
	appIcon.BackgroundTransparency = 1
	appIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
	appIcon.Size = UDim2.new(1, 0, 1, 0)
	appIcon.Image = "rbxassetid://"..tostring(Icon)
	--UICorner
	UICorner.CornerRadius = UDim.new(0.25, 0)
	UICorner.Parent = appIcon

	appName.Name = "appName"
	appName.Parent = NewApp
	appName.AnchorPoint = Vector2.new(0.5, 0)
	appName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	appName.BackgroundTransparency = 1.000
	appName.Position = UDim2.new(0.5, 0, 1.04999995, 0)
	appName.Size = UDim2.new(1, 0, 0.280000001, 0)
	appName.Text = Name
	appName.TextColor3 = Color3.fromRGB(255, 255, 255)
	appName.TextScaled = true
	appName.TextSize = 14.000
	appName.TextStrokeTransparency = 0.900
	appName.TextWrapped = true
	--UIAspectRatioConstraint
	UIAspectRatioConstraint.Parent = NewApp

	--//make page
	local NewPage = Instance.new("Frame")
	local ItemContainer = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	local bar = Instance.new("Frame")
	local close = Instance.new("TextButton")
	local closeframe = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local title = Instance.new("TextLabel")

	NewPage.Name = string.lower(Name).."Page"
	NewPage.Parent = msPages
	NewPage.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	NewPage.BorderSizePixel = 0
	NewPage.ClipsDescendants = true
	NewPage.Size = UDim2.new(1, 0, 1, 0)
	NewPage.Visible = false
	NewPage.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	ItemContainer.Name = "ItemContainer"
	ItemContainer.Parent = NewPage
	ItemContainer.Active = true
	ItemContainer.AnchorPoint = Vector2.new(1, 1)
	ItemContainer.BackgroundTransparency = 1.000
	ItemContainer.BorderSizePixel = 0
	ItemContainer.Position = UDim2.new(1, 0, 1.00000012, 0)
	ItemContainer.Size = UDim2.new(1, 0, 0.8580001, 0)
	ItemContainer.BottomImage = "rbxassetid://7445543667"
	ItemContainer.CanvasSize = UDim2.new(0, 0, 0, 476)
	ItemContainer.MidImage = "rbxassetid://7445543667"
	ItemContainer.ScrollBarThickness = 5
	ItemContainer.TopImage = "rbxassetid://7445543667"
	--UIListLayout
	UIListLayout.Parent = ItemContainer
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 6)
	--UIPadding
	UIPadding.Parent = ItemContainer
	UIPadding.PaddingBottom = UDim.new(0, 15)
	UIPadding.PaddingLeft = UDim.new(0, 10)
	UIPadding.PaddingRight = UDim.new(0, 10)
	UIPadding.PaddingTop = UDim.new(0, 15)

	--bar
	bar.Name = "bar"
	bar.Parent = NewPage
	bar.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	bar.BorderSizePixel = 0
	bar.Position = UDim2.new(0, 0, 0.140000001, 0)
	bar.Size = UDim2.new(1.00000024, 0, 0, 1)

	--close
	close.Name = "close"
	close.Parent = NewPage
	close.AnchorPoint = Vector2.new(0.5, 1)
	close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	close.BackgroundTransparency = 1.000
	close.BorderSizePixel = 0
	close.Position = UDim2.new(0.5, 0, 0.995000005, 0)
	close.Size = UDim2.new(0.449999988, 0, 0.0299999993, 0)
	close.ZIndex = 2
	close.Text = ""
	close.TextColor3 = Color3.fromRGB(0, 0, 0)
	close.TextSize = 14.000
	close.TextTransparency = 1.000
	--frame
	closeframe.Parent = close
	closeframe.AnchorPoint = Vector2.new(0.5, 0.5)
	closeframe.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	closeframe.Position = UDim2.new(0.5, 0, 0.5, 0)
	closeframe.Size = UDim2.new(0.771274865, 0, 0.29065311, 0)
	--UICorner
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = closeframe

	--title
	title.Name = "title"
	title.Parent = NewPage
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1.000
	title.BorderSizePixel = 0
	title.Position = UDim2.new(0.061999999, 0, 0.0759999976, 0)
	title.Size = UDim2.new(0.873638749, 0, 0.049708873, 0)
	title.Text = "Market"
	title.TextColor3 = Color3.fromRGB(240, 240, 240)
	title.TextScaled = true
	title.TextSize = 14.000
	title.TextWrapped = true


	--//Content (Buttons Inside Page)
	local PageContent = {}
	function PageContent:Button(text, callback)
		local Button = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local TextButton = Instance.new("TextButton")
		local ImageLabel = Instance.new("ImageLabel")
		local Content = Instance.new("TextLabel")

		Button.Name = "Button"
		Button.Parent = ItemContainer
		Button.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
		Button.BorderSizePixel = 0
		Button.LayoutOrder = 1
		Button.Position = UDim2.new(0.0619999915, 0, 0.093539156, 0)
		Button.Size = UDim2.new(1, 0, -0.00600000005, 33)
		--TextButton
		TextButton.Parent = Button
		TextButton.BackgroundTransparency = 1.000
		TextButton.BorderSizePixel = 0
		TextButton.Size = UDim2.new(1, 0, 1, 0)
		TextButton.AutoButtonColor = false
		TextButton.Text = ""
		--UICorner
		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = Button
		--UIStroke
		UIStroke.Color = Color3.fromRGB(60, 60, 60)
		UIStroke.Parent = Button
		--ImageLabel
		ImageLabel.Parent = Button
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.Position = UDim2.new(1.00000024, -30, -0.0328351967, 7)
		ImageLabel.Size = UDim2.new(0, 20, 0, 20)
		ImageLabel.Image = "rbxassetid://3944703587"
		ImageLabel.ImageColor3 = Color3.fromRGB(150, 150, 150)
		--Content
		Content.Name = "Content"
		Content.Parent = Button
		Content.BackgroundTransparency = 1.000
		Content.Position = UDim2.new(0, 12, 0, 0)
		Content.Size = UDim2.new(1, -12, 1, 0)
		Content.Text = text
		Content.TextColor3 = Color3.fromRGB(240, 240, 240)
		Content.TextSize = 12.000
		Content.TextWrapped = true
		Content.TextXAlignment = Enum.TextXAlignment.Left

		Button.MouseEnter:Connect(function()
			TweenService:Create(
				Button, 
				TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
			):Play()
		end)

		Button.MouseButton1Up:Connect(function()
			pcall(callback)
			TweenService:Create(
				Button, 
				TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
			):Play()
		end)

		Button.MouseButton1Down:Connect(function()
			TweenService:Create(
				Button, 
				TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(38, 38, 38)}
			):Play()
		end)

		Button.MouseLeave:Connect(function()
			TweenService:Create(
				Button, 
				TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(32, 32, 32)}
			):Play()
		end)
	end
	function PageContent:Toggle(text,default,callback)
		local toggled = false
		local Toggle = Instance.new("TextButton")
		local ToggleTitle = Instance.new("TextLabel")
		local ToggleFrame = Instance.new("Frame")
		local ToggleFrameCorner = Instance.new("UICorner")
		local ToggleFrameCircle = Instance.new("Frame")
		local ToggleFrameCircleCorner = Instance.new("UICorner")
		local Icon = Instance.new("ImageLabel")

		Toggle.Name = "Toggle"
		Toggle.Parent = ItemContainer
		Toggle.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
		Toggle.BorderSizePixel = 0
		Toggle.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
		Toggle.Size = UDim2.new(0, 401, 0, 30)
		Toggle.AutoButtonColor = false
		Toggle.Font = Enum.Font.Gotham
		Toggle.Text = ""
		Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
		Toggle.TextSize = 14.000

		ToggleTitle.Name = "ToggleTitle"
		ToggleTitle.Parent = Toggle
		ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToggleTitle.BackgroundTransparency = 1.000
		ToggleTitle.Position = UDim2.new(0, 5, 0, 0)
		ToggleTitle.Size = UDim2.new(0, 200, 0, 30)
		ToggleTitle.Font = Enum.Font.Gotham
		ToggleTitle.Text = text
		ToggleTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
		ToggleTitle.TextSize = 14.000
		ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

		ToggleFrame.Name = "ToggleFrame"
		ToggleFrame.Parent = Toggle
		ToggleFrame.BackgroundColor3 = Color3.fromRGB(114, 118, 125)
		ToggleFrame.Position = UDim2.new(0.900481343, -5, 0.13300018, 0)
		ToggleFrame.Size = UDim2.new(0, 40, 0, 21)

		ToggleFrameCorner.CornerRadius = UDim.new(1, 8)
		ToggleFrameCorner.Name = "ToggleFrameCorner"
		ToggleFrameCorner.Parent = ToggleFrame

		ToggleFrameCircle.Name = "ToggleFrameCircle"
		ToggleFrameCircle.Parent = ToggleFrame
		ToggleFrameCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToggleFrameCircle.Position = UDim2.new(0.234999999, -5, 0.133000001, 0)
		ToggleFrameCircle.Size = UDim2.new(0, 15, 0, 15)

		ToggleFrameCircleCorner.CornerRadius = UDim.new(1, 0)
		ToggleFrameCircleCorner.Name = "ToggleFrameCircleCorner"
		ToggleFrameCircleCorner.Parent = ToggleFrameCircle

		Icon.Name = "Icon"
		Icon.Parent = ToggleFrameCircle
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(27, 42, 53)
		Icon.Position = UDim2.new(0, 8, 0, 8)
		Icon.Size = UDim2.new(0, 13, 0, 13)
		Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
		Icon.ImageColor3 = Color3.fromRGB(114, 118, 125)

		Toggle.MouseButton1Click:Connect(function()
			if toggled == false then
				TweenService:Create(
					Icon,
					TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ImageColor3 = Color3.fromRGB(67,181,129)}
				):Play()
				TweenService:Create(
					ToggleFrame,
					TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundColor3 = Color3.fromRGB(67,181,129)}
				):Play()
				ToggleFrameCircle:TweenPosition(UDim2.new(0.655, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
				TweenService:Create(
					Icon,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ImageTransparency = 1}
				):Play()
				Icon.Image = "http://www.roblox.com/asset/?id=6023426926"
				wait(.1)
				TweenService:Create(
					Icon,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ImageTransparency = 0}
				):Play()
			else
				TweenService:Create(
					Icon,
					TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ImageColor3 = Color3.fromRGB(114, 118, 125)}
				):Play()
				TweenService:Create(
					ToggleFrame,
					TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundColor3 = Color3.fromRGB(114, 118, 125)}
				):Play()
				ToggleFrameCircle:TweenPosition(UDim2.new(0.234999999, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
				TweenService:Create(
					Icon,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ImageTransparency = 1}
				):Play()
				Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
				wait(.1)
				TweenService:Create(
					Icon,
					TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ImageTransparency = 0}
				):Play()
			end
			toggled = not toggled
			pcall(callback, toggled)
		end)
	end

	function PageContent:Slider(text, min, max, start, callback)
		local SliderFunc = {}
		local dragging = false
		local Slider = Instance.new("TextButton")
		local SliderTitle = Instance.new("TextLabel")
		local SliderFrame = Instance.new("Frame")
		local SliderFrameCorner = Instance.new("UICorner")
		local CurrentValueFrame = Instance.new("Frame")
		local CurrentValueFrameCorner = Instance.new("UICorner")
		local Zip = Instance.new("Frame")
		local ZipCorner = Instance.new("UICorner")
		local ValueBubble = Instance.new("Frame")
		local ValueBubbleCorner = Instance.new("UICorner")
		local SquareBubble = Instance.new("Frame")
		local GlowBubble = Instance.new("ImageLabel")
		local ValueLabel = Instance.new("TextLabel")


		Slider.Name = "Slider"
		Slider.Parent = ItemContainer
		Slider.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
		Slider.BorderSizePixel = 0
		Slider.Position = UDim2.new(0, 0, 0.216560602, 0)
		Slider.Size = UDim2.new(0, 401, 0, 38)
		Slider.AutoButtonColor = false
		Slider.Font = Enum.Font.Gotham
		Slider.Text = ""
		Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
		Slider.TextSize = 14.000

		SliderTitle.Name = "SliderTitle"
		SliderTitle.Parent = Slider
		SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderTitle.BackgroundTransparency = 1.000
		SliderTitle.Position = UDim2.new(0, 5, 0, -4)
		SliderTitle.Size = UDim2.new(0, 200, 0, 27)
		SliderTitle.Font = Enum.Font.Gotham
		SliderTitle.Text = text
		SliderTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
		SliderTitle.TextSize = 14.000
		SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

		SliderFrame.Name = "SliderFrame"
		SliderFrame.Parent = Slider
		SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		SliderFrame.BackgroundColor3 = Color3.fromRGB(79, 84, 92)
		SliderFrame.Position = UDim2.new(0.497999996, 0, 0.757000029, 0)
		SliderFrame.Size = UDim2.new(0, 385, 0, 8)

		SliderFrameCorner.Name = "SliderFrameCorner"
		SliderFrameCorner.Parent = SliderFrame

		CurrentValueFrame.Name = "CurrentValueFrame"
		CurrentValueFrame.Parent = SliderFrame
		CurrentValueFrame.BackgroundColor3 = Color3.fromRGB(114, 137, 218)
		CurrentValueFrame.Size = UDim2.new((start or 0) / max, 0, 0, 8)

		CurrentValueFrameCorner.Name = "CurrentValueFrameCorner"
		CurrentValueFrameCorner.Parent = CurrentValueFrame

		Zip.Name = "Zip"
		Zip.Parent = SliderFrame
		Zip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Zip.Position = UDim2.new((start or 0)/max, -6,-0.644999981, 0)
		Zip.Size = UDim2.new(0, 10, 0, 18)
		ZipCorner.CornerRadius = UDim.new(0, 3)
		ZipCorner.Name = "ZipCorner"
		ZipCorner.Parent = Zip

		ValueBubble.Name = "ValueBubble"
		ValueBubble.Parent = Zip
		ValueBubble.AnchorPoint = Vector2.new(0.5, 0.5)
		ValueBubble.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
		ValueBubble.Position = UDim2.new(0.5, 0, -1.00800002, 0)
		ValueBubble.Size = UDim2.new(0, 36, 0, 21)
		ValueBubble.Visible = false


		Zip.MouseEnter:Connect(function()
			if dragging == false then
				ValueBubble.Visible = true
			end
		end)

		Zip.MouseLeave:Connect(function()
			if dragging == false then
				ValueBubble.Visible = false
			end
		end)


		ValueBubbleCorner.CornerRadius = UDim.new(0, 3)
		ValueBubbleCorner.Name = "ValueBubbleCorner"
		ValueBubbleCorner.Parent = ValueBubble

		SquareBubble.Name = "SquareBubble"
		SquareBubble.Parent = ValueBubble
		SquareBubble.AnchorPoint = Vector2.new(0.5, 0.5)
		SquareBubble.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
		SquareBubble.BorderSizePixel = 0
		SquareBubble.Position = UDim2.new(0.493000001, 0, 0.637999971, 0)
		SquareBubble.Rotation = 45.000
		SquareBubble.Size = UDim2.new(0, 19, 0, 19)

		GlowBubble.Name = "GlowBubble"
		GlowBubble.Parent = ValueBubble
		GlowBubble.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		GlowBubble.BackgroundTransparency = 1.000
		GlowBubble.BorderSizePixel = 0
		GlowBubble.Position = UDim2.new(0, -15, 0, -15)
		GlowBubble.Size = UDim2.new(1, 30, 1, 30)
		GlowBubble.ZIndex = 0
		GlowBubble.Image = "rbxassetid://4996891970"
		GlowBubble.ImageColor3 = Color3.fromRGB(15, 15, 15)
		GlowBubble.ScaleType = Enum.ScaleType.Slice
		GlowBubble.SliceCenter = Rect.new(20, 20, 280, 280)

		ValueLabel.Name = "ValueLabel"
		ValueLabel.Parent = ValueBubble
		ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ValueLabel.BackgroundTransparency = 1.000
		ValueLabel.Size = UDim2.new(0, 36, 0, 21)
		ValueLabel.Font = Enum.Font.Gotham
		ValueLabel.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
		ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		ValueLabel.TextSize = 10.000
		local function move(input)
			local pos =
				UDim2.new(
					math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
					-6,
					-0.644999981,
					0
				)
			local pos1 =
				UDim2.new(
					math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
					0,
					0,
					8
				)
			CurrentValueFrame.Size = pos1
			Zip.Position = pos
			local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
			ValueLabel.Text = tostring(value)
			pcall(callback, value)
		end
		Zip.InputBegan:Connect(
			function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true
					ValueBubble.Visible = true
				end
			end
		)
		Zip.InputEnded:Connect(
			function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
					ValueBubble.Visible = false
				end
			end
		)
		game:GetService("UserInputService").InputChanged:Connect(
		function(input)
			if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
				move(input)
			end
		end
		)

		function SliderFunc:Change(tochange)
			CurrentValueFrame.Size = UDim2.new((tochange or 0) / max, 0, 0, 8)
			Zip.Position = UDim2.new((tochange or 0)/max, -6,-0.644999981, 0)
			ValueLabel.Text = tostring(tochange and math.floor((tochange / max) * (max - min) + min) or 0)
			pcall(callback, tochange)
		end

		return SliderFunc
	end
	function PageContent:Seperator()
		local Seperator1 = Instance.new("Frame")
		local Seperator2 = Instance.new("Frame")

		Seperator1.Name = "Seperator1"
		Seperator1.Parent = ItemContainer
		Seperator1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Seperator1.BackgroundTransparency = 1.000
		Seperator1.Position = UDim2.new(0, 0, 0.350318581, 0)
		Seperator1.Size = UDim2.new(0, 100, 0, 8)

		Seperator2.Name = "Seperator2"
		Seperator2.Parent = Seperator1
		Seperator2.BackgroundColor3 = Color3.fromRGB(66, 69, 74)
		Seperator2.BorderSizePixel = 0
		Seperator2.Position = UDim2.new(0, 0, 0, 4)
		Seperator2.Size = UDim2.new(0, 401, 0, 1)
	end
	function PageContent:Dropdown(text, list, callback)
		local DropFunc = {}
		local itemcount = 0
		local framesize = 0
		local DropTog = false
		local Dropdown = Instance.new("Frame")
		local DropdownTitle = Instance.new("TextLabel")
		local DropdownFrameOutline = Instance.new("Frame")
		local DropdownFrameOutlineCorner = Instance.new("UICorner")
		local DropdownFrame = Instance.new("Frame")
		local DropdownFrameCorner = Instance.new("UICorner")
		local CurrentSelectedText = Instance.new("TextLabel")
		local ArrowImg = Instance.new("ImageLabel")
		local DropdownFrameBtn = Instance.new("TextButton")

		Dropdown.Name = "Dropdown"
		Dropdown.Parent = ItemContainer
		Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Dropdown.BackgroundTransparency = 1.000
		Dropdown.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
		Dropdown.Size = UDim2.new(0, 403, 0, 73)

		DropdownTitle.Name = "DropdownTitle"
		DropdownTitle.Parent = Dropdown
		DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		DropdownTitle.BackgroundTransparency = 1.000
		DropdownTitle.Position = UDim2.new(0, 5, 0, 0)
		DropdownTitle.Size = UDim2.new(0, 200, 0, 29)
		DropdownTitle.Font = Enum.Font.Gotham
		DropdownTitle.Text = text
		DropdownTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
		DropdownTitle.TextSize = 14.000
		DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left

		DropdownFrameOutline.Name = "DropdownFrameOutline"
		DropdownFrameOutline.Parent = DropdownTitle
		DropdownFrameOutline.AnchorPoint = Vector2.new(0.5, 0.5)
		DropdownFrameOutline.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
		DropdownFrameOutline.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
		DropdownFrameOutline.Size = UDim2.new(0, 396, 0, 36)

		DropdownFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
		DropdownFrameOutlineCorner.Name = "DropdownFrameOutlineCorner"
		DropdownFrameOutlineCorner.Parent = DropdownFrameOutline

		DropdownFrame.Name = "DropdownFrame"
		DropdownFrame.Parent = DropdownTitle
		DropdownFrame.BackgroundColor3 = Color3.fromRGB(48, 51, 57)
		DropdownFrame.ClipsDescendants = true
		DropdownFrame.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
		DropdownFrame.Selectable = true
		DropdownFrame.Size = UDim2.new(0, 392, 0, 32)

		DropdownFrameCorner.CornerRadius = UDim.new(0, 3)
		DropdownFrameCorner.Name = "DropdownFrameCorner"
		DropdownFrameCorner.Parent = DropdownFrame

		CurrentSelectedText.Name = "CurrentSelectedText"
		CurrentSelectedText.Parent = DropdownFrame
		CurrentSelectedText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CurrentSelectedText.BackgroundTransparency = 1.000
		CurrentSelectedText.Position = UDim2.new(0.0178571437, 0, 0, 0)
		CurrentSelectedText.Size = UDim2.new(0, 193, 0, 32)
		CurrentSelectedText.Font = Enum.Font.Gotham
		CurrentSelectedText.Text = "..."
		CurrentSelectedText.TextColor3 = Color3.fromRGB(212, 212, 212)
		CurrentSelectedText.TextSize = 14.000
		CurrentSelectedText.TextXAlignment = Enum.TextXAlignment.Left

		ArrowImg.Name = "ArrowImg"
		ArrowImg.Parent = CurrentSelectedText
		ArrowImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ArrowImg.BackgroundTransparency = 1.000
		ArrowImg.Position = UDim2.new(1.84974098, 0, 0.167428851, 0)
		ArrowImg.Size = UDim2.new(0, 22, 0, 22)
		ArrowImg.Image = "http://www.roblox.com/asset/?id=6034818372"
		ArrowImg.ImageColor3 = Color3.fromRGB(212, 212, 212)

		DropdownFrameBtn.Name = "DropdownFrameBtn"
		DropdownFrameBtn.Parent = DropdownFrame
		DropdownFrameBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		DropdownFrameBtn.BackgroundTransparency = 1.000
		DropdownFrameBtn.Size = UDim2.new(0, 392, 0, 32)
		DropdownFrameBtn.Font = Enum.Font.SourceSans
		DropdownFrameBtn.Text = ""
		DropdownFrameBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
		DropdownFrameBtn.TextSize = 14.000

		local DropdownFrameMainOutline = Instance.new("Frame")
		local DropdownFrameMainOutlineCorner = Instance.new("UICorner")
		local DropdownFrameMain = Instance.new("Frame")
		local DropdownFrameMainCorner = Instance.new("UICorner")
		local DropItemHolderLabel = Instance.new("TextLabel")
		local DropItemHolder = Instance.new("ScrollingFrame")
		local DropItemHolderLayout = Instance.new("UIListLayout")

		DropdownFrameMainOutline.Name = "DropdownFrameMainOutline"
		DropdownFrameMainOutline.Parent = DropdownTitle
		DropdownFrameMainOutline.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
		DropdownFrameMainOutline.Position = UDim2.new(-0.00155700743, 0, 2.16983342, 0)
		DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, 81)
		DropdownFrameMainOutline.Visible = false

		DropdownFrameMainOutlineCorner.CornerRadius = UDim.new(0, 3)
		DropdownFrameMainOutlineCorner.Name = "DropdownFrameMainOutlineCorner"
		DropdownFrameMainOutlineCorner.Parent = DropdownFrameMainOutline

		DropdownFrameMain.Name = "DropdownFrameMain"
		DropdownFrameMain.Parent = DropdownTitle
		DropdownFrameMain.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
		DropdownFrameMain.ClipsDescendants = true
		DropdownFrameMain.Position = UDim2.new(0.00999999978, 0, 2.2568965, 0)
		DropdownFrameMain.Selectable = true
		DropdownFrameMain.Size = UDim2.new(0, 392, 0, 77)
		DropdownFrameMain.Visible = false

		DropdownFrameMainCorner.CornerRadius = UDim.new(0, 3)
		DropdownFrameMainCorner.Name = "DropdownFrameMainCorner"
		DropdownFrameMainCorner.Parent = DropdownFrameMain

		DropItemHolderLabel.Name = "ItemHolderLabel"
		DropItemHolderLabel.Parent = DropdownFrameMain
		DropItemHolderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		DropItemHolderLabel.BackgroundTransparency = 1.000
		DropItemHolderLabel.Position = UDim2.new(0.0178571437, 0, 0, 0)
		DropItemHolderLabel.Size = UDim2.new(0, 193, 0, 13)
		DropItemHolderLabel.Font = Enum.Font.Gotham
		DropItemHolderLabel.Text = ""
		DropItemHolderLabel.TextColor3 = Color3.fromRGB(212, 212, 212)
		DropItemHolderLabel.TextSize = 14.000
		DropItemHolderLabel.TextXAlignment = Enum.TextXAlignment.Left

		DropItemHolder.Name = "ItemHolder"
		DropItemHolder.Parent = DropItemHolderLabel
		DropItemHolder.Active = true
		DropItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		DropItemHolder.BackgroundTransparency = 1.000
		DropItemHolder.Position = UDim2.new(0, 0, 0.215384638, 0)
		DropItemHolder.Size = UDim2.new(0, 385, 0, 0)
		DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
		DropItemHolder.ScrollBarThickness = 6
		DropItemHolder.BorderSizePixel = 0
		DropItemHolder.ScrollBarImageColor3 = Color3.fromRGB(28, 29, 32)

		DropItemHolderLayout.Name = "ItemHolderLayout"
		DropItemHolderLayout.Parent = DropItemHolder
		DropItemHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
		DropItemHolderLayout.Padding = UDim.new(0, 0)

		DropdownFrameBtn.MouseButton1Click:Connect(function()
			if DropTog == false then
				DropdownFrameMain.Visible = true
				DropdownFrameMainOutline.Visible = true
				Dropdown.Size = UDim2.new(0, 403, 0, 73 + DropdownFrameMainOutline.AbsoluteSize.Y)

			else
				Dropdown.Size = UDim2.new(0, 403, 0, 73)
				DropdownFrameMain.Visible = false
				DropdownFrameMainOutline.Visible = false
			end
			DropTog = not DropTog
		end)


		for i,v in next, list do
			itemcount = itemcount + 1

			if itemcount == 1 then
				framesize = 29
			elseif itemcount == 2 then
				framesize = 58
			elseif itemcount >= 3 then
				framesize = 87
			end

			local Item = Instance.new("TextButton")
			local ItemCorner = Instance.new("UICorner")
			local ItemText = Instance.new("TextLabel")

			Item.Name = "Item"
			Item.Parent = DropItemHolder
			Item.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
			Item.Size = UDim2.new(0, 379, 0, 29)
			Item.AutoButtonColor = false
			Item.Font = Enum.Font.SourceSans
			Item.Text = ""
			Item.TextColor3 = Color3.fromRGB(0, 0, 0)
			Item.TextSize = 14.000
			Item.BackgroundTransparency = 1

			ItemCorner.CornerRadius = UDim.new(0, 4)
			ItemCorner.Name = "ItemCorner"
			ItemCorner.Parent = Item

			ItemText.Name = "ItemText"
			ItemText.Parent = Item
			ItemText.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
			ItemText.BackgroundTransparency = 1.000
			ItemText.Position = UDim2.new(0.0211081803, 0, 0, 0)
			ItemText.Size = UDim2.new(0, 192, 0, 29)
			ItemText.Font = Enum.Font.Gotham
			ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
			ItemText.TextSize = 14.000
			ItemText.TextXAlignment = Enum.TextXAlignment.Left
			ItemText.Text = v

			Item.MouseEnter:Connect(function()
				ItemText.TextColor3 = Color3.fromRGB(255,255,255)
				Item.BackgroundTransparency = 0
			end)

			Item.MouseLeave:Connect(function()
				ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
				Item.BackgroundTransparency = 1
			end)

			Item.MouseButton1Click:Connect(function()
				CurrentSelectedText.Text = v
				pcall(callback, v)
				Dropdown.Size = UDim2.new(0, 403, 0, 73)
				DropdownFrameMain.Visible = false
				DropdownFrameMainOutline.Visible = false
				DropTog = not DropTog
			end)

			DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropItemHolderLayout.AbsoluteContentSize.Y)

			DropItemHolder.Size = UDim2.new(0, 385, 0, framesize)
			DropdownFrameMain.Size = UDim2.new(0, 392, 0, framesize + 6)
			DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, framesize + 10)
		end

		function DropFunc:Clear()
			for i,v in next, DropItemHolder:GetChildren() do
				if v.Name == "Item" then
					v:Destroy()
				end
			end						

			CurrentSelectedText.Text = "..."

			itemcount = 0
			framesize = 0
			DropItemHolder.Size = UDim2.new(0, 385, 0, 0)
			DropdownFrameMain.Size = UDim2.new(0, 392, 0, 0)
			DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, 0)
			Dropdown.Size = UDim2.new(0, 403, 0, 73)
			DropdownFrameMain.Visible = false
			DropdownFrameMainOutline.Visible = false
		end

		function DropFunc:Add(textadd)
			itemcount = itemcount + 1

			if itemcount == 1 then
				framesize = 29
			elseif itemcount == 2 then
				framesize = 58
			elseif itemcount >= 3 then
				framesize = 87
			end

			local Item = Instance.new("TextButton")
			local ItemCorner = Instance.new("UICorner")
			local ItemText = Instance.new("TextLabel")

			Item.Name = "Item"
			Item.Parent = DropItemHolder
			Item.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
			Item.Size = UDim2.new(0, 379, 0, 29)
			Item.AutoButtonColor = false
			Item.Font = Enum.Font.SourceSans
			Item.Text = ""
			Item.TextColor3 = Color3.fromRGB(0, 0, 0)
			Item.TextSize = 14.000
			Item.BackgroundTransparency = 1

			ItemCorner.CornerRadius = UDim.new(0, 4)
			ItemCorner.Name = "ItemCorner"
			ItemCorner.Parent = Item

			ItemText.Name = "ItemText"
			ItemText.Parent = Item
			ItemText.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
			ItemText.BackgroundTransparency = 1.000
			ItemText.Position = UDim2.new(0.0211081803, 0, 0, 0)
			ItemText.Size = UDim2.new(0, 192, 0, 29)
			ItemText.Font = Enum.Font.Gotham
			ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
			ItemText.TextSize = 14.000
			ItemText.TextXAlignment = Enum.TextXAlignment.Left
			ItemText.Text = textadd

			Item.MouseEnter:Connect(function()
				ItemText.TextColor3 = Color3.fromRGB(255,255,255)
				Item.BackgroundTransparency = 0
			end)

			Item.MouseLeave:Connect(function()
				ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
				Item.BackgroundTransparency = 1
			end)

			Item.MouseButton1Click:Connect(function()
				CurrentSelectedText.Text = textadd
				pcall(callback, textadd)
				Dropdown.Size = UDim2.new(0, 403, 0, 73)
				DropdownFrameMain.Visible = false
				DropdownFrameMainOutline.Visible = false
				DropTog = not DropTog
			end)

			DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropItemHolderLayout.AbsoluteContentSize.Y)

			DropItemHolder.Size = UDim2.new(0, 385, 0, framesize)
			DropdownFrameMain.Size = UDim2.new(0, 392, 0, framesize + 6)
			DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, framesize + 10)
		end
		return DropFunc
	end
	function PageContent:Colorpicker(text, preset, callback)
		local OldToggleColor = Color3.fromRGB(0, 0, 0)
		local OldColor = Color3.fromRGB(0, 0, 0)
		local OldColorSelectionPosition = nil
		local OldHueSelectionPosition = nil
		local ColorH, ColorS, ColorV = 1, 1, 1
		local RainbowColorPicker = false
		local ColorPickerInput = nil
		local ColorInput = nil
		local HueInput = nil

		local Colorpicker = Instance.new("Frame")
		local ColorpickerTitle = Instance.new("TextLabel")
		local ColorpickerFrameOutline = Instance.new("Frame")
		local ColorpickerFrameOutlineCorner = Instance.new("UICorner")
		local ColorpickerFrame = Instance.new("Frame")
		local ColorpickerFrameCorner = Instance.new("UICorner")
		local Color = Instance.new("ImageLabel")
		local ColorCorner = Instance.new("UICorner")
		local ColorSelection = Instance.new("ImageLabel")
		local Hue = Instance.new("ImageLabel")
		local HueCorner = Instance.new("UICorner")
		local HueGradient = Instance.new("UIGradient")
		local HueSelection = Instance.new("ImageLabel")
		local PresetClr = Instance.new("Frame")
		local PresetClrCorner = Instance.new("UICorner")

		Colorpicker.Name = "Colorpicker"
		Colorpicker.Parent = ItemContainer
		Colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Colorpicker.BackgroundTransparency = 1.000
		Colorpicker.Position = UDim2.new(0.0895741582, 0, 0.474232763, 0)
		Colorpicker.Size = UDim2.new(0, 403, 0, 175)

		ColorpickerTitle.Name = "ColorpickerTitle"
		ColorpickerTitle.Parent = Colorpicker
		ColorpickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ColorpickerTitle.BackgroundTransparency = 1.000
		ColorpickerTitle.Position = UDim2.new(0, 5, 0, 0)
		ColorpickerTitle.Size = UDim2.new(0, 200, 0, 29)
		ColorpickerTitle.Font = Enum.Font.Gotham
		ColorpickerTitle.Text = "Colorpicker"
		ColorpickerTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
		ColorpickerTitle.TextSize = 14.000
		ColorpickerTitle.TextXAlignment = Enum.TextXAlignment.Left

		ColorpickerFrameOutline.Name = "ColorpickerFrameOutline"
		ColorpickerFrameOutline.Parent = ColorpickerTitle
		ColorpickerFrameOutline.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
		ColorpickerFrameOutline.Position = UDim2.new(-0.00100000005, 0, 0.991999984, 0)
		ColorpickerFrameOutline.Size = UDim2.new(0, 238, 0, 139)

		ColorpickerFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
		ColorpickerFrameOutlineCorner.Name = "ColorpickerFrameOutlineCorner"
		ColorpickerFrameOutlineCorner.Parent = ColorpickerFrameOutline

		ColorpickerFrame.Name = "ColorpickerFrame"
		ColorpickerFrame.Parent = ColorpickerTitle
		ColorpickerFrame.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
		ColorpickerFrame.ClipsDescendants = true
		ColorpickerFrame.Position = UDim2.new(0.00999999978, 0, 1.06638515, 0)
		ColorpickerFrame.Selectable = true
		ColorpickerFrame.Size = UDim2.new(0, 234, 0, 135)

		ColorpickerFrameCorner.CornerRadius = UDim.new(0, 3)
		ColorpickerFrameCorner.Name = "ColorpickerFrameCorner"
		ColorpickerFrameCorner.Parent = ColorpickerFrame

		Color.Name = "Color"
		Color.Parent = ColorpickerFrame
		Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
		Color.Position = UDim2.new(0, 10, 0, 10)
		Color.Size = UDim2.new(0, 154, 0, 118)
		Color.ZIndex = 10
		Color.Image = "rbxassetid://4155801252"

		ColorCorner.CornerRadius = UDim.new(0, 3)
		ColorCorner.Name = "ColorCorner"
		ColorCorner.Parent = Color

		ColorSelection.Name = "ColorSelection"
		ColorSelection.Parent = Color
		ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
		ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ColorSelection.BackgroundTransparency = 1.000
		ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
		ColorSelection.Size = UDim2.new(0, 18, 0, 18)
		ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
		ColorSelection.ScaleType = Enum.ScaleType.Fit

		Hue.Name = "Hue"
		Hue.Parent = ColorpickerFrame
		Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Hue.Position = UDim2.new(0, 171, 0, 10)
		Hue.Size = UDim2.new(0, 18, 0, 118)

		HueCorner.CornerRadius = UDim.new(0, 3)
		HueCorner.Name = "HueCorner"
		HueCorner.Parent = Hue

		HueGradient.Color = ColorSequence.new {
			ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
			ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
			ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
			ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
			ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
			ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
			ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
		}				
		HueGradient.Rotation = 270
		HueGradient.Name = "HueGradient"
		HueGradient.Parent = Hue

		HueSelection.Name = "HueSelection"
		HueSelection.Parent = Hue
		HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
		HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		HueSelection.BackgroundTransparency = 1.000
		HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
		HueSelection.Size = UDim2.new(0, 18, 0, 18)
		HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"

		PresetClr.Name = "PresetClr"
		PresetClr.Parent = ColorpickerFrame
		PresetClr.BackgroundColor3 = preset
		PresetClr.Position = UDim2.new(0.846153855, 0, 0.0740740746, 0)
		PresetClr.Size = UDim2.new(0, 25, 0, 25)

		PresetClrCorner.CornerRadius = UDim.new(0, 3)
		PresetClrCorner.Name = "PresetClrCorner"
		PresetClrCorner.Parent = PresetClr

		local function UpdateColorPicker(nope)
			PresetClr.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
			Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

			pcall(callback, PresetClr.BackgroundColor3)
		end

		ColorH =
			1 -
			(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
				Hue.AbsoluteSize.Y)
		ColorS =
			(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
				Color.AbsoluteSize.X)
		ColorV =
			1 -
			(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
				Color.AbsoluteSize.Y)

		PresetClr.BackgroundColor3 = preset
		Color.BackgroundColor3 = preset
		pcall(callback, PresetClr.BackgroundColor3)

		Color.InputBegan:Connect(
			function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then

					if ColorInput then
						ColorInput:Disconnect()
					end

					ColorInput =
						RunService.RenderStepped:Connect(
							function()
								local ColorX =
								(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
									Color.AbsoluteSize.X)
								local ColorY =
								(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
									Color.AbsoluteSize.Y)

								ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
								ColorS = ColorX
								ColorV = 1 - ColorY

								UpdateColorPicker(true)
							end
						)
				end
			end
		)

		Color.InputEnded:Connect(
			function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if ColorInput then
						ColorInput:Disconnect()
					end
				end
			end
		)

		Hue.InputBegan:Connect(
			function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then


					if HueInput then
						HueInput:Disconnect()
					end

					HueInput =
						RunService.RenderStepped:Connect(
							function()
								local HueY =
								(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
									Hue.AbsoluteSize.Y)

								HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
								ColorH = 1 - HueY

								UpdateColorPicker(true)
							end
						)
				end
			end
		)

		Hue.InputEnded:Connect(
			function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if HueInput then
						HueInput:Disconnect()
					end
				end
			end
		)

	end

	function PageContent:Textbox(text, placetext, disapper, callback)
		local Textbox = Instance.new("Frame")
		local TextboxTitle = Instance.new("TextLabel")
		local TextboxFrameOutline = Instance.new("Frame")
		local TextboxFrameOutlineCorner = Instance.new("UICorner")
		local TextboxFrame = Instance.new("Frame")
		local TextboxFrameCorner = Instance.new("UICorner")
		local TextBox = Instance.new("TextBox")

		Textbox.Name = "Textbox"
		Textbox.Parent = ItemContainer
		Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Textbox.BackgroundTransparency = 1.000
		Textbox.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
		Textbox.Size = UDim2.new(0, 403, 0, 73)

		TextboxTitle.Name = "TextboxTitle"
		TextboxTitle.Parent = Textbox
		TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextboxTitle.BackgroundTransparency = 1.000
		TextboxTitle.Position = UDim2.new(0, 5, 0, 0)
		TextboxTitle.Size = UDim2.new(0, 200, 0, 29)
		TextboxTitle.Font = Enum.Font.Gotham
		TextboxTitle.Text = text
		TextboxTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
		TextboxTitle.TextSize = 14.000
		TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

		TextboxFrameOutline.Name = "TextboxFrameOutline"
		TextboxFrameOutline.Parent = TextboxTitle
		TextboxFrameOutline.AnchorPoint = Vector2.new(0.5, 0.5)
		TextboxFrameOutline.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
		TextboxFrameOutline.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
		TextboxFrameOutline.Size = UDim2.new(0, 396, 0, 36)

		TextboxFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
		TextboxFrameOutlineCorner.Name = "TextboxFrameOutlineCorner"
		TextboxFrameOutlineCorner.Parent = TextboxFrameOutline

		TextboxFrame.Name = "TextboxFrame"
		TextboxFrame.Parent = TextboxTitle
		TextboxFrame.BackgroundColor3 = Color3.fromRGB(48, 51, 57)
		TextboxFrame.ClipsDescendants = true
		TextboxFrame.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
		TextboxFrame.Selectable = true
		TextboxFrame.Size = UDim2.new(0, 392, 0, 32)

		TextboxFrameCorner.CornerRadius = UDim.new(0, 3)
		TextboxFrameCorner.Name = "TextboxFrameCorner"
		TextboxFrameCorner.Parent = TextboxFrame

		TextBox.Parent = TextboxFrame
		TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.BackgroundTransparency = 1.000
		TextBox.Position = UDim2.new(0.0178571437, 0, 0, 0)
		TextBox.Size = UDim2.new(0, 377, 0, 32)
		TextBox.Font = Enum.Font.Gotham
		TextBox.PlaceholderColor3 = Color3.fromRGB(91, 95, 101)
		TextBox.PlaceholderText = placetext
		TextBox.Text = ""
		TextBox.TextColor3 = Color3.fromRGB(193, 195, 197)
		TextBox.TextSize = 14.000
		TextBox.TextXAlignment = Enum.TextXAlignment.Left

		TextBox.Focused:Connect(function()
			TweenService:Create(
				TextboxFrameOutline,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
			):Play()
		end)

		TextBox.FocusLost:Connect(function(ep)
			TweenService:Create(
				TextboxFrameOutline,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
			):Play()
			if ep then
				if #TextBox.Text > 0 then
					pcall(callback, TextBox.Text)
					if disapper then
						TextBox.Text = ""
					end
				end
			end
		end)

	end

	function PageContent:Label(text)
		local Label = Instance.new("TextButton")
		local LabelTitle = Instance.new("TextLabel")

		Label.Name = "Label"
		Label.Parent = ItemContainer
		Label.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
		Label.BorderSizePixel = 0
		Label.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
		Label.Size = UDim2.new(0, 401, 0, 30)
		Label.AutoButtonColor = false
		Label.Font = Enum.Font.Gotham
		Label.Text = ""
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.TextSize = 14.000

		LabelTitle.Name = "LabelTitle"
		LabelTitle.Parent = Label
		LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LabelTitle.BackgroundTransparency = 1.000
		LabelTitle.Position = UDim2.new(0, 5, 0, 0)
		LabelTitle.Size = UDim2.new(0, 200, 0, 30)
		LabelTitle.Font = Enum.Font.Gotham
		LabelTitle.Text = text
		LabelTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
		LabelTitle.TextSize = 14.000
		LabelTitle.TextXAlignment = Enum.TextXAlignment.Left

	end

	function PageContent:Bind(text, presetbind, callback)
		local Key = presetbind.Name
		local Keybind = Instance.new("TextButton")
		local KeybindTitle = Instance.new("TextLabel")
		local KeybindText = Instance.new("TextLabel")

		Keybind.Name = "Keybind"
		Keybind.Parent = ItemContainer
		Keybind.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
		Keybind.BorderSizePixel = 0
		Keybind.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
		Keybind.Size = UDim2.new(0, 401, 0, 30)
		Keybind.AutoButtonColor = false
		Keybind.Font = Enum.Font.Gotham
		Keybind.Text = ""
		Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
		Keybind.TextSize = 14.000

		KeybindTitle.Name = "KeybindTitle"
		KeybindTitle.Parent = Keybind
		KeybindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		KeybindTitle.BackgroundTransparency = 1.000
		KeybindTitle.Position = UDim2.new(0, 5, 0, 0)
		KeybindTitle.Size = UDim2.new(0, 200, 0, 30)
		KeybindTitle.Font = Enum.Font.Gotham
		KeybindTitle.Text = text
		KeybindTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
		KeybindTitle.TextSize = 14.000
		KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left

		KeybindText.Name = "KeybindText"
		KeybindText.Parent = Keybind
		KeybindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		KeybindText.BackgroundTransparency = 1.000
		KeybindText.Position = UDim2.new(0, 316, 0, 0)
		KeybindText.Size = UDim2.new(0, 85, 0, 30)
		KeybindText.Font = Enum.Font.Gotham
		KeybindText.Text = presetbind.Name
		KeybindText.TextColor3 = Color3.fromRGB(127, 131, 137)
		KeybindText.TextSize = 14.000
		KeybindText.TextXAlignment = Enum.TextXAlignment.Right

		Keybind.MouseButton1Click:Connect(function()
			KeybindText.Text = "..."
			local inputwait = game:GetService("UserInputService").InputBegan:wait()
			if inputwait.KeyCode.Name ~= "Unknown" then
				KeybindText.Text = inputwait.KeyCode.Name
				Key = inputwait.KeyCode.Name
			end
		end)

		game:GetService("UserInputService").InputBegan:connect(
		function(current, pressed)
			if not pressed then
				if current.KeyCode.Name == Key then
					pcall(callback)
				end
			end
		end
		)
	end

	return PageContent
end
return MoonriseLib
