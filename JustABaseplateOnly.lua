
-- THIS HERE IS BROKEN AF
	-- if isfile and isfolder and writefile and (getsynasset or getcustomasset) and (not isfolder("Dances")) then
	-- game:GetService("StarterGui"):SetCore("SendNotification", {
		-- Title = "Hey!";
		-- Duration = 5;
		-- Text = "This only shows up once if your new to this."
	-- })
	-- task.wait(1.500)
	-- local Bindable = Instance.new("BindableFunction")
		-- local function Copy(e)
			-- BROKEN loadstring(game:HttpGet("https://raw.githubusercontent.com/testing033333/Krystal-Dance-V3-Edit/refs/heads/main/kdv3editaudiodownloader.lua"))()
			-- Bindable:Destroy()
		-- end
		-- Bindable.OnInvoke = Copy
		-- game.StarterGui:SetCore("SendNotification",{
			-- Title = "Mp3 Package ";
			-- Text = "Click the download button to download the .mp3 package for Krystal Dance V3, its not a virus i swear.";
			-- Duration = 10;
			-- Callback = Bindable,
			-- Button1 = "Download Audios";
		-- })

	-- task.wait(1.500)
	-- game:GetService("StarterGui"):SetCore("SendNotification", {
		-- Title = "Service";
		-- Duration = 1;
		-- Text = "Wait For the mp3 to finish downloading, then the script will run automatically."
	-- })
	-- task.wait(1.500)
	-- game:GetService("StarterGui"):SetCore("SendNotification", {
		-- Title = "Service";
		-- Duration = 1;
		-- Text = "Audios Finished Downloading, Now Proceeding to reanimate."
	-- })
	-- task.wait(180)
	-- end



	-- task.wait(1.500)
	-- game:GetService("StarterGui"):SetCore("SendNotification", {
		-- Title = "Krystal Dance V3";
		-- Duration = 1;
		-- Text = "Checking Updates..."
	-- })
	-- task.wait(1.500)
	-- loadstring(game:HttpGet("https://raw.githubusercontent.com/testing033333/Krystal-Dance-V3-Edit/refs/heads/main/kdv3editaudiodownloader.lua"))() 
	-- Automatically Downloads Updates ^
									---  |
	task.wait(.1)
	warn("█   █  ███  █████ █████ ")
	warn("██  █ █   █   █   █     ")
	warn("█ █ █ █   █   █   ████  ")
	warn("█  ██ █   █   █   █     ")
	warn("█   █  ███    █   █████ ")
	warn("THIS IS VERY WIP!")
	warn("I only made this edit for the fun of it until i know how to type some stuff, don't expect anything significant here in this script... yet")
        warn("Most emotes might lack any music. Just give some patience while I try to search for a fitting song for the first 3 pages.")
	print("-------------------------------------------------------------------------")
	print("Log!")
	print("")
	print("6/25/25 - 8:07 PM PT")
	print("❤️ Thank you, Sonix! this edit has finally existed! ❤️")
	print("One condition being that the autoloading clothes will be removed, as requested for safety.")
	print("")
	print("6/27/25 - 5:49 PM PT")
	print("With a couple failed attempts, I present to you... an audio downloader! Totally not taken from Theo's idea whatsoever.")
	print("As for the news about Crimson now taking the spot for Hemi's work. Yes, may they live a good life.")
        print("")
        print("6/29/25 - 3:47 PM PT")
        print("I AM FILLED WITH TOTAL REGRET IN APPLYING THE DOWNLOADER OMFG!!!!")
        print("I changed some music btw idk if y'all ok with it.")
	print("")
	print("6/29/25 - 7:58 PM PT")
	print("Changed reanimation!!!!")
	print("Hat falling chances have now been reduced!")
	print("Antifling no longer needed (somewhat if you needed an extra step of protection against flingers)!")
	print("And, now easily customizable!!!!")
	print("-------------------------------------------------------------------------")
	print("This script uses Gelatek's Reanimation, which gives out some pros.")
	print("1. It prevents accessories from floating away, helpful when you want to afk and not see yourself be an abomination or whatever.")
	print("2. It stops body parts from going chaotic. Any animation that is really fast causes your limbs to detach. With Gelatek, say goodbye to that!")
	print("")
	print("While it does help with a stable character, it has quite a handful of cons.")
	print("1. Hats will often fall off to the void commonly than the previous reanimation, which means Handle isn't handling anything. This is also the case when your at a low FPS, which I find it strange that happened (SOLVED WITH THE UPDATED VERSION OF THE REANIMATION!!!)")
	print("2. Roblox will crash VERY often when you do an emote. This only happens when you do it while moving and when stopanim() is active")
	print("3. Some animations may get a little less smooth, the animations I have placed into the script might look rough, but if you ever get used to it, this wouldn't be included as a con.")
	print("-------------------------------------------------------------------------")
        
	local Global = (getgenv and getgenv()) or shared
