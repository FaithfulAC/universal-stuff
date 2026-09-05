local got = game:HttpGet("https://raw.githubusercontent.com/FaithfulAC/universal-stuff/refs/heads/main/test.lua")

print("Got:", #got)

task.wait(.1)
loadstring(game:HttpGet(got))()
