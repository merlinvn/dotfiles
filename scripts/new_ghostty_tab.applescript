#!/usr/bin/osascript

if application "Ghostty" is running then
	tell application "Ghostty" to activate
	delay 0.1
	
	tell application "System Events"
		tell process "Ghostty"
			set frontmost to true
			-- Prefer menu click; fallback to Cmd+T
			try
				click menu item "New Tab" of menu "File" of menu bar item "File" of menu bar 1
			on error
				keystroke "t" using command down
			end try
		end tell
	end tell
else
	-- Launch Ghostty explicitly
	do shell script "open -a Ghostty"
	-- Optional: bring to front once it’s up
	repeat until (application "Ghostty" is running)
		delay 0.1
	end repeat
	tell application "Ghostty" to activate
end if