Global.GelatekReanimateConfig = {
    -- [[ Rig Settings ]] --
    ["AnimationsDisabled"] = false,
    ["R15ToR6"] = false,
    ["DontBreakHairWelds"] = true,
    ["PermanentDeath"] = true,
    ["Headless"] = true,
    ["TeleportBackWhenVoided"] = true,
    
    -- [[ Reanimation Settings ]] --
    ["AlignReanimate"] = true,
    ["FullForceAlign"] = true,
    ["FasterHeartbeat"] = true,
    ["DynamicalVelocity"] = true,
    ["DisableTweaks"] = true,
    
    -- [[ Optimization ]] --
    ["OptimizeGame"] = false,

    -- [[ Miscellacious ]] --
    ["LoadLibrary"] = false,
    ["DetailedCredits"] = false,
    
    -- [[ Flinging Methods ]] --
    ["TorsoFling"] = false,
    ["BulletEnabled"] = false,
    ["BulletConfig"] = {
        ["RunAfterReanimate"] = true,
        ["LockBulletOnTorso"] = false
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekReanimate/main/Main.lua"))()
-- Hey, this is for collision and don't removed these or you would noclip though the wall.
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

wait(0.5)

for _, part in pairs(character:GetDescendants()) do
if part:IsA("BasePart") then
part.CanCollide = false
end
end
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Prepared!";
			Duration = 4;
			Text = "Gelatek Reanimation is now active."
	})
	
	task.wait(1)
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "❤️";
			Duration = 4;
			Text = "Thank you for using this script."
	})
	task.wait(1)
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Loading script...";
			Duration = 20;
			Text = "Check the Console for any updates within this script."
	})
	task.wait(7)
	-- Krystal Dance V3, Made by Hemi (es muy janky)
	if not getgenv()["Animator"] then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/xhayper/Animator/main/Source/Main.lua"))()
	end
	task.wait(2.750)
	local player = game:GetService("Players").LocalPlayer
		local character = player.Character
		if not character then return end
		-- Play animation
		local Intro = Animator.new(character, 18435303746)
		Intro:Play()
	task.wait(3.550)
	if not isfolder("Dances") then 
		makefolder("Dances")
		end
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
	local OxideApi = loadstring(game:HttpGet("https://raw.githubusercontent.com/sparezirt/Utility/refs/heads/main/.github/SonixApi"))()
	local timeposcur = 0 
	OxideApi.Notification("Krystal Dance Modded V1 by Sonixery, Full Credits to Crimson",10)
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
				sound69.SoundId = customasset("Dances/NO MERCY III [FULL ALBUM].mp3")
					else 
						sound69.SoundId = customasset("Dances/NO MERCY III [FULL ALBUM].mp3")  
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
	local mode = 1 


	local INPUTLOOP 
	local uis = game:GetService("UserInputService")
	INPUTLOOP = uis.InputBegan:Connect(function(k,chatting)
		if char.Humanoid.Sit == true then return end
		if chatting then return end 
			local k = string.lower(string.gsub(tostring(k.KeyCode),"Enum.KeyCode.",""))
		if mode == 1 then 
		if k == "q" then 
			if dancing == false then 
				stopanim()
	dancing = true
	task.wait(.005)
				sound69.SoundId = customasset("Dances/rat.mp3")
				timeposcur = sound69.TimePosition 
	sound69:Play()
				playanim(106353328250763)
			else
				stopanim()
			end
		elseif k == "e" then 
			if dancing == false then 
	stopanim()
	dancing = true
	task.wait(.005)
	sound69.SoundId = customasset("Dances/boogie.mp3")
	sound69.PlaybackSpeed = 2
	timeposcur = sound69.TimePosition 
	sound69:Play()
	playanim(16769959846)
			else
	stopanim()
	sound69.PlaybackSpeed = 1

	end
			elseif k == "r" then 
	if dancing == false then 
		stopanim()
	dancing = true
	task.wait(.005)
		sound69.SoundId = customasset("Dances/MIX. 01 - PICKMEUP!.mp3")
		sound69.PlaybackSpeed = 1
		timeposcur = sound69.TimePosition 
	sound69:Play()
		playanim(128853270774115,1.25)
	else
		stopanim()
		sound69.PlaybackSpeed = 1
		
		end
	elseif k == "t" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/ScoutLaugh.mp3")
			sound69.PlaybackSpeed = 1
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13845017130)
		else
			stopanim()
			sound69.PlaybackSpeed = 1
			
			end
		elseif k == "y" then 
			if dancing == false then 
	stopanim()
	dancing = true
	task.wait(.005)
	sound69.SoundId = customasset("Dances/femtanyl - MURDER EVERY 1 U KNOW! (feat. takihasdied).mp3")
	sound69.PlaybackSpeed = 1
	timeposcur = sound69.TimePosition 
	sound69:Play()
	playanim(100864643591096)
			else
	stopanim()
	sound69.PlaybackSpeed = 1

	end
		elseif k == "u" then 
	if dancing == false then 
		stopanim()
	dancing = true
	task.wait(.005)
		sound69.SoundId = customasset("Dances/atention.ogg")
		sound69.PlaybackSpeed = 1
		timeposcur = sound69.TimePosition 
	sound69:Play()
		playanim(103597509139287,1.19)
	else
		stopanim()
		sound69.PlaybackSpeed = 1
		
	end
	elseif k == "f" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/order.mp3")
			sound69.PlaybackSpeed = 2
			char.Humanoid.WalkSpeed = 4*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(130968726197789)
		else
			stopanim()
			
		end
	elseif k == "g" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/c00lkidd1 (feat. ilyhiryu).mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(75462948983147,1.175)
		else
			stopanim()
			
		end
	elseif k == "p" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/DINNER!.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(97072681531610)
		else
			stopanim()
			
		end
	elseif k == "j" then 
		if dancing == false then 
			stopanim()
	dancing = true
	task.wait(.005)
			sound69.SoundId = customasset("Dances/RUBOOTLEG.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(75462948983147,1.175)
		else
			stopanim()
			
		end
	elseif k == "k" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/825 hp.ogg")
			char.Humanoid.WalkSpeed = 0*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(123466997748392)
		else
			char.Humanoid.WalkSpeed = 0*char:GetScale()
			stopanim()
			
		end
	elseif k == "l" then 
		if dancing == false then 
			stopanim()
		dancing = true
		task.wait(.005)
			sound69.SoundId = customasset("Dances/Conga.mp3")
			char.Humanoid.WalkSpeed = 4*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(18985751348)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "z" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/jump.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(75462948983147,1.225)
		else
			stopanim()
			
		end
	elseif k == "x" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/kazot.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(114036336168567,1)
		else
			stopanim()
			
		end
	elseif k == "h" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/QQAZBOOTLEGG (EDIT Version).ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(75462948983147,1.075)
		else
			stopanim()
			
		end
	elseif k == "v" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Highland - Solo Tu, but its the best part (sped up bass boosted).ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(92699725136780)
		else
			stopanim()
			
		end

	elseif k == "c" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/ily.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(140670228658366,30)
		else
			stopanim()
			
		end
	elseif k == "n" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Turbine2.61.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(75462948983147,1.0)
		else
			stopanim()
			
		end

						elseif k == "comma" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/PSYCHO.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(75462948983147,1.175)
		else
			stopanim()
			
		end
	elseif k == "leftbracket" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Lagtrain.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(131559207454945)
		else
			stopanim()
			
		end
	elseif k == "quote" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/wush2 (feat. ilyhiryu).mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(75462948983147,1.175)
		else
			stopanim()
			
		end

									end
									end
	if mode == 2 then 
		if k == "q" then 
			if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/XO.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(73559770055600)
		else
			stopanim()
			
			end 
		elseif k == "e" then
						if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/ElevatorMusic2.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(16361576857)
		else
			stopanim()
			
						end 
			elseif k == "r" then
						if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/fuji.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(101564911432113)
		else
			stopanim()
			
						end 
			elseif k == "t" then 
			if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/hellwalker.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(124210157097622)
		else
			stopanim()
			
			end
			elseif k == "y" then 
			if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Celestia.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(15039779727)
		else
			stopanim()
			
		end
	elseif k == "h" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/faster.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(10609437925)
		else
			stopanim()
			
		end
	elseif k == "g" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/ITS TIME.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(14887006269,1.05)
		else
			stopanim()
			
		end
									elseif k == [[f]] then 
										if dancing == false then 
											stopanim()
											dancing = true
											task.wait(.005)
											sound69.SoundId = customasset("Dances/femtanyl - AND IM GONE.ogg")
											timeposcur = sound69.TimePosition 
	sound69:Play()
											playanim(98256622649150,1.6)
										else
											stopanim()
											
										end
	elseif k == "j" then 
		if dancing == false then 
	stopanim()
	dancing = true
	task.wait(.005)
	sound69.SoundId = customasset("Dances/Mr. Scoops - Something has to happen (REUPLOAD).ogg")
	sound69.PlaybackSpeed = 1
	timeposcur = sound69.TimePosition 
	sound69:Play()
	coolparticles.Parent = char.Torso
	playanim(118865990558686)
		else
	stopanim()
	sound69.PlaybackSpeed = 1

	end
									elseif k == "k" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/F33L1NG SPRUNK111.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(131155721688011)
		else
			stopanim()
			
		end
	elseif k == "u" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/H3AD4CHE - Femtanyl-Inspired Song by Deimos.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(111038494387073,1.5)
		else
			stopanim()
			
		end
	elseif k == "n" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			playanim(90819860436349)
		else
			stopanim()
			
		end
	elseif k == "z" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/leftright.mp3")
			timeposcur = sound69.TimePosition 
			sound69:Play()
			playanim(137845929482571)
		else
			stopanim()
			
		end    
	elseif k == "x" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/heavylove.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(85856686932206)
		else
			stopanim()
			
		end
	elseif k == "c" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/7 - You are an Angel.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(109123683211464)
		else
			stopanim()
		end
	elseif k == "v" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/StockDance.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(15039780593)
		else
			stopanim()
		end
	elseif k == "p" then
		if dancing == false then
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/DanceofNights.mp3")
			timeposcur = sound69.TimePosition
			sound69:Play()
			playanim(13456829762)
		else
			stopanim()

		end
	elseif k == "l" then
		if dancing == false then
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/M3 N MIN3.ogg")
			timeposcur = sound69.TimePosition
			sound69:Play()
			playanim(105416804363388,30)
		else
			stopanim()

		end
						elseif k == "comma" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/phonkyturn.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(89046713686252,3)
		else
			stopanim()
			
		end
	elseif k == "leftbracket" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/true_heart.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(131776726113292)
		else
			stopanim()
			
		end
	elseif k == "quote" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Rewind.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(140376973204352)
		else
			stopanim()
			
		end
	end 
	end
	if mode == 3 then 
	if k == "q" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - LOVESICK, CANNIBAL! (feat takihasdied).ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(73116243097694,1.6)
		else
			stopanim()
		end
	elseif k == "e" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/brain.mp3")
			char.Humanoid.WalkSpeed = 4*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(86485871533985)
		else
			stopanim()
		end
	elseif k == "r" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/harinezumi _all plats_.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13357063395,1,true,nil,false)
		else
			stopanim()
		end
	elseif k == "t" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/h00dbyair x pretty girl (cursed mashups).ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(87342159331194,1.5)
		else
			stopanim()
		end
	elseif k == "y" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/rakuten.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(18985726113)
		else
			stopanim()
		end
	elseif k == "u" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/bimbam.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(16361564081)
		else
			stopanim()
		end
		elseif k == "f" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/MIX. 02 - BOTHERED!.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(79630525228564,2)
		else
			stopanim()
		end
	elseif k == "g" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/ATTACKING VERTICAL.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(120262284704633,.8)
		else
			stopanim()
		end
		elseif k == "h" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/boom.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(84471848998012)
		else
			stopanim()
		end
		elseif k == "j" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/doodle.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(137721173051346)
		else
			stopanim()
		end
			elseif k == "k" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/hypno.mp3")
			timeposcur = sound69.TimePosition  
	sound69:Play()
			playanim(72723551972407)
		else
			stopanim()
		end
				elseif k == "z" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Assumptions.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(75148929064618)
		else
			stopanim()
		end
					elseif k == "x" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/rotten.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(109990576374190,2)
		else
			stopanim()
		end
					elseif k == "c" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/danceifyourethegoat.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(80641587562132,2)
		else
			stopanim()
		end
						elseif k == "v" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Charli XCX - speed drive (femtanyl remix).ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(100305033962391,4)
		else
			stopanim()
		end
							elseif k == "n" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/K1LL SOMEBODY.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(71723925114737,1.25)
		else
			stopanim()
		end
	elseif k == "p" then
		if dancing == false then
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/pogo.mp3")
			timeposcur = sound69.TimePosition
			sound69:Play()
			playanim(8829798048,1.5)
		else
			stopanim()

		end
	elseif k == "l" then
		if dancing == false then
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/CarShearer.mp3")
			timeposcur = sound69.TimePosition
			sound69:Play()
			playanim(82286209518466,1.95)
		else
			stopanim()

		end
						elseif k == "comma" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Mystery.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(131401099812672)
		else
			stopanim()
			
		end
	elseif k == "leftbracket" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/true_heart.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(131776726113292)
		else
			stopanim()
			
		end
	elseif k == "quote" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/Rewind.mp3")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(140376973204352)
		else
			stopanim()
			
	end
	end
	end
	if mode == 4 then
	if k == "q" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(136801345243320,2)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
		end
	elseif k == "e" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 75*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(132995180148321,0.35)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
		end
	elseif k == "r" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 10*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(18855613409)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
		end
	elseif k == "t" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			timeposcur = sound69.TimePosition  
	sound69:Play()
			playanim(18855608155)
		else
			stopanim()
		end
	elseif k == "y" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 20*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(80969079335476,1,true,nil,false)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
		end
	elseif k == "u" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 75*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(82515455150436,0.4)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
		end
	elseif k == "p" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 0*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(18855616922,0.7)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
		end
	elseif k == "leftbracket" then
		if dancing == false then
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			timeposcur = sound69.TimePosition
			sound69:Play()
			playanim(81609277711227,50)
		else
			stopanim()

		end
	elseif k == "f" then
		if dancing == false then
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 250*char:GetScale()
			timeposcur = sound69.TimePosition
			sound69:Play()
			playanim(18855631329,0.5)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()

		end
	elseif k == "g" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 100*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(136270759594013,0.5)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()

		end
	elseif k == "h" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 85*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(132794172846241,3.5)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "j" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(74138372568467,500)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "k" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(108545083040120,0.5)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "l" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(17799224866,6)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end

	elseif k == "quote" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(94638356008696,4)
		else
			stopanim()
			
		end
	elseif k == "z" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(77891041839483,2)
		else
			stopanim()
			
		end
	elseif k == "z" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(13294790250)
		else
			stopanim()
			
		end
	elseif k == "x" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(82974998324452,10)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "c" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 6*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(95034083206292,2)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "v" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(88110878712745,2)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "n" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(131031060776962,3)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "comma" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 8*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(91787441180652,2)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
	elseif k == "rightbracket" then 
		if dancing == false then 
			stopanim()
			dancing = true
			task.wait(.005)
			sound69.SoundId = customasset("Dances/femtanyl - WEIGHTLESS!.ogg")
			char.Humanoid.WalkSpeed = 1000*char:GetScale()
			timeposcur = sound69.TimePosition 
	sound69:Play()
			playanim(105555482421711,1.5)
		else
			char.Humanoid.WalkSpeed = 14*char:GetScale()
			stopanim()
			
		end
			end 
	end
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
				playanim(133312100962627,1,false)
				else 
				playanim(122775909441631,1,false)
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
		Text = "Credits to Hemi/Nitro-GT (Former Oxide Owner)"
	})
	task.wait(3)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "KDv3 Modded";
		Duration = 2;
		Text = "To SonixDev/Crimson"
	})
	task.wait(3)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Updated Gelatek Reanim";
		Duration = 2;
		Text = "To Gelatekussy"
	})
	task.wait(3)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "This Edit of KDV3";
		Duration = 2;
		Text = "To Test_033333/Venlafaxine"
	})
	--sonixery was here
	--hi skid
	--you know i really hate skids...
