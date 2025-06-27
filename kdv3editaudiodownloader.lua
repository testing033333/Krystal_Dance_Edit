if not isfolder("Dances") then
	makefolder("Dances")
end
task.spawn(function()
	warn("Since I can't obfuscate this shit from how ENORMOUS the damn code is, I didnt have a choice but to leave it open-sourced and all that shit exposed into the open.")
	task.wait(0.2)
	warn("By the way, the music I am putting here is just for some idle background music that I could hope to myself to create one that plays a random one, but if you wanted it from emotes, I can't stop you.")
	task.wait(0.2)
	warn("Downloading a couple songs!!")
end)

if not isfile("Dances/buckshot.mp3") then
	writefile("Dances/buckshot.mp3", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/Buckshot%20Roulette%20OST%20-%20You%20are%20an%20Angel%20(extended).mp4?raw=true"))
	warn("Downloaded!")
end

if not isfile("Dances/charlixcx.mp3") then
	writefile("Dances/charlixcx.mp3", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/Charli%20XCX%20-%20speed%20drive%20(femtanyl%20remix).mp4?raw=true"))
	warn("Downloaded!")
end

if not isfile("Dances/imgonna.mp3") then
	writefile("Dances/imgonna.mp3", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/K1LL%20SOMEBODY.mp4?raw=true"))
	warn("Downloaded!")
end

if not isfile("Dances/bothered.mp3") then
	writefile("Dances/bothered.mp3", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/MIX.%2002%20-%20BOTHERED!.mp4?raw=true"))
	warn("Downloaded!")
end

if not isfile("Dances/ithappened.mp3") then
	writefile("Dances/ithappened.mp3", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/Mr.%20Scoops%20-%20Something%20has%20to%20happen%20(REUPLOAD).mp4?raw=true"))
	warn("Downloaded!")
end

if not isfile("Dances/weight.mp3") then
	writefile("Dances/weight.mp3", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/femtanyl%20-%20WEIGHTLESS!.mp4?raw=true"))
	warn("Downloaded!")
end

if not isfile("Dances/cursed.mp3") then
	writefile("Dances/cursed.mp3", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/h00dbyair%20x%20pretty%20girl%20(cursed%20mashups).mp4?raw=true"))
	warn("Downloaded!")
end

if not isfile("Dances/hedge.mp3") then
	writefile("Dances/hedge.mp3", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/harinezumi%20_all%20plats_.mp4?raw=true"))
	warn("Downloaded!")
end


warn("Done! You can now have fun! Or not actually, since you might sometimes get an error (in some people's cases)")
