#! /usr/bin/ruby

def main
	cards = `pacmd list-cards`.split(/\s+index: \d+\s*$/)
	cards = cards[1, cards.length] #Remove the descriptor
	count = 0
	match = false
	
	#I use my MSI B450 Tomahawk 7.1 integrated HD audio
	#Search for whatever your card is called
	want = /Family 17h/
	
	#Set this profile to what you want
	#I use surround 7.1 and stereo input on my machine
	profile = 'output:analog-surround-71+input:analog-stereo'
	
	#Check for a match
	for card in cards
		if card.match(want)
			match = true
			break
		end
		count += 1
	end
	
	if match
		`pacmd set-card-profile #{count} #{profile}`
	else
		puts "\n\nFATAL: Unable to set profile. No card is found with the description: #{want}!\n\n"
	end
end

main