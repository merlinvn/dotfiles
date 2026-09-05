#!/usr/bin/osascript
tell application "Brave Browser"
	activate
	
	if (count of windows) = 0 then
		open location "https://mail.google.com"
		return
	end if
	
	tell front window
		set firstTab to tab 1
		
		if URL of firstTab contains "mail.google.com" then
			set active tab index to 1
		else
			open location "https://mail.google.com"
		end if
	end tell
end tell

