-- just because it says old reanimation doesnt mean its bad ok?
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer

wait(1)

local username = player.Name
local displayName = player.DisplayName

StarterGui:SetCore("SendNotification", {
    Title = "Loading Everything!";
    Text = "Hello, " .. displayName .. " (" .. username .. ")!";
    Duration = 5 
})

-- Credits:
	--[[
		Gelatek - Everything
		Emper - Optimization Tips
		Syndi/Mizt - Hat Renamer (to be changed with own one later)
	]]
	local Game = game
	local RunService = Game:GetService("RunService")
	local StartGui = Game:GetService("StarterGui")
	local TestService = Game:GetService("TestService")
	local Workspace = Game:GetService("Workspace")
	local Players = Game:GetService("Players")
	local PreSim = RunService.PreSimulation
	local PostSim = RunService.PostSimulation
	local CurrentCam = Workspace.CurrentCamera

	local Speed = tick()
	local Warn = warn
	local Error = error

	local Wait = task.wait
	local Infinite = math.huge
	local V3new = Vector3.new
	local INew = Instance.new
	local CFNew = CFrame.new
	local CFAngles = CFrame.Angles
	local MathRandom = math.random
	local Insert = table.insert
	local Clear = table.clear
	local Type = type

	local Global = (getgenv and getgenv()) or shared

	if not Global.RayfieldConfig then Global.RayfieldConfig = {} end
	local PermanentDeath = Global.RayfieldConfig["Permanent Death"]  or true
	local CollideFling = Global.RayfieldConfig["Torso Fling"]  or false -- changeable combat mode! 
	local BulletEnabled = Global.RayfieldConfig["Bullet Enabled"] or false
	local KeepHairWelds = Global.RayfieldConfig["Keep Hats On Head"] or true
	local HeadlessPerma = Global.RayfieldConfig["Headless On Perma"] or false -- changeable headless (or bubblechat hider)
	local DisableAnimations = Global.RayfieldConfig["Disable Anims"] or false
	local Collisions = Global.RayfieldConfig["Enable Collisions"] or true
	local AntiVoid = Global.RayfieldConfig["Anti Void"] or true
	if CollideFling and BulletEnabled then CollideFling = false end
	if not Global.TableOfEvents then Global.TableOfEvents = {} end

	local Player = Players.LocalPlayer
	local Character = Player.Character
	if Character.Name == "GelatekReanimate" then Error("Reanimation Already Working") end
	if (not Character:FindFirstChildOfClass("Humanoid")) or Character:FindFirstChildOfClass("Humanoid").Health == 0 then Error("Player Is Dead.") end

	local PlayerDied = false
	local IGNORETORSOCHECK = "Torso"
	local Is_NetworkOwner = isnetworkowner or function(Part) return Part.ReceiveAge == 0 end
	local HiddenProps = sethiddenproperty or function() end 

	local SpawnPoint = Workspace:FindFirstChildOfClass("SpawnLocation",true) and Workspace:FindFirstChildOfClass("SpawnLocation",true) or CFrame.new(0,20,0)

	-- [[ Events ]] --
	local PostSimEvent
	local PreSimEvent
	local TorsoFlingEvent
	local DeathEvent
	local ResetEvent

	local BulletInfo = nil
	local HatData = nil

	local CF0 = CFNew(0,0,0)
	local Velocity = V3new(0,-26,0)


	Global.PartDisconnected = false
	local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
	if not Humanoid then return end
	local RootPart = Character:FindFirstChild("HumanoidRootPart")
	local R15 = Humanoid.RigType.Name == "R15" and true or false
	local Sin, Cos, Inf, Clamp, Clock = math.sin, math.cos, math.huge, math.clamp, os.clock
	local FakeHats = INew("Folder"); do FakeHats.Name = "FakeHats"; FakeHats.Parent = TestService end
	Character.Archivable = true
	Humanoid:ChangeState(16)


	for Index, RagdollStuff in pairs(Character:GetDescendants()) do
		if RagdollStuff:IsA("BallSocketConstraint") or RagdollStuff:IsA("HingeConstraint") then
			RagdollStuff:Destroy()
		end
	end


	-- Mizt's Hat Renamer
	local HatsNames = {}
	for Index, Accessory in pairs(Character:GetDescendants()) do
		if Accessory:IsA("Accessory") then
			if HatsNames[Accessory.Name] then
				if HatsNames[Accessory.Name] == "Unknown" then
					HatsNames[Accessory.Name] = {}
				end
				Insert(HatsNames[Accessory.Name], Accessory)
			else
				HatsNames[Accessory.Name] = "Unknown"
			end	
		end
	end
	for Index, Tables in pairs(HatsNames) do
		if Type(Tables) == "table" then
			local Number = 1
			for Index2, Names in ipairs(Tables) do
				Names.Name = Names.Name .. Number
				Number = Number + 1
			end		
		end
	end
	Clear(HatsNames)

	local Figure = INew("Model"); do
		local Limbs = {}
		local Attachments = {}
		local function CreateJoint(Name,Part0,Part1,C0,C1)
			local Joint = INew("Motor6D"); Joint.Name = Name
			Joint.Part0 = Part0; Joint.Part1 = Part1
			Joint.C0 = C0; Joint.C1 = C1
			Joint.Parent = Part0
		end
		for i = 0,18 do
			local Attachment = INew("Attachment")
			Attachment.Axis,Attachment.SecondaryAxis = V3new(1,0,0), V3new(0,1,0)
			Insert(Attachments, Attachment)
		end
		for i = 0,3 do
			local Limb = INew("Part")
			Limb.Size = V3new(1, 2, 1); Limb.CanCollide = false
			Limb.Parent = Figure
			Insert(Limbs, Limb)
		end
		Limbs[1].Name = "Right Arm"; Limbs[2].Name = "Left Arm"
		Limbs[3].Name = "Right Leg"; Limbs[4].Name = "Left Leg"
		local Head = INew("Part")
		Head.Size = V3new(2,1,1)
		Head.Locked = true; Head.CanCollide = false
		Head.Name = "Head"
		Head.Parent = Figure
		local Torso = INew("Part")
		Torso.Size = V3new(2, 2, 1)
		Torso.Locked = true; Torso.CanCollide = false
		Torso.Name = "Torso"
		Torso.Parent = Figure
		local Root = Torso:Clone()
		Root.Transparency = 1
		Root.Name = "HumanoidRootPart"
		Root.Parent = Figure
		CreateJoint("Neck", Torso, Head, CFNew(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0), CFNew(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0))
		CreateJoint("RootJoint", Root, Torso, CFNew(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0), CFNew(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0))
		CreateJoint("Right Shoulder", Torso, Limbs[1], CFNew(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0), CFNew(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0))
		CreateJoint("Left Shoulder", Torso, Limbs[2], CFNew(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFNew(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
		CreateJoint("Right Hip", Torso, Limbs[3], CFNew(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0), CFNew(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0))
		CreateJoint("Left Hip", Torso, Limbs[4], CFNew(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFNew(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
		local Humanoid = INew("Humanoid")
		Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		Humanoid.Parent = Figure
		local Animator = INew("Animator", Humanoid)
		local HumanoidDescription = INew("HumanoidDescription", Humanoid)
		local HeadMesh = INew("SpecialMesh")
		HeadMesh.Scale = V3new(1.25, 1.25, 1.25)
		HeadMesh.Parent = Head
		local Face = INew("Decal")
		Face.Name = "face"
		Face.Texture = "http://www.roblox.com/asset/?id=158044781"
		Face.Parent = Head
		local Animate = INew("LocalScript")
		Animate.Name = "Animate"
		Animate.Parent = Figure
		local Health = INew("Script")
		Health.Name = "Health"
		Health.Parent = Figure
		Attachments[1].Name = "FaceCenterAttachment"; Attachments[1].Position = V3new(0, 0, 0)
		Attachments[2].Name = "FaceFrontAttachment"; Attachments[2].Position = V3new(0, 0, -0.6)
		Attachments[3].Name = "HairAttachment"; Attachments[3].Position = V3new(0, 0.6, 0)
		Attachments[4].Name = "HatAttachment"; Attachments[4].Position = V3new(0, 0.6, 0)
		Attachments[5].Name = "RootAttachment"; Attachments[5].Position = V3new(0, 0, 0)
		Attachments[6].Name = "RightGripAttachment"; Attachments[6].Position = V3new(0, -1, 0)
		Attachments[7].Name = "RightShoulderAttachment"; Attachments[7].Position = V3new(0, 1, 0)
		Attachments[8].Name = "LeftGripAttachment"; Attachments[8].Position = V3new(0, -1, 0)
		Attachments[9].Name = "LeftShoulderAttachment"; Attachments[9].Position = V3new(0, 1, 0)
		Attachments[10].Name = "RightFootAttachment"; Attachments[10].Position = V3new(0, -1, 0)
		Attachments[11].Name = "LeftFootAttachment"; Attachments[11].Position = V3new(0, -1, 0)
		Attachments[12].Name = "BodyBackAttachment"; Attachments[12].Position = V3new(0, 0, 0.5)
		Attachments[13].Name = "BodyFrontAttachment"; Attachments[13].Position = V3new(0, 0, -0.5)
		Attachments[14].Name = "LeftCollarAttachment"; Attachments[14].Position = V3new(-1, 1, 0)
		Attachments[15].Name = "NeckAttachment"; Attachments[15].Position = V3new(0, 1, 0)
		Attachments[16].Name = "RightCollarAttachment"; Attachments[16].Position = V3new(1, 1, 0)
		Attachments[17].Name = "WaistBackAttachment"; Attachments[17].Position = V3new(0, -1, 0.5)
		Attachments[18].Name = "WaistCenterAttachment"; Attachments[18].Position = V3new(0, -1, 0)
		Attachments[19].Name = "WaistFrontAttachment"; Attachments[19].Position = V3new(0, -1, -0.5)
		Attachments[1].Parent = Head; Attachments[2].Parent = Head; Attachments[3].Parent = Head Attachments[4].Parent = Head
		Attachments[5].Parent = Root
		Attachments[6].Parent = Limbs[1]; Attachments[7].Parent = Limbs[1]
		Attachments[8].Parent = Limbs[2]; Attachments[9].Parent = Limbs[2]
		Attachments[10].Parent = Limbs[3]; Attachments[11].Parent = Limbs[4]
		for i = 0,7 do Attachments[12 + i].Parent = Torso end
		Figure.Name = "GelatekReanimate"
		Figure.PrimaryPart = Head
		Figure.Archivable = true
		Figure.Parent = Workspace
		Figure:MoveTo(RootPart.Position)
	end

	local FigureHum = Figure:FindFirstChildWhichIsA("Humanoid")
	Figure:MoveTo(Character.Head.Position + V3new(0, 2.5, 0))
	for i,v in pairs(Figure:GetDescendants()) do
		if v:IsA("BasePart") or v:IsA("Decal") then
			v.Transparency = 1
		end
	end

	local FigureDescendants = Figure:GetDescendants()
	local CharacterChildren = Character:GetChildren()

	local function VoidEvent()
		if AntiVoid == true then
			Figure:MoveTo(SpawnPoint.Position)
		else
			if PostSimEvent then PostSimEvent:Disconnect() end
			if PreSimEvent then PreSimEvent:Disconnect() end
			if DeathEvent then DeathEvent:Disconnect() end
			if TorsoFlingEvent then TorsoFlingEvent:Disconnect() end
			if ResetEvent then ResetEvent:Disconnect() end
			if FakeHats then FakeHats:Destroy() end
			pcall(function()
				CurrentCam.FieldOfView = 70
				Global.Stopped = true
				for i,v in pairs(Global.TableOfEvents) do v:Disconnect() end
				Character.Parent = Workspace
				Player.Character = Workspace[Character.Name]
				Humanoid:ChangeState(15)
				if Figure then Figure:Destroy() end
				if TestService:FindFirstChild("ScriptCheck") then
					TestService:FindFirstChild("ScriptCheck"):Destroy()
				end
				Wait(0.125)
				Global.RealChar = nil
				Global.Stopped = false
			end)
		end
	end

			
	for i,v in pairs(Character:GetDescendants()) do -- Disable Scripts / Accessories
		if v:IsA("BasePart") then
			v.RootPriority = 127
			local ClaimInfo = INew("SelectionBox"); do
				ClaimInfo.Adornee = v
				ClaimInfo.Name = "ClaimCheck"
				ClaimInfo.Transparency = 1
				ClaimInfo.Parent = v
			end
		end
		
		if v:IsA("Motor6D") and v.Name ~= "Neck" then
			v:Destroy()
		end
		
		if v:IsA("Script") then
			v.Disabled = true
		end
		
		if v:IsA("Accessory") then
			local FakeAccessory = v:Clone()
			local Handle = FakeAccessory:FindFirstChild("Handle")
			pcall(function() Handle:FindFirstChildWhichIsA("Weld"):Destroy() end)
			local Weld = INew("Weld"); do
				Weld.Name = "AccessoryWeld"
				Weld.Part0 = Handle
			end
			local Attachment = Handle:FindFirstChildOfClass("Attachment")
			if Attachment then
				Weld.C0 = Attachment.CFrame
				Weld.C1 = Figure:FindFirstChild(tostring(Attachment), true).CFrame
				Weld.Part1 = Figure:FindFirstChild(tostring(Attachment), true).Parent
			else
				Weld.Part1 = Figure:FindFirstChild("Head")
				Weld.C1 = CFNew(0,Figure:FindFirstChild("Head").Size.Y / 2,0) * FakeAccessory.AttachmentPoint:Inverse()
			end
			Handle.CFrame = Weld.Part1.CFrame * Weld.C1 * Weld.C0:Inverse()
			Handle.Transparency = 1
			Weld.Parent = Handle
			FakeAccessory.Parent = Figure
			local FakeAccessory2 = FakeAccessory:Clone()
			FakeAccessory2.Parent = FakeHats
		end
	end
	for i, v in next, Humanoid:GetPlayingAnimationTracks() do
		v:Stop();
	end

	if BulletEnabled == true then
		if R15 == false then
			if PermanentDeath == true then
				Character:FindFirstChild("HumanoidRootPart").Name = "Bullet"
				BulletInfo = {Character:FindFirstChild("Bullet"), Figure:FindFirstChild("HumanoidRootPart"), CF0}
				HatData = nil
			else
				Character:FindFirstChild("Right Leg").Name = "Bullet"
				BulletInfo = {Character:FindFirstChild("Bullet"), Figure:FindFirstChild("Right Leg"), CF0}
				if Character:FindFirstChild("Robloxclassicred") then
					HatData = {Character:FindFirstChild("Robloxclassicred"), Figure:FindFirstChild("Right Leg"), CFAngles(math.rad(90),0,0)}
					Character:FindFirstChild("Robloxclassicred").Handle:FindFirstChild("Mesh"):Destroy()
				else HatData = nil end
			end
		else
			Character:FindFirstChild("LeftUpperArm").Name = "Bullet"
			BulletInfo = {Character:FindFirstChild("Bullet"), Figure:FindFirstChild("Left Arm"), CFNew(0, 0.4085, 0)}
			if Character:FindFirstChild("SniperShoulderL") then
				HatData = {Character:FindFirstChild("SniperShoulderL"), Figure:FindFirstChild("Left Arm"), CFNew(0, 0.5, 0)}
			else HatData = nil end
		end
		if HatData then
			HatData[1].Handle:BreakJoints()
		end
		
		local Bullet = Character:FindFirstChild("Bullet")
		local Highlight = INew("SelectionBox"); do
			local Extra 
			Highlight.Adornee = Bullet
			Highlight.Name = "Highlight"
			Highlight.Color3 = Color3.fromRGB(0, 223, 37)
			Highlight.Parent = Bullet
			Extra = PreSim:Connect(function()
				if not Figure and Figure.Parent then Extra:Disconnect() end
				if (not TestService:FindFirstChild("ScriptCheck")) or Figure:FindFirstChild("AnimPlayer") then
					Highlight.Transparency = 1
				else
					Highlight.Transparency = 0
				end
			end)
		end
	end

	-- Collide Fling
	if CollideFling == true then
		if R15 == false then
			local Torso = Character:FindFirstChild("Torso")
			if PermanentDeath == true then
				IGNORETORSOCHECK = "adfasdkogpasdfjopghsfdjofipsdjghsfopgjospadgjsaj"
				task.spawn(function()
					Wait(1)
					local BodyAngularVelocity = INew("BodyAngularVelocity")
					BodyAngularVelocity.MaxTorque = V3new(1,1,1) * Infinite
					BodyAngularVelocity.P = math.huge
					BodyAngularVelocity.AngularVelocity = V3new(1950,1950,1950)
					BodyAngularVelocity.Name = "TorsoFlinger"
					BodyAngularVelocity.Parent = Character:FindFirstChild("HumanoidRootPart")
				end)
			else
				TorsoFlingEvent = PostSim:Connect(function()
					if FigureHum.MoveDirection.Magnitude < 0.1 then
						Torso.Velocity = Velocity
					elseif FigureHum.MoveDirection.Magnitude > 0.1 then
						Torso.Velocity = V3new(1250,1250,1250)+Velocity
					end
				end)
			end
		else
			local Torso = Character:FindFirstChild("UpperTorso")
			TorsoFlingEvent = PostSim:Connect(function()
				if FigureHum.MoveDirection.Magnitude < 0.1 then
					Torso.RotVelocity = V3new()
				elseif FigureHum.MoveDirection.Magnitude > 0.1 then
					Torso.RotVelocity = V3new(2500,2500,2500)
				end
			end)
		end
	end

	if not TestService:FindFirstChild("OwnershipBoost") then
		local Part = INew("Part")
		Part.Name = "OwnershipBoost"
		Part.Parent = TestService
		PreSim:Connect(function()
			HiddenProps(Player, "MaximumSimulationRadius", 10e+5)
			HiddenProps(Player, "SimulationRadius", Player.MaximumSimulationRadius)
		end)
	end
	local FallHeight = Workspace.FallenPartsDestroyHeight
	local function MiniRandom() return "0." .. MathRandom(6, 8) .. MathRandom(1, 9) .. MathRandom(1, 9) end
	PreSimEvent = PreSim:Connect(function() -- Noclip
		local AntiVoidOffset = Global.RayfieldConfig["Anti Void Offset"] or 75
		if Figure.HumanoidRootPart.Position.Y <= FallHeight + AntiVoidOffset then VoidEvent() end
		for _,v in pairs(CharacterChildren) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
		
		if not Collisions then
			for _,v in pairs(FigureDescendants) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
		end
	end)

	for i,v in pairs(Character:GetDescendants()) do -- Break Joints
		if v:IsA("Motor6D") and v.Name ~= "Neck" then
			v:Destroy()
		end
	end

	for i,v in pairs(Character:GetChildren()) do
		if v:IsA("Accessory") then
			local Attachment = v.Handle:FindFirstChildWhichIsA("Attachment")
			if KeepHairWelds == true and Attachment.Name ~= "HatAttachment" and Attachment.Name ~= "FaceFrontAttachment" and Attachment.Name ~= "HairAttachment" and Attachment.Name ~= "FaceCenterAttachment" then
				v.Handle:BreakJoints()
			end
			if KeepHairWelds == false or PermanentDeath == true then -- Overwrites the check if perma is on
				v.Handle:BreakJoints()
			end
		end
	end

	local function Align(Part0, Part1, Offset)
		local CFOffset = Offset or CF0
		local OwnerShip = Part0:FindFirstChild("ClaimCheck")
		if Is_NetworkOwner(Part0) == true then
			if OwnerShip then OwnerShip.Transparency = 1 end
			if (CollideFling and Part0.Name ~= IGNORETORSOCHECK) or not CollideFling then 
				Part0.AssemblyLinearVelocity = V3new(MathRandom(-2,2), -30 - MiniRandom(), MathRandom(-2,2)) + FigureHum.MoveDirection * (Part0.Mass * 10)
			end
			if (CollideFling and Part0.Name ~= "HumanoidRootPart") or not CollideFling then Part0.RotVelocity = Part1.RotVelocity end
			Part0.CFrame = Part1.CFrame * CFOffset * CFNew(0.0085 * Cos(Clock() * 10), 0.0085 * Sin(Clock() * 10), 0)
		else
			if OwnerShip then OwnerShip.Transparency = 0 end
		end
	end

	local Offsets;
	if not R15 then 
		Offsets = {
			["HumanoidRootPart"] = {Figure:FindFirstChild("HumanoidRootPart"), CF0},
			["Torso"] = {Figure:FindFirstChild("Torso"), CF0},
			["Right Arm"] = {Figure:FindFirstChild("Right Arm"), CF0},
			["Left Arm"] = {Figure:FindFirstChild("Left Arm"), CF0},
			["Right Leg"] = {Figure:FindFirstChild("Right Leg"), CF0},
			["Left Leg"] = {Figure:FindFirstChild("Left Leg"), CF0},
		}
	else 
		Offsets = {
			["UpperTorso"] = {Figure:FindFirstChild("Torso"), CFNew(0, 0.194, 0)},
			["LowerTorso"] = {Figure:FindFirstChild("Torso"), CFNew(0, -0.79, 0)},
			["HumanoidRootPart"] = {Character:FindFirstChild("UpperTorso"), CF0},
			
			["RightUpperArm"] = {Figure:FindFirstChild("Right Arm"), CFNew(0, 0.4085, 0)},
			["RightLowerArm"] = {Figure:FindFirstChild("Right Arm"), CFNew(0, -0.184, 0)},
			["RightHand"] = {Figure:FindFirstChild("Right Arm"), CFNew(0, -0.83, 0)},

			["LeftUpperArm"] = {Figure:FindFirstChild("Left Arm"), CFNew(0, 0.4085, 0)},
			["LeftLowerArm"] = {Figure:FindFirstChild("Left Arm"), CFNew(0, -0.184, 0)},
			["LeftHand"] = {Figure:FindFirstChild("Left Arm"), CFNew(0, -0.83, 0)},

			["RightUpperLeg"] = {Figure:FindFirstChild("Right Leg"), CFNew(0, 0.575, 0)},
			["RightLowerLeg"] = {Figure:FindFirstChild("Right Leg"), CFNew(0, -0.199, 0)},
			["RightFoot"] = {Figure:FindFirstChild("Right Leg"), CFNew(0, -0.849, 0)},

			["LeftUpperLeg"] = {Figure:FindFirstChild("Left Leg"), CFNew(0, 0.575, 0)},
			["LeftLowerLeg"] = {Figure:FindFirstChild("Left Leg"), CFNew(0, -0.199, 0)},
			["LeftFoot"] = {Figure:FindFirstChild("Left Leg"), CFNew(0, -0.849, 0)}
		}
	end

	local PostSimEvent = PostSim:Connect(function()
		for i,v in pairs(Offsets) do -- Body Align [2]
			if Character:FindFirstChild(i) then
				Align(Character:FindFirstChild(i), v[1], v[2])
			end
		end
		for i,v in pairs(CharacterChildren) do
			if v:IsA("Accessory") then
				if (HatData and v.Name ~= HatData[1].Name) or not HatData then
					Align(v.Handle, Figure[v.Name].Handle)
				end
			end
		end
		if HatData then
			Align(HatData[1].Handle, HatData[2], HatData[3])
		end
		if BulletInfo then
			BulletInfo[1].Velocity = Velocity
			if Global.PartDisconnected == false then
				Align(BulletInfo[1], BulletInfo[2], BulletInfo[3])
			end
		end
	end)

	-- Permanent Death
	if PermanentDeath then
		task.spawn(function()
			Wait(game:FindFirstChildWhichIsA("Players").RespawnTime + 0.5)
			if HeadlessPerma == true then
				Character:FindFirstChild("Head"):Remove()
			else
				Character:FindFirstChild("Head"):BreakJoints()
				Offsets["Head"] = {Figure:FindFirstChild("Head"), CF0}
			end
		end)
	end

	-- Ending Process
	Global.RealChar = Character	
	Character.Parent = Figure
	Player.Character = Figure
	CurrentCam.CameraSubject = FigureHum

	DeathEvent = FigureHum.Died:Connect(function()
		if PostSimEvent then PostSimEvent:Disconnect() end
		if PreSimEvent then PreSimEvent:Disconnect() end
		if DeathEvent then DeathEvent:Disconnect() end
		if TorsoFlingEvent then TorsoFlingEvent:Disconnect() end
		if ResetEvent then ResetEvent:Disconnect() end
		if FakeHats then FakeHats:Destroy() end
		for i,v in pairs(Global.TableOfEvents) do v:Disconnect() end
		pcall(function()
			CurrentCam.FieldOfView = 70
			Global.Stopped = true
			Character.Parent = Workspace
			Player.Character = Workspace[Character.Name]
			Humanoid:ChangeState(15)
			if Figure then Figure:Destroy() end
			if TestService:FindFirstChild("ScriptCheck") then
				TestService:FindFirstChild("ScriptCheck"):Destroy()
			end
			Wait(0.125)
			Global.RealChar = nil
			Global.Stopped = false
		end)
	end)

	ResetEvent = Character:GetPropertyChangedSignal("Parent"):Connect(function(Parent)
		if Parent == nil then
			if PostSimEvent then PostSimEvent:Disconnect() end
			if PreSimEvent then PreSimEvent:Disconnect() end
			if DeathEvent then DeathEvent:Disconnect() end
			if TorsoFlingEvent then TorsoFlingEvent:Disconnect() end
			if ResetEvent then ResetEvent:Disconnect() end
			if FakeHats then FakeHats:Destroy() end
			for i,v in pairs(Global.TableOfEvents) do v:Disconnect() end
			pcall(function()
				if Figure then Figure:Destroy() end
				CurrentCam.FieldOfView = 70
				Global.RealChar = nil
				Global.Stopped = true
				if TestService:FindFirstChild("ScriptCheck") then TestService:FindFirstChild("ScriptCheck"):Destroy() end
				Wait(0.125)
				Global.Stopped = false
			end)
		end
	end)

	Warn("Reanimated in " .. string.sub(tostring(tick()-Speed),1,string.find(tostring(tick()-Speed),".")+5))
	if not DisableAnimations then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekReanimate/main/Addons/Animations.lua"))()
	end
	game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Prepared!";
			Duration = 4;
			Text = "Old Gelatek Reanimation is now active."
	})
	
	task.wait(0.5)
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "❤️";
			Duration = 4;
			Text = "Thank you for using this script."
	})
	-- Krystal Dance V3, Made by Hemi (es muy janky)
	if not getgenv()["Animator"] then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
	end
	task.wait(1.5)
	local player = game:GetService("Players").LocalPlayer
		local character = player.Character
		if not character then return end
		-- Play animation
		local Intro = Animator.new(character, 124033675853489)
		Intro:Play()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/testing033333/Krystal_Dance_Edit/refs/heads/main/ANTIDEPRESSANTAUDIOPAK.luau"))()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/testing033333/Krystal-Dance-V3-Edit/refs/heads/main/funny tag"))()
	local lol = math.random(1,30)
	if lol == 2 then 
	lol = true 
	end
	local sprinting = false 
	local is = game:GetService("InsertService")
	local idleanim = is:LoadLocalAsset("rbxassetid://83465205704188")
	local walkanim = is:LoadLocalAsset("rbxassetid://73210090104463")
	local sprintanim = is:LoadLocalAsset("rbxassetid://117120797008387")
	local randompart = Instance.new("Part",game:GetService("RunService"))
	local coolparticles = is:LoadLocalAsset("rbxassetid://87299663038091").ParticleAttachment
	coolparticles.Parent = randompart
	local playbacktrack = true 
	local script = Instance.new("LocalScript")
	local timeposcur = 0 
	local playanother = false
	local playing = false
	local dancing = false
	local rtrnv;
	local c;
	local tbl3;
	local v;
	local anim;
	local count;
	local hhhh;
	local asdf;
	local s;
	local animid;
	local plr;
	local char=game:GetService("Players").LocalPlayer.Character
	local hum=char:FindFirstChildOfClass("Humanoid")
	local h=char.Head
	local t=char.Torso
	local hrp=char.HumanoidRootPart 
	local cframe;
	local torso;
	local rs;
	local ls;
	local rh;
	local lh;
	local n;
	local rj;
	local rsc0;
	local lsc0;
	local rhc0;
	local lhc0;
	local rjc0;
	local nc02;
	local gc0;
	local orsc0;
	local olsc0;
	local orhc0;
	local olhc0;
	local orjc0;
	local onc0;
	local count2;
	local maxcount2;
	local walking = false
	local idle = false
	local RunService = game:GetService("RunService")
	local function getnext(tbl,number)
		c=100
		rtrnv=0
		for i,v in pairs(tbl) do
			if i>number and i-number<c then
	c=i-number
	rtrnv=i
			end
		end
		return(rtrnv)
	end
	local function wait2(tim)
		if tim<0.1 then
			game:GetService("RunService").Heartbeat:Wait()
		else
			for i=1,tim*40 do
	game:GetService("RunService").Heartbeat:Wait()
			end
		end
	end
	local function kftotbl(kf) -- Below this is literal pain..
		tbl3 = {}
		for i,v in pairs(kf:GetDescendants()) do
			if v:IsA("Pose") then
	tbl3[string.sub(v.Name,1,1)..string.sub(v.Name,#v.Name,#v.Name)] = v.CFrame
			end
		end
		return(tbl3)
	end
	local sound69 = Instance.new("Sound",game:GetService("RunService"))
	sound69.Looped = true
	sound69.Name = "danc"
	sound69.Playing = true
	sound69.Volume = .75
	local plr = game.Players.LocalPlayer
	local RunService = game:GetService("RunService")

	local function functionToBind()
		char.Humanoid:Move(Vector3.new(0,0,-1),false)
	end
	local script = Instance.new("Script")
	ArtificialHB = Instance.new("BindableEvent",script)
	ArtificialHB.Name = "Heartbeat"
	script:WaitForChild("Heartbeat")
	frame = 1 / 60
	tf = 0
	allowframeloss = false
	tossremainder = false
	lastframe = tick()
	script.Heartbeat:Fire()
	game:GetService("RunService").Heartbeat:Connect(function(s,p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1,math.floor(tf / frame) do
				pcall(function()
				script.Heartbeat:Fire()
				end)
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
	end)
	function swait(num)
	if num == 0 or num == nil then
		ArtificialHB.Event:Wait()
	else
		for i = 0,num do
			ArtificialHB.Event:Wait()
		end
	end
	end

				function fwait(seconds)
					seconds = (seconds < 0.000001) and 0.000001 or seconds -- absolute limit of roblox, anything below just crashes lol so this limits it so it doesnt crash
				
					local event = game:GetService("RunService").PreRender or game:GetService("RunService").Heartbeat
				
					local startTime = tick()
					while tick() - startTime < seconds do
						event:Wait()
					end
				end		
				local legitjustran = false
				local loopsplaying=0 
				local rst 
				local lst
				local rht 
				local lht 
				local nt 
				local rjt
		local function playanim(id,speed,isadance,custominstance)
			playanother = true 
			loopsplaying+=1
			if legitjustran == true then return end
			legitjustran = true 
			if isadance == nil then 
				isadance = true 
			end
			if isadance == true  then 
				sound69.Volume =0
			end
			if dancing == true then 
				sound69:Play()
				sound69.TimePosition = 0
			end
			if dancing == true then 
				walking = false
				idle = false
			end
			if speed == nil then 
				speed = 1
			end
			if dancing == true then 
				idle = false 
				char.Humanoid:Move(Vector3.new(0,0,-1),true)
				walking = false 
			end
			wait(.005)
			if isadance == true  then 
				sound69.Volume =2 
			end
			if dancing == true then 
				sound69:Play()
				sound69.TimePosition = 0
			end
			legitjustran = false
			playanother = false 
	
			local animid="rbxassetid://"..id
	char = char
	pcall(function()
		hhhh=char.Humanoid.Animator
	hhhh.Parent = nil
	end)
	for _,v in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
		v:Stop()
	end
	cframe = char.HumanoidRootPart.CFrame
	torso = char.Torso
	-----------------------------------------------------------
	local ts = game:GetService("TweenService")
	local tsi = TweenInfo.new(1/(30*speed))
	rs = torso["Right Shoulder"] -- Just took this from another script(Faster).
	ls = torso["Left Shoulder"]
	rh = torso["Right Hip"]
	lh = torso["Left Hip"]
	n = torso["Neck"]
	rj = char.HumanoidRootPart["RootJoint"]
	rsc0 = rs.C0
	lsc0 = ls.C0
	rhc0 = rh.C0
	lhc0 = lh.C0
	rjc0 = rj.C0
	nc02 = n.C0
	gc0 = CFrame.new()
	orsc0 = rs.C0
	olsc0 = ls.C0
	orhc0 = rh.C0
	olhc0 = lh.C0
	orjc0 = rj.C0
	onc0 = n.C0
	count2 = 100
	maxcount2=100
	playanother = false
	frame = 1 / (30*speed)
		if custominstance == nil then
		animid=is:LoadLocalAsset(animid)
		else
			animid = custominstance
		end
		animid.Parent = workspace
		local anim={}
	for i,v in pairs(animid:GetChildren()) do
		if v:IsA("Keyframe") then
			anim[v.Time]=kftotbl(v)
		end
	end
	
	count = 0
	char=char
	if dancing == true then 
		sound69:Play()
		sound69.TimePosition = 0
	end
	plr.CharacterRemoving:Connect(function()
		if playing == true then
			playing = false
		end
	end)
	while true do
		print(loopsplaying)
		if loopsplaying>1 then 
			break
		end
		if playanother == true then
			local deft = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
			rs.Transform = deft
			ls.Transform = deft
			lh.Transform = deft
			rj.Transform = deft
			n.Transform  = deft
			rh.Transform = deft  
			pcall(function()
				rst:Cancel()
				rht:Cancel()
				lht:Cancel()
				lst:Cancel()
				nt:Cancel()
				rjt:Cancel()
			end)

			break
		else
			for i,oasjdadlasdkadkldjkl in pairs(anim) do
	local asdf=getnext(anim,count)
	local  v=anim[asdf]
	if playanother == true then
		local deft = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		rs.Transform = deft
		ls.Transform = deft
		lh.Transform = deft
		rj.Transform = deft
		n.Transform  = deft
		rh.Transform = deft  
		pcall(function()
			rst:Cancel()
			rht:Cancel()
			lht:Cancel()
			lst:Cancel()
			nt:Cancel()
			rjt:Cancel()
		end)
		break
	end
	if walking == true and char.Humanoid.MoveDirection == Vector3.new(0,0,0) then 
		break 
	end
	frame = 1 / (30*speed)
	if dancing == true and isadance == false then 
		break 
	end
	if dancing == true then 
		walking = false
		idle = false
	end
	if walking == true and idle == true then 
		playanother = true 
	end
	if v["Lg"] then
		lhc0 = v["Lg"]
	end
	if v["Rg"] then
		rhc0 = v["Rg"]
	end
	if v["Lm"] then
		lsc0 = v["Lm"]
	end
	if v["Rm"] then
		rsc0 = v["Rm"]
	end
	if v["To"] then
		rjc0 = v["To"]
	end
	if v["Hd"] then
		nc02 = v["Hd"]
	end
	count2=0
	maxcount2=asdf-count
	count=asdf
		swait(1/(30*speed))
	if playanother == true then
		local deft = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		rs.Transform = deft
		ls.Transform = deft
		lh.Transform = deft
		rj.Transform = deft
		n.Transform  = deft
		rh.Transform = deft  
		pcall(function()
			rst:Cancel()
			rht:Cancel()
			lht:Cancel()
			lst:Cancel()
			nt:Cancel()
			rjt:Cancel()
		end)
		break
		end
	count2=maxcount2
	if v["Lg"] then
		lht = ts:Create(char.Torso["Left Hip"],tsi,{Transform = CFrame.new(v["Lg"].p*char:GetScale())*v["Lg"].Rotation}):Play()
		-- char.Torso["Left Hip"].Transform = CFrame.new(v["Lg"].p*char:GetScale())*v["Lg"].Rotation
	end
	if v["Rg"] then
		rht = ts:Create(char.Torso["Right Hip"],tsi,{Transform = CFrame.new(v["Rg"].p*char:GetScale())*v["Rg"].Rotation}):Play()
		--   char.Torso["Right Hip"].Transform = CFrame.new(v["Rg"].p*char:GetScale())*v["Rg"].Rotation
	end
	if v["Lm"] then
		lst = ts:Create(char.Torso["Left Shoulder"],tsi,{Transform = CFrame.new(v["Lm"].p*char:GetScale())*v["Lm"].Rotation}):Play()
		--  char.Torso["Left Shoulder"].Transform =  CFrame.new(v["Lm"].p*char:GetScale())*v["Lm"].Rotation
	end
	if v["Rm"] then
		rst = ts:Create(char.Torso["Right Shoulder"],tsi,{Transform = CFrame.new(v["Rm"].p*char:GetScale())*v["Rm"].Rotation}):Play()
		-- char.Torso["Right Shoulder"].Transform = CFrame.new(v["Rm"].p*char:GetScale())*v["Rm"].Rotation
	end
	if v["To"] then
		rjt = ts:Create(char.HumanoidRootPart["RootJoint"],tsi,{Transform = CFrame.new(v["To"].p*char:GetScale())*v["To"].Rotation}):Play()
		-- char.HumanoidRootPart["RootJoint"].Transform = CFrame.new(v["To"].p*char:GetScale())*v["To"].Rotation
	end
	if v["Hd"] then
		nt = ts:Create(char.Torso["Neck"],tsi,{Transform = CFrame.new(v["Hd"].p*char:GetScale())*v["Hd"].Rotation}):Play()
		--char.Torso["Neck"].Transform =  CFrame.new(v["Hd"].p*char:GetScale())*v["Hd"].Rotation
	end
			end
		end
	end
			end   
			local exploit = "shitsploit"
			pcall(function()
				exploit = getexecutorname()
			end)
		local customasset = function(id)
			if exploit ~= "CaetSploit" then
			idwithoutthatbit= string.gsub(id,"Dances/","")
			if not isfile(id) then 
			writefile(id,game:HttpGet("https://github.com/sparezirt/music/raw/refs/heads/main/"..idwithoutthatbit))
			end
		repeat task.wait() until isfile(id)
		end
			local s = Instance.new("Sound")
			s.Parent = game:GetService("RunService")
			s.SoundId = getcustomasset(id)
			task.spawn(function()
				task.wait(1)
				s:Destroy()
			end)
			return s.SoundId
		end
			local exploit = "shitsploit"
			pcall(function()
				exploit = getexecutorname()
			end)
		local customasset = function(id)
			if exploit ~= "CaetSploit" then
			idwithoutthatbit= string.gsub(id,"Dances/","")
			if not isfile(id) then 
			writefile(id,game:HttpGet("https://raw.githubusercontent.com/testing033333/Krystal-Dance-V3-Edit/refs/heads/main/"..idwithoutthatbit))
			end
		repeat task.wait() until isfile(id)
		end
			local s = Instance.new("Sound")
			s.Parent = game:GetService("RunService")
			s.SoundId = getcustomasset(id)
			task.spawn(function()
				task.wait(1)
				s:Destroy()
			end)
			return s.SoundId
		end
			local function stopanim()
			if loopsplaying>0 then 
					loopsplaying-=1
			end
				playanother = true 
				playanother = true 
				playanother = true 
				playanother = true 
				sound69.PlaybackSpeed = 1
				if playbacktrack == true then 
							if lol ~= true then 
				sound69.SoundId = customasset("Dances/ive earned the right to hate myself.mp3")
					else 
						sound69.SoundId = customasset("Dances/ive earned the right to hate myself.mp3")  
					end
				sound69.Volume = .75
				else 
					sound69:Stop()
				end
				coolparticles.Parent = randompart
				pcall(function()
					rst:Cancel()
					rht:Cancel()
					lht:Cancel()
					lst:Cancel()
					nt:Cancel()
					rjt:Cancel()
				end)
				if dancing == true then 
					sound69.TimePosition = timeposcur
					dancing = false
					idle = true 
					char.Humanoid:Move(Vector3.new(0,0,-1),true)
					walking = false 
					wait(.065)
					if walking == true and idle == false and  char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and playanother==true  then 
					task.spawn(function()
					playanim(83465205704188,1,false)
					end)
				end
				end
						end
loadstring(game:HttpGet("https://raw.githubusercontent.com/testing033333/Krystal_Dance_Edit/refs/heads/main/ihadtoaddthisbecauseupdatingbothversionsistediousaf.lua))()
	if k == "equals" then 
		playbacktrack = not playbacktrack
		if dancing == false then 
		if playbacktrack == true then 
			sound69:Play()
			sound69.Volume = .75
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Krystal Dance V3";
				Duration = 5;
				Text = "Background music enabled"
			})
		else 
		sound69:Stop()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Krystal Dance V3";
			Duration = 5;
			Text = "Background music disabled"
		})
		end
		end
	end
	if k == "minus" then 
		sprinting = not sprinting
	end
	if k == "m" then 
	if mode == 3 then 
	mode = 4
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "le combat anims";
		Duration = 5;
		Text = "pretty much just tsb stuff"
	})
	elseif mode == 2 then 
		mode = 3
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Krystal Dance V3";
		Duration = 5;
		Text = "You are on page 3"
	})
	elseif mode == 1 then
			mode = 2 
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Krystal Dance V3";
		Duration = 5;
		Text = "You are on page 2"
	})
	elseif mode == 4 then 
		mode = 1
		game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Krystal Dance V3";
		Duration = 5;
		Text = "You are on page 1"
	})
		end
		end
	end)
	char.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
		if char.Humanoid.Sit == false then 
		if char.Humanoid.MoveDirection == Vector3.new(0,0,0) and dancing == false and idle == false then
		walking = false
		idle = true
		stopanim()
		fwait(1/500)
			if idle == true and walking == false and char.Humanoid.MoveDirection == Vector3.new(0,0,0) and dancing == false and playanother==true then
				playanim(83465205704188,1,false,idleanim )
				end
			elseif char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and walking == false then 
				char.Humanoid.WalkSpeed = 14*char:GetScale()
				walking = true
				idle = false
				stopanim()
				fwait(1/500)
			if sprinting == false then 
					char.Humanoid.WalkSpeed = 6*char:GetScale()
				if walking == true and idle == false and  char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and playanother==true  then 
					playanim(73210090104463,0.5,false,walkanim)
				end
			else
					char.Humanoid.WalkSpeed = 33*char:GetScale()
				if walking == true and idle == false and  char.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and dancing == false and playanother==true  then 
					playanim(117120797008387,2.5,false,sprintanim)
				end
		end
	end
	end
		end)
		char.Humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
			print("sit")
			if char.Humanoid.Sit == true then 
				stopanim()
				
				math.randomseed(os.clock())
				if math.random(1,2) == 1 then 
				playanim(18514983173,1,false)
				else 
				playanim(18515203356,1,false)
				end
			else 
				stopanim()
				task.wait(.05)
				stopanim()
				char.Humanoid:Move(Vector3.new(0,0,-1),true)
				char.Humanoid:Move(Vector3.new(0,0,-1),true)
				char.Humanoid:Move(Vector3.new(0,0,-1),true)
			end
		end)

	local RunService = game:GetService("RunService")

	local Player = game:GetService("Players").LocalPlayer
	local PlayerMouse = Player:GetMouse()
	local Camera = workspace.CurrentCamera
	local Character =char

	local Humanoid = Character:WaitForChild("Humanoid")
	local IsR6 = (Humanoid.RigType == Enum.HumanoidRigType.R6)

	local Head = Character:WaitForChild("Head")
	local Torso = if IsR6 then Character:WaitForChild("Torso") else Character:WaitForChild("UpperTorso")

	local Neck = if IsR6 then Torso:WaitForChild("Neck") else Head:WaitForChild("Neck")
	local Waist = if IsR6 then nil else Torso:WaitForChild("Waist")

	local NeckOriginC0 = Neck.C0
	local WaistOriginC0 = if Waist then Waist.C0 else nil

	Neck.MaxVelocity = 1/3

	local AllowedStates = {Enum.HumanoidStateType.Running, Enum.HumanoidStateType.Climbing, Enum.HumanoidStateType.Swimming, Enum.HumanoidStateType.Freefall, Enum.HumanoidStateType.Seated}
	local IsAllowedState = (table.find(AllowedStates, Humanoid:GetState()) ~= nil)

	local find = table.find
	local atan = math.atan
	local atan2 = math.atan2

	Humanoid.StateChanged:Connect(function(_, new)
		IsAllowedState = (find(AllowedStates, new) ~= nil)
	end)
	local oldC0N = Neck.C0

	local updatesPerSecond = 10
	local Character = char 
	local Root = char.HumanoidRootPart
	introsound = Instance.new("Sound",Root)
	introsound.SoundId = "rbxassetid://98924620565595"
	introsound.Volume = 2
	introsound:Play()

	bigfedora = Instance.new("Part",Character)
	bigfedora.Size = Vector3.new(2,2,2)
	bigfedora.CFrame = bigfedora.CFrame:inverse() * Root.CFrame * CFrame.new(math.random(-60,60),-.2,math.random(-60,60)) * CFrame.Angles(0,math.rad(math.random(-180,180)),0)
	bigfedora.CanCollide = false
	bigfedora.Anchored = true
	bigfedora.Name = "mbigf"
	mbigfedora = Instance.new("SpecialMesh", bigfedora)
	mbigfedora.MeshType = "FileMesh"
	mbigfedora.Scale = Vector3.new(5, 5, 5)
	mbigfedora.MeshId,mbigfedora.TextureId = 'http://www.roblox.com/asset/?id=1125478','http://www.roblox.com/asset/?id=1125479'

	for i = 1, 60 do
	bigfedora.CFrame = bigfedora.CFrame:lerp(CFrame.new(Root.Position) * CFrame.new(0,-.1,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),.09)
	task.wait(1/60)
	end
	wait(.25)
	for i = 1, 50 do
	bigfedora.CFrame = bigfedora.CFrame:lerp(CFrame.new(char.Head.Position),.05)
	task.wait(1/60)
	end
	zmc = 0
	for i = 1, 29 do
	zmc = zmc + 2
	mbigfedora.Scale = mbigfedora.Scale - Vector3.new(.25,.25,.25)
	bigfedora.CFrame = bigfedora.CFrame * CFrame.Angles(math.rad(0),math.rad(zmc),0)
	task.wait(1/60)
	end
	bigfedora:Remove()
	local nim= 0
	char.Humanoid.Died:Connect(function()
	sound69.PlaybackSpeed = 0
	sound69.Parent = nil 
	sound69.Volume = 0
	end)
	local hum = char.Humanoid
	local cf = CFrame.new
	local DIEDLOOP 
	local HEADLOOP
	repeat 
		char.Humanoid:Move(Vector3.new(0,0,-1),true)
		task.wait(1/60)
		nim=nim+1
	until nim==3
	RunService.RenderStepped:Connect(function(deltaTime: number)
			local function Alpha(n)
			return math.clamp(n*deltaTime*60,0,1)
		end
	hum.CameraOffset =  hum.CameraOffset:Lerp((hrp.CFrame*cf(0,1.5,0)):PointToObjectSpace(h.Position),Alpha(.15))
		if IsAllowedState  and dancing == false then
			local HeadPosition = Head.Position
			if Neck then
				local MousePos = PlayerMouse.Hit.Position
				local TranslationVector = (HeadPosition - MousePos).Unit
				local Pitch = atan(TranslationVector.Y)
				local Yaw = TranslationVector:Cross(Torso.CFrame.LookVector).Y
				local Roll = atan(Yaw)
				
				local NeckCFrame
				if IsR6 then
					NeckCFrame = CFrame.Angles(Pitch, 0, Yaw)
				else
					NeckCFrame = CFrame.Angles(-Pitch * 0.5, Yaw, -Roll * 0.5)				
					local waistCFrame = CFrame.Angles(-Pitch * 0.5, Yaw * 0.5, 0)
					Waist.C0 = Waist.C0:Lerp(WaistOriginC0 * waistCFrame, updatesPerSecond * deltaTime)
				end			
				Neck.C0 = Neck.C0:Lerp(NeckOriginC0 * NeckCFrame, updatesPerSecond * deltaTime)
			end
		elseif dancing == true then 
			Neck.C0 = oldC0N
		end	
	if char.Humanoid.MoveDirection == Vector3.new(0,0,0) then 
		walking = false 
		idle = true 
	else 
		walking = true 
		idle = false 
	end
	end)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Original KDV3";
		Duration = 2;
		Text = "Credits to Hemi/Nitro-GT (Former Oxide Owner...)"
	})
	task.wait(3)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "KDV3 Modded";
		Duration = 2;
		Text = "To SonixDev/Crimson (seriously though, his script's my inspiration)"
	})
	task.wait(3)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Modded Gelatek Reanim";
		Duration = 2;
		Text = "To Theo/Paradigm (not much though. Gelatekussy the OG tho!)"
	})
	task.wait(3)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Audio Downloader Idea";
		Duration = 2;
		Text = "To Theo/Paradigm"
	})
	task.wait(3)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Music Change";
		Duration = 2;
		Text = "To Test_033333/Venlafaxine"
	})
	--sonixery was here
	--hi skid
	--you know i really hate skids...
