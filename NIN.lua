--[[

	Kanryu_NIN
	
	2/11/2022

]]

	--Includes
	
	--Enable All--
	send_command('gs enable all')	
	
	--Set Macro Information and Lockstyle--
	send_command('input /macro book 13; wait .1; input /macro set 10; wait 5; style')

	--Command Aliases--		Any custom commands for Windower should be put into this section.
	send_command('alias dt gs c dt')	--DT Trigger
	send_command('alias hyb gs c hyb') 	--Hybrid Trigger
	
	--Ninja Weapon Setup Commands--
	send_command('alias savage gs c melee')
	send_command('alias ten gs c ten')
	send_command('alias shun gs c shun')
	send_command('alias chi gs c chi')
	send_command('alias ku gs c ku')
	send_command('alias metsu gs c metsu')
	send_command('alias hi gs c hi')
	
--Main()--
function get_sets()

	--Variable Triggers--
	
	DTTrigger 	= 	0
	HybridTrigger = 1
	
	--Spell Sets--
	
		ninjutsu = {}	
			
		ninjutsu.MAcc	=	S{"Yurin: Ichi","Aisha: Ichi","Dokumori: Ichi","Kurayami: Ichi","Kurayami: Ni","Hojo: Ichi","Hojo: Ni","Jubaku: Ichi"}
		
		ninjutsu.Nuke	=	S{"Doton: Ichi","Doton: Ni","Doton: San","Suiton: Ichi","Suiton: Ni","Suiton: San","Huton: Ichi","Huton: Ni","Huton: San",
			"Katon: Ichi","Katon: Ni","Katon: San","Hyoton: Ichi","Hyoton: Ni","Hyoton: San","Raiton: Ichi","Raiton: Ni","Raiton: San"}

		ninjutsu.Utsu	=	S{"Utsusemi: Ichi","Utsusemi: Ni","Utsusemi: San"}
	
	--Weapon Sets--
	
		sets.Weapons = {}
		
		--Savage Set--
		sets.Weapons.Savage = {
			main	=	"Naegling",
			sub		=	"Uzura +2", --TP Bonus
		}
		
		--Ten/Chi/Shun Set--
		sets.Weapons.Ten = {
			main	=	"Heishi Shorinken",
			sub		=	"Kunimitsu",
		}
				
		--Ku Set--
		sets.Weapons.Ku = {
			main	=	"Gokotai",
			sub		=	"Kunimitsu",
		}
		
		--Metsu Set--
		sets.Weapons.Metsu = {
			main	=	"Kikoku",
			sub		=	"Kunimitsu",
		}
		
		--Hi Set--
		sets.Weapons.Hi = {
			main	=	"Kannagi",
			sub		=	"Gleti's Knife",
		}
		
		--Abyssea Proc Weapons - Level 1 Weapons for Red Proc--
			--** Used in no sets. Just here for inv space commitment.**--
		sets.Weapons.Abyssea = {
			main	=	"Aern Dagger",
			main	=	"Fermion Sword",
			main	=	"Irradiance Blade",
			main	=	"Ark Scythe",
			main	=	"Pitchfork +1",
			main	=	"Debahocho +1",
			main	=	"Wooden Katana",
			main	=	"Caduceus",
			main	=	"Cobra Staff",
		}
	
	--Idle Sets--
		
		sets.Idle = {}
		
		--DT Idle Set--
		sets.Idle.DT = {
			ammo	=	"Staunch Tathlum +1",
			head	=	"Nyame Helm",
			body	=	"Nyame Mail",
			neck	=	"Warder's Charm +1",
			lear	=	"Eabani Earring",
			rear	=	"Etiolation Earring",
			hands	=	"Nyame Gauntlets",
			lring	=	"Vengeful Ring",
			rring	=	"Defending Ring",
			waist	=	"Carrier's Sash",
			back	=	{ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--Standard Idle Set - DW for Gotokai--
		sets.Idle.Standard = set_combine(sets.Idle.DT, {
			head	=	"Ryuo Somen +1",
			neck	=	"Loricate Torque +1",
			lear	=	"Suppanomimi",
			rear	=	"Eabani Earring",
			body	=	"Hachiya Chain. +3",
			hands	=	"Floral Gauntlets",
			lring	=	"Gelatinous Ring +1",
			rring	=	"Defending Ring",
			back	=	{ name="Andartia's Mantle", augments={'Dual Wield +10',}},
			waist	=	"Reiki Yotai",
			legs	=	"Mochi. Hakama +3",
			feet	=	"Hiza. Sune-Ate +2",		
		})
		
		--Evasion Idle Set--
		sets.Idle.Evasion = set_combine(sets.Idle.DT, {
			ammo	=	"Yamarang",
			neck	=	"Bathy Choker +1",
			rear	=	"Infused Earring",
			waist	=	"Svelt. Gouriz +1",
		})
		
	--TP Sets--
	
		sets.engaged = {}
		
		--Standard TP Set--
		sets.engaged.Standard = {
			ammo	=	"Seki Shuriken",
			head	=	{ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
			neck	=	"Ninja Nodowa +2",
			lear	=	"Brutal Earring",
			rear	=	"Dedition Earring",		
			body	=	"Ken. Samue +1",
			hands	=	{ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
			lring	=	"Gere Ring",
			rring	=	"Epona's Ring",
			waist	=	"Sailfi Belt +1",
			back	=	{ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
			legs	=	"Ken. Hakama +1",
			feet	=	"Ken. Sune-ate +1",
		}
		
		--DT Hybrid Set--
		sets.engaged.Hybrid = set_combine(sets.engaged.Standard, {
			head	=	"Malignance Chapeau",
			body	=	"Malignance Tabard",
			hands	=	"Malignance Gloves",
			rring	=	"Defending Ring",
			legs	=	"Malignance Tights",
			feet	=	"Malignance Boots"
		})
		
	--Weaponskill Sets--
	
		sets.WS = {}
		
		sets.WS.Moonshade	=	S{'Savage Blade', 'Blade: Ten', 'Blade: Shun', 'Blade: Chi', }
		
		--Standard WS Set--
		sets.WS.Standard = {
			ammo	=	"Seeth. Bomblet +1",
			head	=	"Mpaca's Cap",
			neck	=	"Ninja Nodowa +2",
			lear	=	"Ishvara Earring",
			rear	=	"Lugra Earring +1",			
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Gere Ring",
			rring	=	"Epaminondas's Ring",
			back	=	{ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--'Blade: Shun' Set--
		sets.WS['Blade: Shun'] = {
			ammo	=	"Crepuscular Pebble",
			head	=	"Ken. Jinpachi +1",
			neck	=	"Ninja Nodowa +2",
			lear	=	"Odr Earring",
			rear	=	"Lugra Earring +1",
			body	=	"Malignance Tabard",
			hands	=	"Malignance Gloves",
			lring	=	"Gere Ring",
			rring	=	"Regal Ring",
			back	=	{ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			waist	=	"Fotia Belt",
			legs	=	"Mpaca's Hose",
			feet	=	"Ken. Sune-Ate +1"
		}
		
		--'Blade: Metsu' Set--
		sets.WS['Blade: Metsu'] = {
			ammo	=	"Aurgelmir Orb +1",
			head	=	"Nyame Helm",
			neck	=	"Ninja Nodowa +2",
			lear	=	"Mache Earring +1",
			rear	=	"Lugra Earring +1",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Gere Ring",
			rring	=	"Regal Ring",
			back	=	{ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--'Blade: Hi' Set--
		sets.WS['Blade: Hi'] = {
			ammo	=	"Yetshila +1",
			head	=	"Nyame Helm",
			neck	=	"Ninja Nodowa +2",
			lear	=	"Odr Earring",
			rear	=	"Lugra Earring +1",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Gere Ring",
			rring	=	"Regal Ring",
			back	=	{ name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Weapon skill damage +10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets"
		}
		
		--'Blade: Ku' Set--
		sets.WS['Blade: Ku'] = {
			ammo	=	"Seeth. Bomblet +1",
			head	=	"Mpaca's Cap",
			neck	=	"Ninja Nodowa +2",
			lear	=	"Mache Earring +1",
			rear	=	"Lugra Earring +1",
			body	=	{ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
			hands	=	"Mochizuki Tekko +3",
			lring	=	"Gere Ring",
			rring	=	"Regal Ring",
			back	=	{ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			waist	=	"Fotia Belt",
			legs	=	{ name="Rao Haidate +1", augments={'Path: B'}},
			feet	=	"Nyame Sollerets",
		}
		
		--'Blade: Chi/Teki/To' Set--
		sets.WS['Blade: Chi'] = {
			ammo	=	"Seeth. Bomblet +1",
			head	=	"Mochi. Hatsuburi +3",
			neck	=	"Ninja Nodowa +2",
			lear	=	"Ishvara Earring",
			rear	=	"Lugra Earring +1",			
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Gere Ring",
			rring	=	"Epaminondas's Ring",
			back	=	{ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
			waist	=	"Orpheus's Sash",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
	--Job Ability Sets--
	
		sets.JA = {}
		
	--Spell Sets--
		
		--Precast Sets--
		
		sets.precast = {}
		
		--Default FC Set--
		sets.precast.FC = set_combine(sets.Idle.DT, {
			ammo	=	"Sapience Orb", --2
			head	=	{ name="Herculean Helm", augments={'"Fast Cast"+6',}}, --13
			neck	=	"Orunmila's Torque", --5
			lear	=	"Loquac. Earring", --2
			rear	=	"Enchntr. Earring +1", --2
			body	=	{ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}}, --10
			hands	=	{ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, --8
			lring	=	"Kishar Ring", --4
			rring	=	"Rahab Ring", --2
			back	=	{ name="Andartia's Mantle", augments={'"Fast Cast"+10','Phys. dmg. taken-10%',}}, --10
			legs	=	{ name="Herculean Trousers", augments={'"Fast Cast"+6',}}, --6
			feet	=	{ name="Herculean Boots", augments={'"Fast Cast"+6',}}, --6
		})
		
		--Midcast Sets--
		sets.midcast = {}
		
		--Utsusemi Set--
		sets.midcast['Utsusemi'] = set_combine(sets.precast.FC, {
			feet	=	"Hattori Kyahan +1",
		})
		
		--MBurst Set--
		sets.midcast['MBurst'] = {
			ammo	=	"Ghastly Tathlum +1",
			head	=	"Mochi. Hatsuburi +3",
			neck	=	"Warder's Charm +1",
			lear	=	"Friomisi Earring",
			rear	=	"Static Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Metamor. Ring +1",
			rring	=	"Mujin Band",
			back	=	{ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist	=	"Orpheus's Sash",
			legs	=	"Nyame Flanchard",
			feet	=	"Mochi. Kyahan +3",
		}
		
		--MAcc Set--
		sets.midcast['MAcc'] = {
			ammo	=	"Yamarang",
			head	=	"Hachiya Hatsu. +3",
			neck	=	"Moonlight Necklace",
			lear	=	"Digni. Earring",
			rear	=	"Crep. Earring",
			body	=	"Malignance Tabard",
			hands	=	"Malignance Gloves",
			lring	=	"Stikini Ring +1",
			rring	=	"Stikini Ring +1",
			back	=	{ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist	=	"Eschan Stone",
			legs	=	"Malignance Tights",
			feet	=	"Hachiya Kyahan +3"
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

	if ninjutsu.Nuke:contains(spell.english) and spell.element == world.day_element or spell.element == world.weather_element then
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
				add_to_chat(170, 'Hybrid Toggled - Hybrid TP Set Enabled (DT Override On)')
				HybridTrigger = 1
			else
				add_to_chat(170, 'Hybrid Toggled - Hybrid TP Set Enabled')
				HybridTrigger = 1
			end
		end
	end
	
	--Weapon Swaps
	
		--Equip Savage Setup--
		if command == 'savage' then
			add_to_chat(170, 'Savage Set with Naegling and Hitaki.')
			equip(sets.Weapons.Savage)
		end
		--Equip Ten Setup--
		if command == 'ten' then
			add_to_chat(170, 'Ten Set with Heishi Shorinken and Kunimitsu.')
			equip(sets.Weapons.Ten)
		end
		--Equip Shun Setup--
		if command == 'shun' then
			add_to_chat(170, 'Shun Set with Heishi Shorinken and Kunimitsu.')
			equip(sets.Weapons.Ten)
		end	
		--Equip Chi Setup--
		if command == 'chi' then
			add_to_chat(170, 'Chi Set with Heishi Shorinken and Kunimitsu.')
			equip(sets.Weapons.Ten)
		end
		--Equip Ku Setup--
		if command == 'ku' then
			add_to_chat(170, 'Ku Set with Gokotai and Kunimitsu.')
			equip(sets.Weapons.Ku)
		end	
		--Equip Metsu Setup--
		if command == 'metsu' then
			add_to_chat(170, 'Metsu Set with Kikoku and Kunimitsu.')
			equip(sets.Weapons.Metsu)
		end	
		--Equip Hi Setup--
		if command == 'hi' then
			add_to_chat(170, 'Hi Set with Kannagi and Gelti\'s Knife.')
			equip(sets.Weapons.Hi)
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

end

--Subfunction for Weaponskill Precast--
function precast_weaponskill(spell, action)

	--Blade: Hi--
	if spell.english == "Blade: Hi" then
		equip(sets.WS['Blade: Hi'])
	
	--Blade: Ku--
	elseif spell.english == "Blade: Ku" then
		equip(sets.WS['Blade: Ku'])	 
	
	--Blade: Shun--
	elseif spell.english == "Blade: Shun" then
		equip(sets.WS['Blade: Shun'])
		
	--Blade: Metsu--
	elseif spell.english == "Blade: Metsu" then
		equip(sets.WS['Blade: Metsu'])

	--Blade: Chi--
	elseif spell.english == "Blade: Chi" or spell.english =="Blade: Teki" 
		or spell.english == "Blade: To" or spell.english == "Aeolian Edge" then
			equip(sets.WS['Blade: Chi'])
	
	--Default WS--
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
	
	--Enfeebling Ninjutsu--
	if ninjutsu.MAcc:contains(spell.english) then
		equip(sets.midcast['MAcc'])
			
	--Elemental Ninjutsu--
	elseif ninjutsu.Nuke:contains(spell.english) then
		equip(sets.midcast['MBurst'])
	
	--Utsusemi--	
	elseif ninjutsu.Utsu:contains(spell.english) then
		equip(sets.midcast['Utsusemi'])
	
	--Default to DT--
	else
		equip(sets.Idle.DT)
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
	if buffactive['terror'] or buffactive['petrification'] 
		or buffactive['stun'] or buffactive['sleep'] then
			equip(sets.Idle.DT)
    end
	
end

--Aftercast Swap while Engaged--
function aftercast_engaged()

	--Non-Standard TP Function--	
	if DTTrigger == 1 then
		equip(sets.Idle.DT)
	elseif HybridTrigger == 1 then
		equip(sets.engaged.Hybrid)
	else
		equip(sets.engaged.Standard)
	end
	
	--Disability Swap--
	if buffactive['terror'] or buffactive['petrification'] 
		or buffactive['stun'] or buffactive['sleep'] then
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

--Stylelock Function--
function style()

	--Lockstyle Function--
	send_command('input /lockstyleset 04;')	

end