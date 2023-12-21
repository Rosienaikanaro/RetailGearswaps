--[[

	Kanryu_BLU.lua
	
	2/10/22

]]

	--Includes--
	include('Send_Functions.lua')
	res = require 'resources'
	
	--Enable All--
	send_command('gs enable all')
	
	--Set Macro Information and Lockstyle--
	send_command('input /macro book 16; wait .1;input /macro set 10; wait 5; style')

	--Command Aliases--
	send_command('alias dt gs c dt')	--DT Trigger
	send_command('alias hyb gs c hyb') 	--Hybrid Trigger
	
	--Blue Mage Spell Setup Commands - Requires AzureSets from the Windower Launcher--	
	send_command('alias blumab gs c blumab')
	send_command('alias blutiz gs c blutiz')
	send_command('alias bluody gs c bluody')
	send_command('alias blusor gs c blusor')
	
	--Blue Mage Weapon Setup Commands--
	send_command('alias tizona gs c tizona')
	send_command('alias savage gs c savage')
	send_command('alias halo gs c halo')
	send_command('alias mab gs c mab')
	send_command('alias tank gs c tank')

--Main()--
function get_sets()

	--Variable Triggers--
	DTTrigger 	= 	0
	HybridTrigger = 1
	
	--Spell Sets - BLU Exclusive --
	
	blue = {}
	
	blue.Heal	=	S{'Exuviation','Healing Breeze','Magic Fruit','Plenilune Embrace',
		'Pollen','Restoral','White Wind','Wild Carrot', }
	
	blue.Skill	=	S{'Diamondhide','Magic Barrier','Occultation','Plasma Charge','Reactor Cool', }
	
	blue.Nuke	=	S{'Anvil Lightning','Blinding Fulgor','Droning Whirlwind','Entomb','Rending Deluge','Scouring Spate',
			'Searing Tempest','Silent Storm','Spectral Floe','Subduction','Tenebral Crush', }
	
	blue.MAcc	=	S{'Absolute Terror', 'Actinic Burst', 'Auroral Drape', 'Blank Gaze', 'Blistering Roar', 'Cesspool', 'Corrosive Ooze',
			'Cruel Joke', 'Demoralizing Roar', 'Dream Flower', 'Enervation', 'Feather Tickle', 'Frightful Roar', 'Geist Wall', 
			'Jettatura', 'Magic Hammer', 'MP Drainkiss', 'Osmosis', 'Reaving Wind', 'Sheep Song', 'Soporific', 'Temporal Shift',
			'Thunderbolt', 'Voracious Trunk', 'Yawn', }
			
	blue.HAcc	=	S{'Benthic Typhoon', 'Bilgestorm', 'Frypan', 'Head Butt', 'Saurian Slide', 'Sudden Lunge', 'Sweeping Gouge',
			'Tail Slap', 'Whirl of Rage', 'Tearing Gust', 'Tourbillion', }
	
	--Weapon Sets--
	
		sets.Weapons = {}
		
		--Tizona DD Setup--
		sets.Weapons.Tizona = {
			main 	=	"Tizona",
			sub		= 	"Thibron",
		}
		
		--Savage DD Setup--
		sets.Weapons.Savage = {
			main 	=	"Naegling",
			sub		= 	"Thibron",
		}
		
		--Blunt DD Setup--
		sets.Weapons.Club = {
			main	=	"Maxentius",
			sub		= 	"Thibron",
		}
		
		--Nuking Weapons--
		sets.Weapons.Magic = {
			main	=	"Maxentius",
			sub		=	"Bunzi's Rod",
		}		
		
		--Ody Eva Tanking--
		sets.Weapons.Tank = {
			main 	=	"Tizona",
			sub		= 	"Sakpata's Sword",
		}
	
	--Idle Sets--
		
		sets.Idle = {}
		
		--Standard Idle Set--
		sets.Idle.DT = {
			ammo	=	"Staunch Tathlum +1",
			head	=	"Nyame Helm",
			neck	=	"Dualism Collar +1",
			lear	=	"Eabani Earring",
			rear	=	"Etiolation Earring",
			body	=	"Hashishin Mintan +2",
			hands	=	"Nyame Gauntlets",
			lring	=	"Vengeful Ring",
			rring	=	"Defending Ring",
			back	=	{ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Carrier's Sash",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--DT Idle Set--
		sets.Idle.Standard = set_combine(sets.Idle.DT, {
			legs	=	"Carmine Cuisses +1",
		})
		
		--Evasion Idle Set--
		sets.Idle.Evasion = set_combine(sets.Idle.DT, {
			neck	=	"Bathy Choker +1",
			rear	=	"Infused Earring",
			waist	=	"Svelt. Gouriz +1",
			feet	=	"Hippo. Socks +1",
		})
		
	--TP Sets--
	
		sets.engaged = {}
		
		--Standard TP Set--
		sets.engaged.Standard = {
			ammo	=	"Aurgelmir Orb +1",
			head	=	{ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
			neck	=	"Mirage Stole +2",
			lear	=	"Eabani Earring",
			rear	=	"Dedition Earring",
			body	=	"Malignance Tabard",
			hands	=	{ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
			lring	=	"Epona's Ring",
			rring	=	"Chirich Ring +1",			
			back	=	{ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Reiki Yotai",
			legs	=	"Malignance Tights",
			feet	=	"Malignance Boots",
		}
		
		--Aftermath Up Set--
		sets.engaged.AM = set_combine(sets.engaged.Standard, {
			head	=	"Malignance Chapeau",
			hands	=	"Malignance Gloves",
			lring	=	"Chirich Ring +1",
		})
		
		--Hybrid Set--
		sets.engaged.Hybrid = set_combine(sets.engaged.Standard, {
			rring	=	"Defending Ring",
		})
		
		--Hybrid AM Set--
		sets.engaged.HybridAM = set_combine(sets.engaged.AM, {
			rring	=	"Defending Ring",
		})
		
	--Weaponskill Sets--
	
		sets.WS = {}
		
		sets.WS.Moonshade	=	S{'Expiacion', 'Savage Blade', 'Black Halo', 'Chant du Cygne', }
		
		--Default WS Set--
		sets.WS.Standard = {
			ammo	=	"Crepuscular Pebble",
			head	=	"Nyame Helm",
			neck	=	"Mirage Stole +2",
			lear	=	"Crep. Earring",
			rear	=	"Ishvara Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Epaminondas's Ring",
			rring	=	"Metamor. Ring +1",
			back	=	{ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--Flash Nova WS Set--
		sets.WS['Flash Nova'] = set_combine(sets.WS.Standard, {
			ammo	=	"Pemphredo Tathlum",
			neck	=	"Baetyl Pendant",
			lear	=	"Regal Earring",
			rear	=	"Friomisi Earring",
			back	=	{ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
			waist	=	"Orpheus's Sash",
		})
		
		--Sanguine Blade WS Set--
		sets.WS['Sanguine Blade'] = set_combine(sets.WS.Standard, {
			head	=	"Pixie Hairpin +1",
			rring	=	"Archon Ring"
		})
		
	--Job Ability Sets--
	
		sets.JA = {}
		
		--Azure Lore Set--
		sets.JA['Azure Lore'] = {
			--hands	=	"Luhlaza Bazubands +3",
			hands	=	"Luhlaza Bazubands +1",
		}
		
		--Diffusion Duration Boots--
		sets.JA['Diffusion'] = {
			--feet	=	"Luhlaza Charuqs +3",
			feet	=	"Luhlaza Charuqs +1",
		}		
		
	--Spell Sets--
		
		--Precast Sets--
		
		sets.precast = {}
		
		--Default FC Set--
		sets.precast.FC = {
			ammo	=	"",
			head	=	{ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --14
			neck	=	"Orunmila's Torque", --5
			lear	=	"Enchntr. Earring +1", --2
			rear	=	"Loquac. Earring", --2
			body	=	"Pinga Tunic +1", --15
			hands	=	{ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, --8
			lring	=	"Kishar Ring", --4
			rring	=	"Rahab Ring", --2
			back	=	{ name="Rosmerta's Cape", augments={'MND+20','Accuracy+20 Attack+20','"Fast Cast"+10',}}, --10
			legs	=	"Pinga Pants +1", --13
			feet	=	{ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}}, --8
		}
		
		--Midcast Sets--
		sets.midcast = {}
		
		--Standard Nuke Gear--
		sets.midcast['Nuke'] = {
			ammo	=	"Ghastly Tathlum +1",
			head	=	"Hashishin Kavuk +2", 		
			neck	=	"Baetyl Pendant",
			lear	=	"Regal Earring",
			rear	=	"Friomisi Earring",
			body	=	"Hashishin Mintan +2",
			hands	=	"Hashi. Bazu. +2",
			lring	=	"Metamor. Ring +1",
			rring	=	"Defending Ring",			
			back	=	{ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
			waist	=	"Orpheus's Sash",
			legs	=	"Hashishin Tayt +2",
			feet	=	"Hashi. Basmak +2"
		}
		
		--Darkness Nuke Upgrade--
		sets.midcast['Tenebral Crush'] = set_combine(sets.midcast['Nuke'], {
			head	=	"Pixie Hairpin +1",
			lring	=	"Archon Ring"
		})
		
		--Magic Accuracy Set--
		sets.midcast['Magic Accuracy'] = {
			ammo	=	"Pemphredo Tathlum",
			head	=	"Assim. Keffiyeh +3",
			neck	=	"Mirage Stole +2",
			lear	=	"Regal Earring",
			rear	=	"Crep. Earring",
			body	=	"Hashishin Mintan +2",
			--hands	=	"Hashi. Bazu. +2",
			hands	=	"Malignance Gloves",
			lring	=	"Stikini Ring +1",
			rring	=	"Stikini Ring +1",
			back	=	"Aurists Cape +1",
			waist	=	"Acuity Belt +1",
			--legs	=	"Assim. Shalwar +3",
			legs	=	"Malignance Tights",
			feet	=	"Hashi. Basmak +2"
		}
		
		--Hybrid MAcc Set--
		sets.midcast['Hybrid Accuracy'] = set_combine(sets.midcast['Magic Accuracy'], {
			head	=	"Hashishin Kavuk +2",
			legs	=	"Hashishin Tayt +2",
		})
		
		--Blue Magic Skill Set--
		sets.midcast['Blue Skill'] = set_combine(sets.Idle.DT, {
			ammo	=	"Mavi Tathlum",
			--head	=	"Luh. Keffiyeh +3",
			head	=	"Luh. Keffiyeh +1",
			neck	=	"Mirage Stole +2",
			lear	=	"Njordr Earring",
			--rear	=	"Hashi. Earring +1",
			rear	=	"Hashishin Earring",			
			body	=	"Assim. Jubbah +3",
			hands	=	"Rawhide Gloves",
			lring	=	"Stikini Ring +1",
			rring	=	"Stikini Ring +1",
			back	=	"Cornflower Cape",
			legs	=	"Hashishin Tayt +2",
			--feet	=	"Luhlaza Charuqs +3",
			feet	=	"Luhlaza Charuqs +1",
		})
		
		--Healing Set - White Wind Focused--
		sets.midcast['Healing'] = {
			ammo	=	"Egoist's Tathlum",
			head	=	"Pinga Crown +1",
			neck	=	"Unmoving Collar +1",
			lear	=	"Odnowa Earring +1",
			rear	=	"Tuisto Earring",
			body	=	"Pinga Tunic +1",
			hands	=	"Telchine Gloves",
			lring	=	"Meridian Ring",
			rring	=	"Gelatinous Ring +1",
			back	=	"Moonlight Cape",
			waist	=	"Gold Mog. Belt",
			legs	=	"Pinga Pants +1",
			feet	=	"Carmine Greaves +1", --Path D
		}
		
end

--Precast Core--
function precast(spell, action)
	
	--Magic Precast Handler--
	if spell.action_type == 'Magic' then
		precast_magic(spell)
	end
	
	--Job Ability Precast Handler--
	if spell.type == 'JobAbility' then
		precast_ja(spell)
	end
		
	--Weapon Skill Precast Handler--
	if spell.type == "WeaponSkill" then
		precast_weaponskill(spell)		
	end
	
end

--Midcast Core--
function midcast(spell, action)
	
	--Magic Precast Handler--
	if spell.action_type == 'Magic' then
		midcast_magic(spell)
	end
	
	--Post Midcast--
	postmidcast(spell)

end

--Post Midcast Core--
function postmidcast(spell, action)

	--[[if (spell.skill == 'Elemental Magic' or spell.english == 'Sanguine Blade' or spell.skill == 'Blue Magic') 
		and (spell.element == world.day_element or spell.element == world.weather_element) then
			equip({waist="Hachirin-No-Obi"})
    end]]
	
	--Conditional Swaps - Neet to confirm upgraded method for OSash is working properly. Kthx--
	if spell.element == world.day_element or spell.element == world.weather_element then

		--Prioritize Obi in Double Weather or Weather+Day--
		if gearswap.res.weather[world.weather_id].intensity == 2 or 
			(spell.element == world.day_element and gearswap.res.weather[world.weather_id].intensity >= 1) then	
				equip({waist="Hachirin-No-Obi"})
			
		--Swap to Sash if none of the above and in range--
		elseif spell.target.distance < (7 + spell.target.model_size) then
			equip({waist="Orpheus's Sash"})
			
		--Finally use Obi if any affinity is present at all--
		else
			equip({waist="Hachirin-No-Obi"})
		end
	
	--Swap to Sash in range and no weather/day--
	elseif spell.target.distance < (15 + spell.target.model_size) then
		equip({waist="Orpheus's Sash"})
	end

end

--Aftercast Core--
function aftercast(spell, action)
	
	--Aftercast Function Trigger--
	if player.status == "Engaged" then
		aftercast_engaged()
	else
		aftercast_idle()
	end
	
end

--Custom Command Engine--
function self_command(command)

	--DT Trigger--
	if command == 'dt' then		
		if DTTrigger == 1 then
			add_to_chat(170, 'DT Toggled - Max Damage')
			DTTrigger = 0
		else
			add_to_chat(170, 'DT Toggled - Max DT')
			DTTrigger = 1
		end
	end
	
	--Hybrid Trigger--
	if command == 'hyb' then		
		if HybridTrigger == 1 then
			if DTTrigger == 1 then
				add_to_chat(170, 'Hybrid Toggled - Max Damage TP Restored (DT Override On)')
				HybridTrigger = 0
			else
				add_to_chat(170, 'Hybrid Toggled - Max Damage TP Restored')
				HybridTrigger = 0
			end
		else
			if DTTrigger == 1 then
				add_to_chat(170, 'Hybrid Toggled - Hybrid TP / Acc Set Enabled (DT Override On)')
				HybridTrigger = 1
			else
				add_to_chat(170, 'Hybrid Toggled - Hybrid TP / Acc Set Enabled')
				HybridTrigger = 1
			end
		end
	end
	
	--Spell Swaps
	
		--Set BLU MAB Spells--
		if command == 'blumab' then
			add_to_chat(214, 'Setting blue nuke cleave spells.')
			send_command('aset spellset blumab')
		end
		
		--Set BLU Melee Spells--
		if command == 'blutiz' then
			add_to_chat(214, 'Setting blue melee focused spells.')
			send_command('aset spellset blutiz')
		end
		
		--Set BLU Odyssea Spells--
		if command == 'bluody' then
			add_to_chat(214, 'Setting blue odyssea utility spells.')
			send_command('aset spellset odyssey')
		end
		
		--Set BLU Sortie Spells--
		if command == 'blusor' then
			add_to_chat(214, 'Setting blue sortie utility spells.')
			send_command('aset spellset sortie')
		end
	
	--Weapon Swaps
			
		--Equip Savage Setup--
		if command == 'tizona' then
			add_to_chat(170, 'Expiacion Set with Tizona and Thibron.')
			equip(sets.Weapons.Tizona)
		end
		--Equip Ten Setup--
		if command == 'savage' then
			add_to_chat(170, 'Savage Set with Naegling and Thibron.')
			equip(sets.Weapons.Savage)
		end
		--Equip Shun Setup--
		if command == 'halo' then
			add_to_chat(170, 'Black Halo Set with Maxentius and Thibron.')
			equip(sets.Weapons.Club)
		end	
		--Equip Chi Setup--
		if command == 'mab' then
			add_to_chat(170, 'Nuking Set with Maxentius and Bunzi\'s Rod.')
			equip(sets.Weapons.Magic)
		end
		--Equip Ku Setup--
		if command == 'tank' then
			add_to_chat(170, 'Tanking Set with Tizona and Sakpata\'s Sword.')
			equip(sets.Weapons.Tank)
		end	
	
	--Lockstyle Command--
	if command == 'style' then
		style()
	end
	
	aftercast()

end

--Subfunction for Magic Precast--
function precast_magic(spell, action)

	equip(sets.precast.FC)

end

--Subfunction for Job Ability Precast--
function precast_ja(spell, action)

	--Azure Lore Swap--
	if spell.english == "Azure Lore" then
		equip(sets.JA['Azure Lore'])
	end

end

--Subfunction for Weaponskill Precast--
function precast_weaponskill(spell, action)

	--Magic WS Blade Trigger--
	if spell.english == "Flash Nova" or spell.english == "Seraph Blade" or spell.english == "Burning Blade" then	
		equip(sets.WS['Flash Nova'])
		
	--Sanguine Blade Trigger--
	elseif spell.english == "Sanguine Blade" then
		equip(sets.WS['Sanguine Blade'])
	
	--Default WS Trigger--
	else 
		equip(sets.WS.Standard)
	end
		
	--Moonshade Trigger--
	if sets.WS.Moonshade:contains(spell.english) and player.tp < 2750 then
		equip({lear = 'Moonshade Earring'})
	end

end

--Subfunction for Midcast Magic--
function midcast_magic(spell, action)

	--Healing Spells--
	if blue.Heal:contains(spell.english) or spell.skill == "Healing Magic" then
		equip(sets.midcast['Healing'])
			
	--Blue Nukes--
	elseif blue.Nuke:contains(spell.english) then	
		if spell.english == "Tenebral Crush" then
			equip(sets.midcast['Tenebral Crush'])
		else
			equip(sets.midcast['Nuke'])
		end
		
	--MAcc Spell--
	elseif blue.MAcc:contains(spell.english) then
		equip(sets.midcast['Magic Accuracy'])
		
	--HAcc Spell--
	elseif blue.HAcc:contains(spell.english) then
		equip(sets.midcast['Hybrid Accuracy'])
		
	--Blue Skill Spell--
	elseif blue.Skill:contains(spell.english) then
		equip(sets.midcast['Blue Skill'])
		if buffactive['Diffusion'] then
			equip(sets.midcast['Diffusion'])
		end
		
	--Default to DT--
	else
		equip(sets.Idle.DT)
		if buffactive['Diffusion'] then
			equip(sets.midcast['Diffusion'])
		end
	end

end

--Aftercast Swap while Idle--
function aftercast_idle()

	--DT Swap--
	if DTTrigger == 1 then
		equip(sets.Idle.DT)
	elseif HybridTrigger == 1 then
		equip(sets.Idle.Evasion)		
	else
		equip(sets.Idle.Standard)
	end
	
	--Disability Swap--
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
		equip(sets.Idle.DT)
    end
	
end

--Aftercast Swap while Engaged--
function aftercast_engaged()

	--Non-Standard TP Function--	
	if DTTrigger == 1 then
		equip(sets.Idle.DT)
	elseif HybridTrigger == 1 and buffactive['Aftermath: Lv.3'] then
		equip(sets.engaged.HybridAM)
	elseif HybridTrigger == 1 then
		equip(sets.engaged.Hybrid)
	elseif buffactive['Aftermath: Lv.3'] then
		equip(sets.engaged.AM)
	else
		equip(sets.engaged.Standard)
	end
	
	--Disability Swap--
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
		equip(sets.Idle.DT)
    end
	
end

--Buff Gain Function--
function buff_change(buff,gain)

	--Handicap Protection--
	if buff == "terror" or buff == "petrification" or buff == "stun" or buff == "sleep" then
		
		--DT Gear On--
    	if gain then  
			equip(sets.Idle.DT)
		
		--Handicap Restore--
		else
			--Aftercast Function Trigger--
			if player.status == "Engaged" then
				aftercast_engaged()
			else
				aftercast_idle()
			end	
		end
	end		
	
end

--Status Change Core--
function status_change(new, old)

	--Aftercast Function Trigger--
	if player.status == "Engaged" then
		aftercast_engaged()
	else
		aftercast_idle()
	end	

end

--Main Weapon Check--
function type_check()

	if windower.ffxi.get_items(windower.ffxi.get_items().equipment.main_bag, windower.ffxi.get_items().equipment.main).id ~= nil then
		
		local weaponID = windower.ffxi.get_items(windower.ffxi.get_items().equipment.main_bag, windower.ffxi.get_items().equipment.main).id
		local weaponType = res.items[weaponID].skill
		
		return weaponType
		
	else
		return
	end

end

--Stylelock Function--
function style()

	--Set Scythe style.
	if type_check() == 11 then
		add_to_chat(170, "Locking style 003 for Dual Clubs.")
		send_command('input /lockstyleset 003')
	else
		add_to_chat(170, "Locking style 006 for Dual Swords.")
		send_command('input /lockstyleset 006')
	end

end