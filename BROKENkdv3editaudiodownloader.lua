-- i totally fucking hated when this shit bugs the fuck out of the files so i wont update this shit
-- unless yall can help out in making this function, ill be glad

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

if not isfile("Dances/Buckshot Roulette OST - You are an Angel (extended).ogg") then
	writefile("Dances/Buckshot Roulette OST - You are an Angel (extended).ogg", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/Buckshot%20Roulette%20OST%20-%20You%20are%20an%20Angel%20(extended).ogg?raw=true"))
	warn("Downloaded!")
end

if not isfile("Dances/Charli XCX - speed drive (femtanyl remix).ogg") then
	writefile("Dances/Charli XCX - speed drive (femtanyl remix).ogg", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/Charli%20XCX%20-%20speed%20drive%20(femtanyl%20remix).ogg?raw=true"))
	warn("Downloaded!")
end

if not isfile("Dances/K1LL SOMEBODY.ogg") then
	writefile("Dances/K1LL SOMEBODY.ogg", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/K1LL%20SOMEBODY.ogg?raw=true"))
	warn("Downloaded!")
end

if not isfile("Dances/MIX. 02 - BOTHERED!.ogg") then
	writefile("Dances/MIX. 02 - BOTHERED!.ogg", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/MIX.%2002%20-%20BOTHERED!.ogg?raw=true"))
	warn("Downloaded!")
end

if not isfile("Dances/Mr. Scoops - Something has to happen (REUPLOAD).ogg") then
	writefile("Dances/Mr. Scoops - Something has to happen (REUPLOAD).ogg", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/Mr.%20Scoops%20-%20Something%20has%20to%20happen%20(REUPLOAD).ogg?raw=true"))
	warn("Downloaded!")
end

if not isfile("Dances/femtanyl - WEIGHTLESS!.ogg") then
	writefile("Dances/femtanyl - WEIGHTLESS!.ogg", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/femtanyl%20-%20WEIGHTLESS!.ogg?raw=true"))
	warn("Downloaded!")
end

if not isfile("Dances/h00dbyair x pretty girl (cursed mashups).ogg") then
	writefile("Dances/h00dbyair x pretty girl (cursed mashups).ogg", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/h00dbyair%20x%20pretty%20girl%20(cursed%20mashups).ogg?raw=true"))
	warn("Downloaded!")
end

if not isfile("Dances/harinezumi all plats.ogg") then
	writefile("Dances/harinezumi all plats.ogg", 
	game:HttpGet("https://github.com/testing033333/music/blob/Audio-1/harinezumi%20_all%20plats_.ogg?raw=true"))
	warn("Downloaded!")
end


warn("Done! You can now have fun! Or not actually, since you might sometimes get an error (in some people's cases).")
