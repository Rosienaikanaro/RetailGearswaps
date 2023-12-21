--[[

	Kanryu_BLM.lua
	
	2/19/21

]]

--!!INIT!!--

	--Includes--

	--Enable All--
	send_command('gs enable all')
	
	--Set Macro Information and Lockstyle--
	send_command('input /macro book 04; wait .1; input /macro set 10; wait 5; style')
	
	--Command Aliases--	
	send_command('alias dt gs c dt')	--DT Trigger
	
	--Black Mage Spell Setup Commands--
	send_command('alias mburst gs c mburst')	--MBurst Trigger
	send_command('alias oa gs c oa')	--OAcumen Trigger

--Main()--
function get_sets()

	--Variable Triggers--
	DTTrigger 	= 	1
	MBurst 		=	0
	OAcumen		=	1
	
	--Spell Sets - BLU Exclusive --	
	blm = {}	
		
	blm.EleDoTs	=	S{"Rasp", "Drown", "Choke", "Burn", "Frost", "Shock", "Impact"}
	
	--Weapon Sets--
	
		sets.Weapons = {}
		
		sets.Weapons.Nuke = {
			main	=	"Marin Staff +1",
			sub		=	"Enki Strap",
		}
		
		sets.Weapons.Tank = {
			main 	=	"Kaumodaki",
			sub		= 	"Enki Strap",
		}
		
		sets.Weapons.SelfSC = {
			main 	=	"Khatvanga",
			sub		= 	"Khonsu",
		}
	
	--Idle Sets--
		
		sets.Idle = {}
		
		--Standard Idle Set--
		sets.Idle.DT = {
			ammo	=	"Staunch Tathlum +1",
			head	=	"Nyame Helm",
			--neck	=	"Src. Stole +2", --Temp for RP
			neck	=	"Dualism Collar +1",
			lear	=	"Eabani Earring",
			rear	=	"Lugalbanda Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Vengeful Ring",
			rring	=	"Defending Ring",
			back	=	{ name="Taranus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},
			waist	=	"Carrier's Sash",
			legs	=	"Nyame Flanchard",
			feet	=	"Hippo. Socks +1",
		}
		
		--DT Idle Set--
		sets.Idle.Standard = set_combine(sets.Idle.DT, {
			sub		= 	"Khonsu",
			neck	=	"Bathy Choker +1",
		})
		
	--Engaged Sets--
	
		sets.engaged = {}
	
		--Standard Engaged--
		sets.engaged.Standard = {
			ammo	=	"Amar Cluster",
			head	=	"Nyame Helm",
			neck	=	"Combatant's Torque",
			lear	=	"Crep. Earring",
			rear	=	"Telos Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Chirich Ring +1",
			rring	=	"Chirich Ring +1",
			back	=	{ name="Taranus's Cape",  augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Goading Belt",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
	--Weaponskill Sets--
	
		sets.WS = {}
		
		sets.WS.Moonshade	=	S{'Cataclysm', 'Spiral Hell', 'Earth Crusher', 'Myrkr', }
		
		--Cataclysm Set--
		sets.WS['Cataclysm'] = {
			ammo	=	"Pemphredo Tathlum",
			head	=	"Pixie Hairpin +1",
			neck	=	"Src. Stole +2",
			lear	=	"Malignance Earring",
			rear	=	"Regal Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Archon Ring",
			rring	=	"Epaminondas's Ring",
			back	=	{ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist	=	"Orpheus's Sash",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--Earth Crusher Set--
		sets.WS['Earth Crusher'] = set_combine(sets.WS['Cataclysm'], {
			head	=	"Nyame Helm",
			neck	=	"Quanpur Necklace",
			lring	=	"Metamor. Ring +1",		
		})			
		
		--Spiral Hell Set--
		sets.WS['Spiral Hell'] = {
			ammo	=	"Floestone",
			head	=	"Nyame Helm",
			neck	=	"Src. Stole +2",
			lear	=	"Malignance Earring",
			rear	=	"Ishvara Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Metamor. Ring +1",
			rring	=	"Epaminondas's Ring",
			back	=	{ name="Taranus's Cape", augments={'INT+20','Accuracy+20 Attack+20','INT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Acuity Belt +1",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--Myrkr Set--
		sets.WS['Myrkr'] = {
			ammo	=	"Psilomene",
			head	=	"Amalric Coif +1",
			neck	=	"Dualism Collar +1",
			lear	=	"Etiolation Earring",
			rear	=	"Nehalennia Earring",
			body	=	{ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			hands	=	"Otomi Gloves",
			lring	=	"Mephitas's Ring",
			rring	=	"Mephitas's Ring +1",
			back	=	{ name="Taranus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},
			waist	=	"Shinjutsu-no-Obi +1",
			legs	=	{ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			feet	=	"Psycloth Boots",
		}
		
	--Job Ability Sets--
	
		sets.JA = {}
		
		--Manafont Set--
		sets.JA['Manafont'] = {
			body	=	"Arch. Coat +3",
		}
		
	--Spell Sets--
		
		--Precast Sets--
		
		sets.precast = {}
		
		--Default FC Set--
		sets.precast.FC = {
			ammo	=	"Sapience Orb", --2
			head	=	"Merlinic Hood", --15
			neck	=	"Orunmila's Torque", --5
			lear	=	"Enchntr. Earring +1", --2
			rear	=	"Malignance Earring", --4
			body	=	"Merlinic Jubbah", --13
			hands	=	"Merlinic Dastanas", --7
			lring	=	"Kishar Ring", --4
			rring	=	"Rahab Ring", --2
			back	=	{ name="Taranus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},
			waist	=	"",
			legs	=	"Agwu's Slops", --7
			feet	=	"Merlinic Crackows", --12
		}
		
	--Midcast Sets--
		
		sets.midcast = {}
		
		--Free Nuke Set--
		sets.midcast['Nuke'] = {
			ammo	=	"Ghastly Tathlum +1",
			head	=	"Arch. Petasos +3",
			neck	=	"Src. Stole +2",
			lear	=	"Malignance Earring",
			rear	=	"Regal Earring",
			body	=	{ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			hands	=	{ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			lring	=	"Freke Ring",
			rring	=	"Metamor. Ring +1",
			back	=	{ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist	=	"Acuity Belt +1",
			legs	=	{ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			feet	=	"Arch. Sabots +3",
		}
		
		--Magic Burst Nuke Set--
		sets.midcast['MBurst'] = set_combine(sets.midcast['Nuke'], {
			head	=	"Ea Hat +1",
			body	=	"Ea Houppe. +1",
			hands	=	"Agwu's Gages",
			legs	=	"Ea Slops +1",
			dfeet	=	"Agwu's Pigaches",
		})
		
		--Darkness Nuke Upgrade--
		sets.midcast['Darkness'] = set_combine(sets.midcast['Nuke'], {
			head	=	"Pixie Hairpin +1",
			lring	=	"Archon Ring",
		})
		
		--Occult Acumen Set--
		sets.midcast['Occult'] = {
			ammo	=	"Seraphic Ampulla",
			head	=	"Mall. Chapeau +2",
			neck	=	"Combatant's Torque",
			lear	=	"Dedition Earring",
			rear	=	"Telos Earring",
			body	=	"Spaekona's Coat +3",
			hands	=	{ name="Merlinic Dastanas", augments={'Mag. Acc.+2 "Mag.Atk.Bns."+2','"Occult Acumen"+11','INT+3','"Mag.Atk.Bns."+12',}},
			lring	=	"Chirich Ring +1",
			rring	=	"Chirich Ring +1",
			back	=	{ name="Taranus's Cape",  augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Oneiros Rope",
			legs	=	"Perdition Slops",
			feet	=	{ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+2','"Occult Acumen"+11','INT+1','Mag. Acc.+13',}},
		}
		
		--Magic Accuracy Set--
		sets.midcast['MAcc'] = {
			ammo	=	"Pemphredo Tathlum",
			head	=	"Spae. Petasos +3",
			neck	=	"Src. Stole +2",
			lear	=	"Regal Earring",
			rear	=	"Malignance Earring",
			body	=	"Spaekona's Coat +3",
			hands	=	"Spae. Gloves +3",
			lring	=	"Stikini Ring +1",
			rring	=	"Metamor. Ring +1",
			back	=	"Aurist's Cape +1",
			waist	=	"Acuity Belt +1",
			legs	=	"Arch. Tonban +3",
			feet	=	"Spae. Sabots +3",			
		}
		
		--Elemental DoT Set--
		sets.midcast['EleDoTs'] = set_combine(sets.midcast['MAcc'], {
			head	=	"Arch. Petasos +3",
			rring	=	"Stikini Ring +1",
			feet	=	"Arch. Sabots +3"
		})
		
		--Drain/Aspir Set--
		sets.midcast['Drain/Aspir'] = {
			ammo	=	"Pemphredo Tathlum",
			head	=	"Pixie Hairpin +1",
			neck	=	"Erra Pendant",
			lear	=	"Hirudinea Earring",
			rear	=	"Mani Earring",
			body	=	{"Merlinic Jubbah", augments={'"Drain/Aspir Body"',}},
			hands	=	{"Merlinic Dastanas", augments={'"Drain/Aspir Body"',}},
			lring	=	"Archon Ring",
			rring	=	"Evanescence Ring",
			back	=	{ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
			waist	=	"Fucho-no-Obi",
			legs	=	"Spae. Tonban +3",
			feet	=	"Agwu's Pigaches",
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

end

--Post Midcast Core--
function postmidcast(spell, action)

	if spell.skill == 'Elemental Magic' and spell.element == world.day_element or spell.element == world.weather_element then
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
	
	--MBurst Trigger--
	if command == 'mburst' then		
		if MBurst == 1 then
			add_to_chat(170, 'Magic Burst Toggled - Free Nukes Restored')
			MBurst = 0
		else
			add_to_chat(170, 'Magic Burst Toggled - Magic Burst Maximum')
			MBurst = 1
		end
	end
	
	--OA Trigger--
	if command == 'oa' then
		if OAcumen == 1 then
			if MBurst == 1 then
				add_to_chat(170, 'Occult Acumen Toggled - Magic Burst Restored')
			else
				add_to_chat(170, 'Occult Acumen Toggled - Free Nuke Restored')	
			end
			OAcumen = 0
		else
			add_to_chat(170, 'Occult Acumen Toggled - Max TP per Spell Equipped')
			OAcumen = 1
		end
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

	equip(sets.JA['Manafont'])

end

--Subfunction for Weaponskill Precast--
function precast_weaponskill(spell, action)

	--Spiral Hell--
	if spell.english == "Spiral Hell" then
		equip(sets.WS['Spiral Hell'])
		
	--Myrkr--
	elseif spell.english == "Myrkr" then
		equip(sets.WS['Myrkr'])
	
	--Earth Crusher--
	elseif spell.english == "Earth Crusher" then
		equip(sets.WS['Earth Crusher'])
		
	--Cataclysm--
	else
		equip(sets.WS['Cataclysm'])
	end

	if sets.WS.Moonshade:contains(spell.english) and player.tp < 2750 then
		equip({lear = 'Moonshade Earring'})
	end

end

--Subfunction for Midcast Magic--
function midcast_magic(spell, action)

	if blm.EleDoTs:contains(spell.english) then
		equip(sets.midcast['EleDoTs'])
	elseif spell.skill == 'Elemental Magic' then
		if OAcumen == 1 then
			equip(sets.midcast['Occult'])
		elseif MBurst == 1 then
			equip(sets.midcast['MBurst'])
		else
			equip(sets.midcast['Nuke'])
		end
	else
		equip(sets.midcast['MAcc'])
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
		equip(sets.Idle.DT)
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

--Stylelock Function--
function style()

	--Lockstyle Function--
	send_command('input /lockstyleset 005;')	

end