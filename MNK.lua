--[[

	Kanryu_MNK
	
	2/6/22

]]

	--Includes--
	p = require('packets')

	--Enable All--
	send_command('gs enable all')
	
	--Set Macro Information and Lockstyle--
	send_command('input /macro book 20; wait .1;input /macro set 10;')

	--Command Aliases--		Any custom commands for Windower should be put into this section.
	send_command('alias dt gs c dt')	--DT Trigger
	send_command('alias hyb gs c hyb') 	--Hybrid Trigger
	send_command('alias ct gs c counter') 	--Hybrid Trigger
	
	--Monk Weapon Setup Commands--
	send_command('alias veres gs c veres') --Veres Trigger
	send_command('alias gh gs c gh') --Godhands Trigger
	send_command('alias cata gs c cata') --Cataclysm Trigger
		

--Main()--
function get_sets()

	--Variable Triggers--
	DTTrigger 		=	0
	HybridTrigger 	=	1
	CounterTrigger 	= 	0
	
	--Weapon Sets--
	
		sets.Weapons = {}
		
		sets.Weapons.Veres = {
			main	=	"Verethragna",
		}
		
		sets.Weapons.GH = {
			main	=	"Godhands",			
		}
		
		sets.Weapons.Cata = {
			main	=	"Kaja Staff",
			sub		=	"Alber Strap",
		}
		
	--Idle Sets--
		
		sets.Idle = {}
		
		--DT Idle Set--
		sets.Idle.DT = {
			ammo	=	"Staunch Tathlum +1", --3
			head	=	"Nyame Helm", --7
			neck	=	"Bathy Choker +1",
			lear	=	"Eabani Earring",
			rear	=	"Infused Earring",
			body	=	"Nyame Mail", --10
			hands	=	"Nyame Gauntlets", --7
			lring	=	"Defending Ring", --10 
			rring	=	"Vengeful Ring", 
			back	=	{ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, --10
			waist	=	"Carrier's Sash",
			legs	=	"Nyame Flanchard", --8
			feet	=	"Nyame Sollerets", --7
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
			head	=	"Ken. Jinpachi +1",
			neck	=	"Mnk. Nodowa +2",
			lear	=	"Schere Earring",
			rear	=	"Sherida Earring",
			body	=	"Ken. Samue +1",
			hands	=	"Mpaca's Gloves",
			lring	=	"Niqmaddu Ring",
			rring	=	"Gere Ring",
			back	=	{ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
			waist	=	"Moonbow Belt +1",
			legs	=	"Mpaca's Hose",
			feet	=	"Malignance Boots",
		}
		
		--DT Hybrid Set--
		sets.engaged.Hybrid = set_combine(sets.engaged.Standard, {
			ammo	=	"Staunch Tathlum +1",
			body	=	"Mpaca's Doublet",
		})
		
		--Impetus TP Set--
		sets.engaged.Impetus = set_combine(sets.engaged.Standard, {
			body	=	"Bhikku Cyclas +1",
		})
		
		--Footwork TP Set--
		sets.engaged.Footwork = set_combine(sets.engaged.Standard, {
			feet	=	"Anch. Gaiters +3",
		})
		
		--Counter Turtle Set--
		sets.engaged.Counter = {
			ammo	=	"Staunch Tathlum +1", --3
			head	=	"Malignance Chapeau", --6
			neck	=	"Bathy Choker +1",
			lear	=	"Eabani Earring",
			rear	=	"Cryptic Earring",
			body	=	"Mpaca's Doublet", --10
			hands	=	"Malignance Gloves", --5
			lring	=	"Defending Ring", --10 
			rring	=	"Vengeful Ring", 
			back	=	{ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, --10
			waist	=	"Moonbow Belt +1", --6
			legs	=	"Anch. Hose +3",
			feet	=	"Ken. Sune-Ate +1",		
		}
		
	--Weaponskill Sets--
	
		sets.WS = {}
		
		sets.WS.Moonshade	=	S{'Raging Fists', 'Victory Smite', 'Tornado Kick', 'Cataclysm'}
		
		--Default Generic WS Set--
		sets.WS.Standard = {
			ammo	=	"Coiste Bodhar",
			head	=	"Mpaca's Cap",
			neck	=	"Mnk. Nodowa +2",
			lear	=	"Schere Earring",
			rear	=	"Sherida Earring",
			body	=	{ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
			hands	=	{ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
			lring	=	"Niqmaddu Ring",
			rring	=	"Gere Ring",
			back	=	{ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
			waist	=	"Moonbow Belt +1",
			legs	=	"Mpaca's Hose",
			feet	=	"Tatena. Sune. +1"
		}
		
		--Shijin Spiral WS Set (Focused towards MAcc for Plague)--
		sets.WS['Shijin Spiral'] = {
			ammo	=	"Coiste Bodhar",
			head	=	"Malignance Chapeau",
			neck	=	"Mnk. Nodowa +2",
			lear	=	"Mache Earring +1",
			rear	=	"Sherida Earring",
			body	=	"Malignance Tabard",
			hands	=	"Malignance Gloves",
			lring	=	"Niqmaddu Ring",
			rring	=	"Gere Ring",
			back	=	{ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
			waist	=	"Moonbow Belt +1",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets"
		}
		
		--Victory Smite WS Sets--
		sets.WS['Victory Smite'] = {
			ammo	=	"Coiste Bodhar",
			head	=	{ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
			neck	=	"Mnk. Nodowa +2",
			lear	=	"Schere Earring",
			rear	=	"Sherida Earring",
			body	=	"Ken. Samue +1",
			hands	=	"Ryuo Tekko +1",
			lring	=	"Niqmaddu Ring",
			rring	=	"Gere Ring",
			back	=	{ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
			waist	=	"Moonbow Belt +1",
			legs	=	"Mpaca's Hose",
			feet	=	"Tatena. Sune. +1",
		}
		
		sets.WS['Imp - VS'] = set_combine(sets.WS['Victory Smite'], {
			body	=	"Bhikku Cyclas +1",
		})
		
		--Tornado Kick WS Set--
		sets.WS['Tornado Kick'] = {
			ammo	=	"Coiste Bodhar",
			head	=	"Mpaca's Cap",
			neck	=	"Mnk. Nodowa +2",
			lear	=	"Schere Earring",
			rear	=	"Sherida Earring",
			body	=	"Tatena. Harama. +1",
			hands	=	"Tatena. Gote +1",
			lring	=	"Niqmaddu Ring",
			rring	=	"Gere Ring",
			back	=	{ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
			waist	=	"Moonbow Belt +1",
			legs	=	"Mpaca's Hose",
			feet	=	"Anch. Gaiters +3",			
		}
		
		--Howling Fist WS Set--
		sets.WS['Howling Fist'] = {
			ammo	=	"Coiste Bodhar",
			head	=	"Mpaca's Cap",
			neck	=	"Mnk. Nodowa +2",
			lear	=	"Schere Earring",
			rear	=	"Sherida Earring",
			body	=	"Tatena. Harama. +1",
			hands	=	"Tatena. Gote +1",
			lring	=	"Niqmaddu Ring",
			rring	=	"Gere Ring",
			back	=	{ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
			waist	=	"Moonbow Belt +1",
			legs	=	"Mpaca's Hose",
			feet	=	"Tatena. Sune. +1",		
		}
		
		--Cataclysm WS Set--
		sets.WS['Cataclysm'] = {
			ammo	=	"Knobkierrie",
			head	=	"Pixie Hairpin +1",
			neck	=	"Baetyl Pendant",
			lear	=	"Novio Earring",
			rear	=	"Friomisi Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Archon Ring",
			rring	=	"Epaminondas's Ring",
			back	=	{ name="Segomo's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist	=	"Orpheus's Sash",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",			
		}
		
	--Job Ability Sets--
	
		sets.JA = {}
		
		--Penance Set--
		sets.JA["Penance"] = {
			head	=	"Hes. Crown +3",
		}
		
		--Focus Set--
		sets.JA["Focus"] = {
			head	=	"Anchor. Crown +3",
		}
		
		--Dodge Set--
		sets.JA[""] = {
			feet	=	"Anch. Gaiters +3",
		}
		
		--Hundred Fists Set--
		sets.JA["Hundred Fists"] = {
			legs	=	"Hes. Hose +3",
		}
		
		--Formless Strikes Set (Currently not merited)--
		sets.JA["Formless Strikes"] = {
			--body	=	"Hes. Cyclas +3",
		}
		
		--Mantra Set--
		sets.JA["Mantra"] = {
			feet	=	"Hes. Gaiters +3",
		}
		
		--Counterstance Set--
		sets.JA["Counterstance"] = {
			feet	=	"Hes. Gaiters +3",
		}
		
		--Footwork Set--
		sets.JA["Footwork"] = {
			feet 	=	"Shukuyu Sune-Ate",
		}
		
		--Chakra Set--
		sets.JA["Chakra"] = {
		
		}
		
		--Boost Set--
		sets.JA['Boost'] = {
			waist	=	"Ask Sash",
		}
		
		--Provoke--
		sets.JA["Provoke"] = {
			waist	=	"Chaac Belt",
			legs	=	"Volte Hose",
			feet	=	{ name="Herculean Boots", augments={'DEX+10','Pet: Mag. Acc.+25','"Treasure Hunter"+2','Accuracy+7 Attack+7',}},
		}
	
end

--Precast Core--
function precast(spell, action)
	
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

end

--Post Midcast Core--
function postmidcast(spell, action)

	if (spell.skill == 'Elemental Magic' or spell.english == 'Cataclysm') and (spell.element == world.day_element or spell.element == world.weather_element) then
		equip({waist="Hachirin-No-Obi"})
    end

end

--Aftercast Core--
function aftercast()
	
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
	
	--Counter Trigger--
	if command == 'counter' then		
		if CounterTrigger == 1 then
			add_to_chat(170, 'Counter Toggled - Max Damage')
			CounterTrigger = 0
		else
			add_to_chat(170, 'Counter Toggled - Max Counter')
			CounterTrigger = 1
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
	
	--Weapon Swap Triggers--
	if command == 'veres' then
		equip(sets.Weapons.Veres)
	end
	
	if command == 'gh' then
		equip(sets.Weapons.GH)
	end
	
	if command == 'cata' then
		equip(sets.Weapons.Cata)
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

	--Penance--
	if spell.english == "Chi Blast" then
		equip(sets.JA["Penance"])
	
	--Hundred Fists--
	elseif spell.english == "Hundred Fists" then
		equip(sets.JA["Hundred Fists"])
	
	--Formless Strikes--
	elseif spell.english == "Formless Strikes" then
		equip(sets.JA["Formless Strikes"])
	
	--Mantra--
	elseif spell.english == "Mantra" then
		equip(sets.JA["Mantra"])
		
	--Chakra--
	elseif spell.english == "Chakra" then
		equip(sets.JA["Chakra"])
		
	--Dodge--
	elseif spell.english == "Dodge" then
		equip(sets.JA["Dodge"])
		
	--Focus--
	elseif spell.english == "Focus" then
		equip(sets.JA["Focus"])
	
	--Counterstance--
	elseif spell.english == "Counterstance" then
		equip(sets.JA["Counterstance"])
	
	--Footwork--
	elseif spell.english == "Footwork" then
		equip(sets.JA["Footwork"])
	
	--Provoke (TH)--
	elseif spell.english == "Provoke" then
		equip(sets.JA["Provoke"])
	end
	
end

--Subfunction for Weaponskill Precast--
function precast_weaponskill(spell, action)

	--Shijin Spiral--
	if spell.english == "Shijin Spiral" then
		equip(sets.WS['Shijin Spiral'])
	
	--Victory Smite--
	elseif spell.english == "Victory Smite" then
		if buffactive['impetus'] then
			equip(sets.WS['Imp - VS'])
		else
			equip(sets.WS['Victory Smite'])	 
		end
	
	--Tornado Kick--
	elseif spell.english == "Tornado Kick" then
		equip(sets.WS['Tornado Kick'])	

	--Howling Fist--
	elseif spell.english == "Howling Fist" then
		equip(sets.WS['Howling Fist'])

	--Cataclysm
	elseif spell.english == "Cataclysm" then
		equip(sets.WS['Cataclysm'])
	
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
	
	if buffactive['Boost'] then
		add_to_chat(170, 'Boost is on.')
		equip(sets.JA['Boost'])
	end
	
end

--Aftercast Swap while Engaged--
function aftercast_engaged()

	--Non-Standard TP Function--	
	if DTTrigger == 1 then
		equip(sets.Idle.DT)
	elseif CounterTrigger == 1 then
		equip(sets.engaged.Counter)
	elseif HybridTrigger == 1 then
		equip(sets.engaged.Hybrid)
	else
		if buffactive['impetus'] then
			equip(sets.engaged.Impetus)
		else
			equip(sets.engaged.Standard)
		end
	end
	
	--Disability Swap--
	if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
			equip(sets.Idle.DT)
    end
	
	if buffactive['Boost'] then
		equip(sets.JA['Boost'])
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

	if buff == 'Boost' then
        if gain then
            equip(sets.JA['Boost'])
            disable('waist')
        else
            enable('waist')
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
	send_command('input /lockstyleset 02;')	

end