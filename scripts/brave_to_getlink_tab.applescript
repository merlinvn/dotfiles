#!/usr/bin/osascript
tell application "Brave Browser"
	activate
	
	if (count of windows) = 0 then
		open location "https://spro.getlink.vn/spro25/99k/1108252/m2286k28866/?id=leech"
		return
	end if
	
	tell front window
		set secondTab to tab 2
		
		if URL of secondTab contains "getlink.vn" then
			set active tab index to 2
		else
			open location "https://spro.getlink.vn/spro25/99k/1108252/m2286k28866/?id=leech"
		end if
	end tell
end tell
