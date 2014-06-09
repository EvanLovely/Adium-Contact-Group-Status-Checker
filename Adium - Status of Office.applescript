set _contactGroup to "PDX Office" # This is the group in Adium the script will check
set _statusToLookFor to "meeting" # Returns contacts with this in status
set _notificationPrefix to "In Meetings: " # What it says before the names get returned

tell application "Adium"
	set _allInfo to ""
	set _inMeeting to ""
	set _people to contacts of contact group _contactGroup
	repeat with _person in _people
		tell _person
			set _name to display name
			set _statusMessage to status message
			if _statusMessage contains _statusToLookFor then
				set _inMeeting to _inMeeting & _name & " "
			end if
		end tell
	end repeat
end tell
if _inMeeting is "" then
	display notification "No One's in a Meeting" with title _contactGroup & " Status"
else
	display notification _notificationPrefix & _inMeeting with title _contactGroup & " Status"
end if