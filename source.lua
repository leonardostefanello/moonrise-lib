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

local function SaveInfo()
	userinfo["pfp"] = pfp
	userinfo["user"] = user
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

--//pages folder
local msPages = Instance.new("Frame")

msPages.Name = "msPages"
msPages.Parent = homeF.apps
msPages.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
msPages.BackgroundTransparency = 1.000
msPages.BorderSizePixel = 0
msPages.ClipsDescendants = true
msPages.Size = UDim2.new(1, 0, 1, 0)

------------------------------//functions//------------------------------
--//make app
function MoonriseLib:App(Name, Icon)
	local NewApp = Instance.new("Frame")
	local appIcon = Instance.new("ImageButton")
	local appName = Instance.new("TextLabel")
	local UICorner = Instance.new("UICorner")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

	NewApp.Name = string.lower(Name).."App"
	NewApp.Parent = msApps1
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
	appIcon.Image = Icon
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

	appIcon.MouseButton1Click:Connect(function()
		NewPage.Visible = true
	end)

	close.MouseButton1Click:Connect(function()
		NewPage.Visible = false
	end)

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

		TextButton.MouseEnter:Connect(function()
			TweenService:Create(
				Button, 
				TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
			):Play()
		end)

		TextButton.MouseButton1Up:Connect(function()
			pcall(callback)
			TweenService:Create(
				Button, 
				TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
			):Play()
		end)

		TextButton.MouseButton1Down:Connect(function()
			TweenService:Create(
				Button, 
				TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(38, 38, 38)}
			):Play()
		end)

		TextButton.MouseLeave:Connect(function()
			TweenService:Create(
				Button, 
				TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
				{BackgroundColor3 = Color3.fromRGB(32, 32, 32)}
			):Play()
		end)
	end
	return PageContent
end

function MoonriseLib:Destroy()
	for i, v in pairs(phoneUI:GetDescendants()) do
		if string.sub(v.Name, 1, 2) == "ms" then
			print(v)
			v:Destroy()
		end
	end
end

return MoonriseLib
