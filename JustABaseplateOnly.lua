-- as said. its just for Just a Baseplate ONLY!
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
	warn("█   █  ███  █████ █████ ")
	warn("██  █ █   █   █   █     ")
	warn("█ █ █ █   █   █   ████  ")
	warn("█  ██ █   █   █   █     ")
	warn("█   █  ███    █   █████ ")
	warn("THIS IS 25% DONE!")
	warn("I only made this edit for the fun of it until i know how to type some stuff, don't expect anything significant here in this script... yet.")
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
	print("")
	print("7/2/25 - 7:04 AM PT")
	print("Old reanimation has been released into the repository! Apologies if I am late to announce this")
	print("")
        print("7/7/25 - 5:23 PM PT")
        print("I replaced some stuff with different emotes, hope you're a bit happy with it.")
	print("")
        print("7/7/25 - 10:36 PM PT")
        print("Okay, so I decided in replacing a few boring animations and replaced F, G, and H's Animation IDs with the ones that I have loved so much in the Old Modded KDV3 Version!")
	print("")
        print("7/11/25 - 4:29 PM PT")
        print("B and ] have been filled in!")
	print("Also, SonixApi has to be removed for a moment since this is causing some problems (sorry dude).")
	print("")
        print("7/12/25 - 8:46 PM PT")
        print("Replaced Page 3 U, H, Z, and C!")
        print("Also tweaked the startup of the script, allowing itself to load even faster!")
        print("")
        print("7/13/25 - 12:02 PM PT")
        print("Replaced Sitting Animations and Page 1 K.")
        print("")
        print("7/16/25 - 8:13 AM PT")
        print("ADDED EXTRA SPACE!!!!!!!!!")
        print("You heard me right! I have now added the extra dances in numbers in every page, giving me some more work and a hell lot of agonizing pain of searching every song and emote I have to find, especially Page 4!")
        print("NOTE! THIS IS IN WORK IN PROGRESS! I have to say this again, this gives me extra work that will take me 3 total days in finishing everything completely!")
        print("")
        print("7/17/25 - 12:46 PM PT")
        print("Page 4 has been easily completed (nvm its fucked up)!")
        print("Also, changed the sprint animation (nvm its fucked up)!")
        print("")
        print("7/19/25 - 9:10 AM PT")
        print("Added a bunch of animations, totalling to 30 emotes, along with returning the other 6! I am just as almost done, only needing to adjust the animation speed and then the music to finish off.")
        print("Replaced Page 4 7 and period's asset IDs.")
        print("")
        print("7/19/25 - 7:20 PM PT")
        print("36 ANIMATIONS FINALLY DONE!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("")
        print("7/21/25 - 1:52 PM PT")
        print("Okay, what if we make more space? Boom, keypads. Now I gotta have WAYYYYYYYYYYYYYYYYYYYYYYYY more work to do!")
        print("")
        print("7/22/25 - 9:45 PM PT")
        print("I've earned the right to hate myself.")
        print("")
        print("7/22/25 - 1:26 PM PT")
        print("Whew! 3 pages of extra space are done!!!")
        print("")
        print("7/24/25 - 9:24 AM PT")
        print("Updated Jumpstyle and Hero!")
        print("")
        print("7/27/25 - 12:41 PM PT")
        print("Forgot to mention about this script along with the old Reanimation version has been submitted to Scriptblox (7/25/25)!!")
        print("ALSO ADDED THE WRITEFILES IN EVERY KEY (fucking finally 😭)!!!!!!!!!!!!!!!!!")
        print("Only downside here though is the dances are beginning to load longer, so expect that while i make a downloader myself sometime.")
        print("")
        print("7/27/25 - 3:33 PM PT")
        print("Welp! Here ya go guys! A simple downloader! I fixed the loading problem with replacing the method on the keys into a single loadstring!")
        print("")
        print("7/28/25 - 8:54 PM PT")
        print("Fixed out the parts I missed out in the downloader!")
        print("I actually had to make updating the script easier because it's starting to put me in some pressure right now.")
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
	
	task.wait(0.5)
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "❤️";
			Duration = 4;
			Text = "Thank you for using this script."
	})
	task.wait(1)
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Have fun!";
			Duration = 4;
			Text = "Check the Console for any updates within this script."
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
        loadstring(game:HttpGet("https://raw.githubusercontent.com/testing033333/Krystal_Dance_Edit/refs/heads/main/ihadtoaddthisbecauseupdatingbothversionsistediousaf.lua"))()
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
		Title = "Updated Gelatek Reanim";
		Duration = 2;
		Text = "To Gelatekussy"
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
