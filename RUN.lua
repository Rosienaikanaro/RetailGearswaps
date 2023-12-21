--[[

	Kanryu_RUN
	
	1/30/22

]]

	--Includes--
	p = require('packets')

	--Enable All--
	send_command('gs enable all')
	
	--Set Macro Information and Lockstyle--
	send_command('input /macro book 22; wait .1; input /macro set 10; wait 5; style')

	--Command Aliases--
	send_command('alias dt gs c dt')	--DT Trigger
	send_command('alias hyb gs c hyb') 	--Hybrid Trigger
	
	--Rune Fencer Tank Commands--
	send_command('alias spi gs c spellint')
	send_command('alias rune gs c rune')
	send_command('bind ^1 rune')
	

--Main()--
function get_sets()

	--Variable Triggers--
	DTTrigger 	= 	0
	HybridTrigger = 1
	SpiTrigger 	= 	1
	
	--Rune Ladder Setup--
	runeIndex = 1
	runeArray = {"Tellus", "Unda", "Flabra", "Ignis", "Gelus", "Sulpor", "Lux", "Tenebrae"}
	
	--Spi BLU Spells
	UnstoppaBlu = S{"Geist Wall", "Sheep Song", "Soporific", "Cocoon"}
	
	--Weapon Sets--
	
		sets.Weapons = {}
		
		sets.Weapons.DD = {
			main	=	"Lionheart",
			sub		=	"Utu Grip",
		}
		
		sets.Weapons.Tank = {
			main	=	"Epeolatry",
			sub		=	"Kupayopl",
		}
		
	--Idle Sets--
		
		sets.Idle = {}
		
		--DT Idle Set--
		sets.Idle.DT = {
			ammo	=	"Yamarang",
			head	=	"Nyame Helm",
			neck	=	"Futhark Torque +2",
			lear	=	"Eabani Earring",
			rear	=	"Infused Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Defending Ring",
			rring	=	"Vengeful Ring",
			back	=	{ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
			waist	=	"Engraved Belt",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--Standard Idle Set--
		sets.Idle.Standard = set_combine(sets.Idle.DT, {
			feet	=	"Hippo. Socks +1",
		})
		
	--TP Sets--
	
		sets.engaged = {}
		
		--Standard TP Set--
		sets.engaged.Standard = {
			ammo	=	"Coiste Bodhar",
			head	=	{ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
			neck	=	"Anu Torque",
			lear	=	"Sherida Earring",
			rear	=	"Telos Earring",
			body	=	{ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
			hands	=	{ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
			lring	=	"Epona's Ring",
			rring	=	"Chirich Ring +1",
			back	=	{ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Nyame Flanchard",
			feet	=	{ name="Herculean Boots", augments={'Accuracy+24','"Triple Atk."+4','DEX+4',}},
		}
		
		--DT Hybrid Set--
		sets.engaged.Hybrid = set_combine(sets.engaged.Standard, {
			ammo	=	"Staunch Tathlum +1",
			neck	=	"Futhark Torque +2",
			body	=	"Ashera Harness",
			lring	=	"Moonlight Ring +1",
			rring	=	"Moonlight Ring +1",
			legs	=	"Meg. Chausses +2",
		})
		
		sets.engaged.Tank = set_combine(sets.Idle.DT, {
			lear	=	"Sherida Earring",
			rear	=	"Odnowa Earring +1",
			hands	=	"Turms Mittens +1",
			lring	=	"Chirich Ring +1",
			rring 	=	"Moonlight Ring",
			back	=	{ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			feet	=	"Turms Leggings +1",
		})
		
	--Weaponskill Sets--
	
		sets.WS = {}
		
		sets.WS.Moonshade	=	S{'Dimidiation', 'Resolution', 'Judgement', 'Savage Blade'}
		
		--Default Generic WS Set--
		sets.WS.Standard = {
			ammo	=	"Knobkierrie",
			head	=	"Nyame Helm",
			neck	=	"Futhark Torque +2",
			lear	=	"Sherida Earring",
			rear	=	"Ishvara Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Regal Ring",
			rring	=	"Epaminondas's Ring",
			back	=	{ name="Ogma's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Double Attack" +10%','Phys. dmg. taken-10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets"
		}
		
		sets.WS['Dimidiation'] = set_combine(sets.WS.Standard, {
			back	=	{ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		})
		
		--'Resolution' Set--
		sets.WS['Resolution'] = {
		
		}
		
	--Enmity Set--
		
		sets.Enmity = {
			ammo	=	"Sapience Orb",
			head	=	"Halitus Helm",
			neck	=	"Futhark Torque +2",
			lear	=	"Trux Earring",
			rear	=	"Cryptic Earring",
			body	=	"Emet Harness +1",
			hands	=	"Kurys Gloves",
			lring	=	"Defending Ring",
			rring	=	"Eihwaz Ring",
			back	=	{ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
			waist	=	"Audumbla Sash",
			legs	=	"Eri. Leg Guards +1",
			feet	=	"Erilaz Greaves +1",
		}
		
	--Job Ability Sets--
		--[[ For RUN a number of JAs are registered differently. See the below sections for breakdown.]]
	
		sets.JA = {}
		
		--Standard JA Sets--
		
			--'Elemental Sforzo' Set--		
			sets.JA['Elemental Sforzo'] = set_combine(sets.Enmity, {
				body	=	"Futhark Coat +3"
			})
			
			--'Swordplay' Set--
			sets.JA['Swordplay'] = set_combine(sets.Enmity, {
				hands	=	"Futhark Mitons +3"
			})
			
			--'Vivacious Pulse' Set--
			sets.JA['Vivacious Pulse'] = set_combine(sets.Enmity, {
				head	=	"Erilaz Galea +1"
			})
		
		--Effusion Sets--
		
			--'Lunge / Swipe' Set--
			sets.JA['Lunge'] = {
			
			}
			
			--'Gambit' Set--
			sets.JA['Gambit'] = set_combine(sets.Enmity, {
				hands 	=	"Runeist's Mitons +3"
			})
			
			--'Rayke' Set--
			sets.JA['Rayke'] = set_combine(sets.Enmity, {
				feet	=	"Futhark Boots +3"
			})
		
		--Ward Sets--
		
			--'Vallation / Valiance' Set--	
			sets.JA['Valiance'] = set_combine(sets.Enmity, {
				body	=	"Runeist's Coat +3",
				legs	=	"Futhark Trousers +3",
			})
			
			--'Pflug' Set--
			sets.JA['Pflug'] = set_combine(sets.Enmity, {
				feet	=	"Runeist's Boots +3	"
			})
			
			--'Battuta' Set--
			sets.JA['Battuta'] = set_combine(sets.Enmity, {
				head	=	{ name="Fu. Bandeau +3", augments={'Enhances "Battuta" effect',}},
			})
			
			--'Liement' Set--
			sets.JA['Liement'] = set_combine(sets.Enmity, {
				body	=	"Futhark Coat +3"
			})
		
	--Spell Sets--
		
		--Precast Sets--
		
		sets.precast = {}
		
		--Default FC Set--
		sets.precast.FC = {
			ammo	=	"Sapience Orb",
			head	=	"Rune. Bandeau +3",
			neck	=	"Orunmila's Torque",
			lear	=	"Odnowa Earring +1",
			rear	=	"Etiolation Earring",
			body	=	{ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
			hands	=	"Leyline Gloves",
			lring	=	"Moonlight Ring",
			rring	=	"Moonlight Ring",
			back	=	{ name="Ogma's cape", augments={'Fast Cast',}},
			legs	=	"Aya. Cosciales +2",
			feet	=	"Carmine Greaves +1"
		}
		
		--Midcast Sets--
		sets.midcast = {}
		
		--Enhancing Duration Set--
		sets.midcast['Enhancing Duration'] = set_combine(sets.Idle.DT, {
			head	=	"Erilaz Galea +1",
			legs	=	"Futhark Trousers +1",
		})
		
		--Enhancing Skill Set--
		sets.midcast['Enhancing Skill'] = set_combine(sets.Idle.DT, {
			head	=	"Carmine Mask +1",
			neck	=	"Incanter's Torque",
			lear	=	"Andoaa Earring",
			rear	=	"Mimir Earring",
			body	=	"Manasa Chasuble",
			hands	=	"Runeist's Mitons +3",
			lring	=	"Stikini Ring +1",
			rring	=	"Stikini Ring +1",
			back	=	"Merciful Cape",
			waist	=	"Olympus Sash",
			legs	=	"Carmine Cuisses +1"
		})
		
		--Skill + Duration Set--
			--[[Must replicate the Enhancing Duration set in here.]]
		sets.midcast['Enhancing Duration + Skill'] = set_combine(sets.midcast['Enhancing Skill'], {
			head	=	"Erilaz Galea +1",
			legs	=	"Futhark Trousers +1",
		})
		
		--Regen Duration Set--
		sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Duration'], {
			head	=	"Rune. Bandeau +3"
		})
		
		--Phalanx Set--
		sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Skill'], {
			head	=	"Fu. Bandeau +3",
			body	=	{ name="Taeon Tabard", augments={'Spell interruption rate down -9%','Phalanx +3',}},
			hands	=	{ name="Taeon Gloves", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Fast Cast"+3','Phalanx +3',}},
			legs	=	{ name="Taeon Tights", augments={'Accuracy+25','"Triple Atk."+2','Phalanx +3',}},
			feet	=	{ name="Taeon Boots", augments={'Accuracy+18','Spell interruption rate down -10%','Phalanx +3',}},
		})
		
		--SIRD Set--
		sets.midcast['SIRD'] = set_combine(sets.Enmity, {
			ammo	=	"Staunch Tathlum +1",
			head	=	"Agwu's Cap",
			neck	=	"Moonlight Necklace",
			ear1	=	"Eabani Earring",
			ear2	=	"Halasz Earring",
			body	=	"Nyame Mail",
			hands	=	"Rawhide Gloves",
			ring1	=	"Defending Ring",
			ring2	=	"Gelatinous Ring +1",
			back	=	{ name="Ogma's cape", augments={'SIRD Cape',}},
			waist	=	"Audumbla Sash",
			legs	=	"Carmine Cuisses +1",
			feet	=	"Nyame Sollerets"
		})
	
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
	
	--Effusion--
	if spell.type == "Effusion" then
		precast_effusion(spell)
	end
			
	--Ward--
	if spell.type == "Ward" then
		precast_ward(spell)		
	end
	
	--Rune Switch Start--
	if spell.type == "Rune" then
		runeLock(spell)
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

	if spell.skill == 'Elemental Magic' and (spell.element == world.day_element or spell.element == world.weather_element) then
		equip({waist="Hachirin-No-Obi"})
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
				add_to_chat(170, 'Hybrid Toggled - Hybrid TP / DT Set Enabled (DT Override On)')
				HybridTrigger = 1
			else
				add_to_chat(170, 'Hybrid Toggled - Hybrid TP / DT Set Enabled')
				HybridTrigger = 1
			end
		end
	end
	
	--SpellInterupt Trigger--
	if command == 'spellint' then
		if SpiTrigger == 1 then
			add_to_chat(170, 'SpellInterupt Toggled - Enmity Restored')
			SpiTrigger = 0
		else
			add_to_chat(170, 'SpellInterupt Toggled - No Stopping Us Now!')
			SpiTrigger = 1
		end
	end	
	
	--Rune Repeater--
	if command == 'rune' then
		send_command('input /ja '..runeArray[runeIndex]..' <me>')
	end
	
	--Lockstyle Command--
	if command == 'style' then
		style()
	end
	
end

--Subfunction for Magic Precast--
function precast_magic(spell, action)

	equip(sets.precast.FC)
	
end

--Subfunction for Job Ability Precast--
function precast_ja(spell, action)

	--2hr Trigger--
	if spell.english == "Elemental Sforzo" then
		equip(sets.JA['Elemental Sforzo'])
		
	--Swordplay Trigger--
	elseif spell.english == "Swordplay" then
		equip(sets.JA['Swordplay'])
		
	--Vpulse Trigger--
	elseif spell.english == "Vivacious Pulse" then
		equip(sets.JA['Vivacious Pulse'])
		
	--Default--
	else	
		equip(sets.Enmity)
	end
	
end

--Subfunction for Effusion Precast--
function precast_effusion(spell, action)
	
	--Lunge / Swipe Trigger--
	if spell.english == "Lunge" or "Swipe" then
		equip(sets.JA['Lunge'])
		
	--Gambit Trigger--
	elseif spell.english == "Gambit" then
		equip(sets.JA['Gambit'])
		
	--Rayke Trigger--
	elseif spell.english == "Rayke" then
		equip(sets.JA['Rayke'])
	end
	
end

--Subfunction for Ward Precast--
function precast_ward(spell, action)
	
	--Pflug Trigger--
	if spell.english == "Pflug" then
		equip(sets.JA['Pflug'])
		
	--Valiance / Vallation Trigger--
	elseif spell.english == "Valiance" or "Vallation" then
		equip(sets.JA['Valiance'])
		
	--Liement Trigger--
	elseif spell.english =="Liement" then
		equip(sets.JA['Liement'])
		
	--Battuta Trigger--
	elseif spell.english == "Battuta" then
		equip(sets.JA['Battuta'])
	end
	
end

--Subfunction for Weaponskill Precast--
function precast_weaponskill(spell, action)

	--Resolution--
	if spell.english == "Resolution" or spell.english == "Realmrazor" then
		equip(sets.WS['Resolution'])
	elseif spell.english == "Dimidiation" then
		equip(sets.WS['Dimidiation'])
	else
		equip(sets.WS.Standard)
	end
		
	if sets.WS.Moonshade:contains(spell.english) and player.tp < 2750 then
		equip({lear = 'Moonshade Earring'})
	end

end

--Subfunction for Midcast Magic--
function midcast_magic(spell, action)

	--SIRD Gear Override--
	if SpiTrigger == 1 and UnstoppaBlu:contains(spell.english) then
		equip(sets.midcast.SpellInterupt)
	
	--MidCast Gear for Enhancing Magic--
	elseif spell.skill == 'Enhancing Magic' then
	
		--Regen Trigger--
		if string.find(spell.english,'Regen')then
			equip(sets.midcast['Regen'])
			
		--Phalanx Trigger--
		elseif spell.english == "Phalanx" then
			equip(sets.midcast['Phalanx'])
			
		--Temper Trigger--
		elseif spell.english == "Temper" and buffactive['Embolden'] then
			equip(sets.midcast['Enhancing Skill'])
						
		--Foil Exception--
		elseif spell.english == "Foil" then
			equip(sets.Enmity)
			
		--Default Enhancing--
		else
			equip(sets.midcast['Enhancing Duration'])
		end
		
	--Default--
	else
		equip(sets.Enmity)
	end

end

--Aftercast Swap while Idle--
function aftercast_idle()

	--DT Swap--
	if DTTrigger == 1 then
		equip(sets.Idle.DT)
		
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
		equip(sets.engaged.Tank)
	elseif HybridTrigger == 1 then
		equip(sets.engaged.Hybrid)
	else
		equip(sets.engaged.Standard)
	end
	
	--Disability Swap--
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
			equip(sets.Idle.DT)
    end
	
end

--Rune Switch Function--
function runeLock(spell)
	
	--Rune Switch--
	if(spell.english == "Tellus" and runeIndex ~= 1) then
		runeIndex = 1
		add_to_chat(200,'Tellus Locked -- Earth Damage -- Thunder Resist')
	elseif(spell.english == "Unda" and runeIndex ~= 2) then
		runeIndex = 2
		add_to_chat(200,'Unda Locked -- Water Damage -- Fire Resist')
	elseif(spell.english == "Flabra" and runeIndex ~= 3) then
		runeIndex = 3
		add_to_chat(200,'Flabra Locked -- Wind Damage -- Earth Resist')
	elseif(spell.english == "Ignis" and runeIndex ~= 4) then
		runeIndex = 4
		add_to_chat(200,'Ignis Locked -- Fire Damage -- Ice Resist -- ')
	elseif(spell.english == "Gelus" and runeIndex ~= 5) then
		runeIndex = 5
		add_to_chat(200,'Gelus Locked -- Ice Damage -- Wind Resist')
	elseif(spell.english == "Sulpor" and runeIndex ~= 6) then
		runeIndex = 6
		add_to_chat(200,'Sulpor Locked -- Thunder Damage -- Water Resist -- ')
	elseif(spell.english == "Lux" and runeIndex ~= 7) then
		runeIndex = 7
		add_to_chat(200,'Lux Locked -- Light Damage -- Dark Resist')
	elseif(spell.english == "Tenebrae" and runeIndex ~= 8) then
		runeIndex = 8
		add_to_chat(200,'Tenebrae Locked -- Darkness Damage -- Light Resist')
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

--Phalanx Parser--
windower.raw_register_event("incoming chunk", function(id, data)

    if id == 0x028 then
	
        local packet = p.parse('incoming', data)
 
        if packet["Category"] == 8 and packet["Target 1 ID"] == windower.ffxi.get_player().id then
     
            if packet["Target 1 Action 1 Param"] == 107 then
				send_command("gs equip sets.midcast['Phalanx']")
				windower.add_to_chat(210,"Phalanx II Incoming")
            end
 
        end 
		
		if packet["Category"] == 4 and packet["Target 1 ID"] == windower.ffxi.get_player().id then
     
            if packet["Param"] == 107 then
				windower.add_to_chat(210,"Phalanx II Complete")
				send_command("gs equip sets.Idle.DT")
            end
 
        end 
		
    end
	
end)

--Unload--
function file_unload()
    send_command('unbind ^1 rune')
end

--Stylelock Function--
function style()

	--Lockstyle Function--
	send_command('input /lockstyleset 001;')	

end