--[[

	RDM
	
	2/14/2022

]]
	
	--Includes--

	--Enable All--
	send_command('gs enable all')
	
	--Set Macro Information and Lockstyle--
	send_command('input /macro book 05; wait .1; input /macro set 10; wait 5; style')

	--Command Aliases--
	send_command('alias dt gs c dt')	--DT Trigger
	send_command('alias hyb gs c hyb') 	--Hybrid Trigger
	send_command('alias mburst gs c mburst') 	--Magic Burst Trigger
	
	--Red Mage Weapon Setup Commands--
	send_command('alias melee gs c melee') --Melee Trigger
	send_command('alias savage gs c savage') --Savage Trigger
	send_command('alias enspell gs c enspell')	--Enspell DPS Trigger
	send_command('alias ae gs c ae') --Aeolian Edge Trigger
	send_command('alias unlock gs c unlock') --Weapon Swap Enable Trigger

--Main()--
function get_sets()

	--Variable Triggers--
	DTTrigger 		= 	0
	HybridTrigger 	= 	1
	MBurst			=	0
	WeaponLock		=	1
	
	--Spell Sets - RDM Exclusive --	
	red = {}
	
	--Enhancing Magic
	red.Gain	=	S{"Gain-STR", "Gain-DEX", "Gain-VIT", "Gain-AGI", "Gain-INT", "Gain-MND", "Gain-CHR", }
	red.EnhPot	=	S{"Temper", "Temper II", }
		
	--Enfeebling Magic
	red.MaxMAcc	=	S{"Break", "Dispel", "Frazzle", "Frazzle II", }
	red.ESkill	=	S{"Distract", "Distract II", "Distract III", "Frazzle III", "Poison", "Poison II", }
	red.MNDPot	=	S{"Addle", "Addle II", "Paralyze", "Paralyze II", "Slow", "Slow II", }
	red.MAccDur	=	S{"Bind", "Blind", "Blind II", "Gravity", "Gravity II", "Sleep", "Sleep II", }
	red.Stymie	=	S{"Dia", "Dia II", "Dia III", "Inundation", }	
		--Saboteur Gloves Tracker
		red.SaboGloves = S{"Break", "Dispel", "Frazzle", "Frazzle II", "Distract", "Distract II", "Distract III", "Frazzle III", "Poison", "Poison II", "Addle", "Addle II", "Paralyze", "Paralyze II", "Slow", "Slow II", "Bind", "Blind", "Blind II", "Gravity", "Gravity II", "Sleep", "Sleep II", }
	
	--Weapon Sets--
	
		sets.Weapons = {}
		
		--Standard Idle--
		sets.Weapons.Idle = {
			main	=	"Daybreak",
			sub		=	"Sacro Bulwark",
		}
		
		--Melee RDM--
		sets.Weapons.DD = {
			main	=	"Maxentius",
			sub  	=	"Thibron",
		}
		
		--Savage Blade--
		sets.Weapons.Savage = {
			main	=	"Naegling",
			sub  	=	"Thibron",
		}
		
		--Seraph Blade--
		sets.Weapons.Seraph = {
			main	=	"Crocea Mors",
			sub  	=	"Daybreak",
		}
		
		--Aeolian Edge--
		sets.Weapons.AE = {
			main	=	"Tauret",
			sub		=	"Daybreak",
		}
		
		--Enhancing Duration--
		sets.Weapons.Enh = {
			main	=	{ name="Colada", augments={'Enh. Mag. eff. dur. +4','MND+3','Mag. Acc.+4','"Mag.Atk.Bns."+17',}},
				--Must use Oseem weapon here. Only way to fill this slot.
			sub		=	"Ammurapi Shield",
		}
		
		--Phalanx Potency--
		sets.Weapons.Phalanx = {
			main	=	"Sakpata's Sword",
			sub		=	"Ammurapi Shield",
		}
		
		--MAcc--
		sets.Weapons.EnfeebMAcc = {
			main	=	"Contemplator +1",
			sub		=	"Enki Strap",
		}
		
		--MAcc w/ Skill--
		sets.Weapons.EnfeebSkill = {
			main	=	"Contemplator +1",
			sub		=	"Mephitis Grip",
		}
		
		--Nuking--
		sets.Weapons.Nuke = {
			main 	= 	"Bunzi's Rod",
			sub		=	"Ammurapi Shield",
		}

	--Gear for PostMidcast--
	sets.PostMidcast = {
		waist	=	"Orpheus's Sash",
		waist	=	"Hachirin-No-Obi",	
	}
		
	--Idle Sets--
		
		sets.Idle = {}
		
		--DT Idle Set--
		sets.Idle.DT = {
			ammo	=	"Staunch Tathlum",
			head	=	"Nyame Helm",
			neck	=	"Warder's Charm +1",
			lear	=	"Eabani Earring",
			rear	=	"Flashward Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Vengeful Ring",
			rring	=	"Purity Ring",
			back	=	{ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
			waist	=	"Carrier's Sash",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--Standard Idle Set--
		sets.Idle.Standard = set_combine(sets.Idle.DT, {
			head	=	"Viti. Chapeau +3",
			body	=	"Jhakri Robe +2",
			hands	=	"Volte Gloves",
			lring	=	{ name="Stikini Ring", bag="Wardrobe"},
			rring	=	{ name="Stikini Ring", bag="Wardrobe 2"},
			legs	=	"Volte Brais",
			feet	=	"Volte Gaiters",
		})
		
		--Evasion Idle Set--
		sets.Idle.Evasion = set_combine(sets.Idle.DT, {
			neck	=	"Bathy Choker +1",
			rear	=	"Infused Earring",
		})
		
	--TP Sets--
	
		sets.engaged = {}
		
		--Standard TP Set--
		sets.engaged.Standard = {
			ammo	=	"Aurgelmir Orb +1",
			head	=	"Malignance Chapeau",
			neck	=	"Combatant's Torque",
			lear	=	"Eabani Earring",
			rear	=	"Sherida Earring",
			body	=	"Malignance Tabard",
			hands	=	"Malignance Gloves",
			lring	=	"Chirich Ring +1",
			rring	=	"Chirich Ring +1",
			back	=	{ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Reiki Yotai",
			legs	=	"Malignance Tights",
			feet	=	"Malignance Boots"
		}
		
		--Hybrid Set--
		sets.engaged.Hybrid = set_combine(sets.engaged.Standard, {
			rear	=	"Telos Earring",
			rring	=	"Defending Ring",
		})		
		
	--Weaponskill Sets--
	
		sets.WS = {}
		
		sets.WS.Moonshade	=	S{'Black Halo', 'Savage Blade', 'Seraph Blade', 'Aeolian Edge', 'Shining Strike', }
		
		--Generic WS Set - Black Halo--
		sets.WS.Standard = {
			ammo	=	"Regal Gem",
			head	=	"Nyame Helm",
			neck	=	"Dls. Torque +2",
			lear	=	"Ishvara Earring",
			rear	=	"Regal Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Epaminondas's Ring",
			rring	=	"Rufescent Ring",
			back	=	{ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Luminary Sash",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--'Savage Blade' Set--
		sets.WS['Savage Blade'] = set_combine(sets.WS.Standard, {
			ammo	=	"Crepuscular Pebble",
			waist	=	"Sailfi Belt +1",
		})
		
		--'Seraph Blade' Set--
		sets.WS['Seraph Blade'] = {
			ammo	=	"Pemphredo Tathlum",
			head	=	"Nyame Helm",
			neck	=	"Baetyl Pendant",
			lear	=	"Malignance Earring",
			rear	=	"Regal Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Epaminondas's Ring",
			rring	=	"Freke Ring",
			back	=	{ name="Sucellos's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Orpheus's Sash",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets"
		}
				
		--'Sanguine Blade' Set--
		sets.WS['Sanguine Blade'] = set_combine(sets.WS['Seraph Blade'], {
			head	=	"Pixie Hairpin +1",
			rring	=	"Archon Ring",
			back	=	{ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
		})
		
		--'Aeolian Edge' Set--
		sets.WS['Aeolian Edge'] = set_combine(sets.WS['Seraph Blade'], {
			back	=	{ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
		})
		
	--Job Ability Sets--
	
		sets.JA = {}
		
		--'Chainspell' Set--	
		sets.JA['Chainspell'] = {
			body	=	"Viti. Tabard +3",
		}
		
		--'Saboteur' Set - must be on for cast--	
		sets.JA['Saboteur'] = {
			hands	=	"Leth. Gantherots +1",
		}
		
	--Spell Sets--
	
		--Precast Sets--
		
		sets.precast = {}
		
		--Default FC Set--
		sets.precast.FC = {
			head	=	"Atrophy Chapeau +3",
			body	=	"Viti. Tabard +3",
			back	=	{ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10', 'Phys. dmg. taken-10%',}},
		}
		
		--Dispelga Precast--
		sets.precast['Dispelga'] = set_combine(sets.precast.FC, {
			main 	=	"Daybreak",
		}) 
		
		--Midcast Sets--
		sets.midcast = {}
		
		--Duration Set--
		sets.midcast['Enh - Duration'] = {
			head	=	"Leth. Chappel +1",
			neck	=	"Dls. Torque +2",
			lear	=	"Andoaa Earring",
			rear	=	"Mimir Earring",
			body	=	"Viti. Tabard +3",
			hands	=	"Atrophy Gloves +3",
			lring	=	{ name="Stikini Ring", bag="Wardrobe"},
			rring	=	{ name="Stikini Ring", bag="Wardrobe 2"},
			back	=	{ name="Ghostfyre Cape", augments={'"Enh. Duration"+20','"Enh. Skill"+20'}},
			waist	=	"Embla Sash",
			legs	=	"Leth. Fuseau +1",
			feet	=	"Leth. Houseaux +1",
		}
		
		--Duration Set - Self--
		sets.midcast['Enhancing Self'] = set_combine(sets.midcast['Enh - Duration'], {
			head	=	{ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
			legs	=	{ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		})
		
		--Enhancing Skill Set--
		sets.midcast['Enhancing Skill'] = set_combine(sets.midcast['Enh - Duration'], {
			head	=	"Befouled Crown",
			neck	=	"Incanter's Torque",
			hands	=	"Viti. Gloves +3",
			waist	=	"Olympus Sash",
			legs	=	"Atrophy Tights +3",
		})
		
		--Refresh Potency Bump--
		sets.midcast['Refresh'] = set_combine(sets.midcast['Enh - Duration'], {
			head	=	"Amalric Coif +1",
			body 	=	"Atrophy Tabard +3",
		})
		
		--Gain Spell Potency Bump--
		sets.midcast['Gain'] = set_combine(sets.midcast['Enhancing Self'], {
			body 	= 	"Viti. Gloves +3",
		})
		
		--Phalanx Set--
		sets.midcast['Phalanx - Self'] = set_combine(sets.midcast['Enhancing Skill'], {
			{ name="Taeon Chapeau", augments={'Phalanx +3',}},
			{ name="Taeon Tabard", augments={'Phalanx +3',}},
			{ name="Taeon Gloves", augments={'Phalanx +3',}},
			{ name="Taeon Tights", augments={'Phalanx +3',}},
			{ name="Taeon Boots", augments={'Phalanx +3',}},
		})
		
		
		--Enfeebling Max Magic Accuracy--
		sets.midcast.MaxMAcc = {
			ammo	=	"Regal Gem",
			head	=	"Viti. Chapeau +3",
			neck	=	"Dls. Torque +2",
			lear	=	"Regal Earring",
			rear	=	"Snotra Earring",
			body	=	"Atrophy Tabard +3",
			hands	=	"Kaykaus Cuffs +1",
			lring	=	"Stikini Ring +1",
			rring	=	"Metamor. Ring +1",
			back	=	"Aurist's Cape +1",
			waist	=	"Luminary Sash",
			legs	=	{ name="Chironic Hose", augments={'MAcc > FC',}},
			feet	=	"Vitiation Boots +3",
		}
		
		--Enfeebling Skill--
		sets.midcast.EnfSkill = {
			ammo	=	"Regal Gem",
			head	=	"Viti. Chapeau +3",
			neck	=	"Dls. Torque +2",
			lear	=	"Vor Earring",
			rear	=	"Snotra Earring",
			body	=	"Lethargy Sayon +1",
			hands	=	"Leth. Gantherots +1",
			lring	=	"Stikini Ring +1",
			rring	=	"Stikini Ring +1",
			back	=	{ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10', 'Phys. dmg. taken-10%',}},
			waist	=	"Obstin. Sash",
			legs	=	{ name="Chironic Hose", augments={'MAcc > FC',}},
			feet	=	"Vitiation Boots +3",
		}
		
		--Enfeebling MND Potency--
		sets.midcast.MNDPot = {
			ammo	=	"Regal Gem",
			head	=	"Viti. Chapeau +3",
			neck	=	"Dls. Torque +2",
			lear	=	"Regal Earring",
			rear	=	"Snotra Earring",
			body	=	"Lethargy Sayon +1",
			hands	=	"Kaykaus Cuffs +1",
			lring	=	"Stikini Ring +1",
			rring	=	"Metamor. Ring +1",
			back	=	{ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10', 'Phys. dmg. taken-10%',}},
			waist	=	"Luminary Sash",
			legs	=	{ name="Chironic Hose", augments={'MAcc > FC',}},
			feet	=	"Vitiation Boots +3",
		}
		
		--Enfeeb Magic Accuracy Duration--
		sets.midcast.MAccDur = {
			ammo	=	"Regal Gem",
			head	=	"Viti. Chapeau +3",
			neck	=	"Dls. Torque +2",
			lear	=	"Regal Earring",
			rear	=	"Snotra Earring",
			body	=	"Atrophy Tabard +3",
			hands	=	"Leth. Gantherots +1",
			lring	=	"Kishar Ring",
			rring	=	"Stikini Ring +1",
			back	=	{ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10', 'Phys. dmg. taken-10%',}},
			waist	=	"Obstin. Sash",
			legs	=	{ name="Chironic Hose", augments={'MAcc > FC',}},
			feet	=	"Vitiation Boots +3",
		}
		
		--Stymie - Unlimited Potency - No Accuracy--
		sets.midcast.Stymie = {
			ammo	=	"Regal Gem",
			head	=	"Leth. Chappel +1",
			neck	=	"Dls. Torque +2",
			lear	=	"Regal Earring",
			rear	=	"Snotra Earring",
			body	=	"Lethargy Sayon +1",
			hands	=	"Leth. Gantherots +1",
			lring	=	"Kishar Ring",
			rring	=	"Metamor. Ring +1",
			back	=	{ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10', 'Phys. dmg. taken-10%',}},
			waist	=	"Obstin. Sash",
			legs	=	"Leth. Fuseau +1",
			feet	=	"Leth. Houseaux +1",
		}		
		
		--Dispelga Midcast--
		sets.midcast['Dispelga'] = set_combine(sets.midcast['Enfeeb - Acc'], {
			main 	= 	"Daybreak",
			sub		=	"Ammurapi Shield",
		})		
		
		--Free Nuke Set--
		sets.midcast['Nuke'] = {
			ammo	=	"Pemphredo Tathlum",
			head	=	"C. Palug Crown",
			neck	=	"Baetyl Pendant",
			lear	=	"Regal Earring",
			rear	=	"Malignance Earring",
			body	=	{ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			hands	=	{ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			lring	=	"Metamor. Ring +1",
			rring	=	"Freke Ring",
			back	=	{ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
			waist	=	"Sacro Cord",
			legs	=	{ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
			feet	=	{ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		}
		
		--Magic Burst Set--
		sets.midcast['MBurst'] = set_combine(sets.midcast['Nuke'], {
			head	=	"Ea Hat +1",
			neck	=	"Mizu. Kubikazari",
			body	=	"Ea Houppe. +1",
			hands	=	"Ea Cuffs +1",
			lring	=	"Mujin Band",
			legs	=	"Ea Slops +1",
			feet	=	"Vitiation Boots +3"
		})
		
		--Cure Set--
		sets.midcast['Cure'] = {
			ammo	=	"Regal Gem",
			head	=	"Kaykaus Mitra +1",
			neck	=	"Incanter's Torque",
			lear	=	"Meili Earring",
			rear	=	"Beatific Earring",
			body	=	"Kaykaus Bliaut +1",
			hands	=	"Kaykaus Cuffs +1",
			lring	=	"Stikini Ring +1",
			rring	=	"Sirona's Ring",
			back	=	{ name="Sucellos's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}},
			waist	=	"Luminary Sash",
			legs	=	"Kaykaus Tights +1",
			feet	=	"Kaykaus Boots +1",
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
	
	--Magic Precast Handler--
	if spell.action_type == 'Magic' then
		midcast_magic(spell)
	end
	
	--Post Midcast--
	postmidcast(spell)

end

--Post Midcast Core--
function postmidcast(spell, action)

	--Conditional Swaps - Neet to confirm upgraded method for OSash is working properly. Kthx--
	if (spell.skill == 'Leaden Salute' or spell.skill == 'Wildfire' or spell.skill =='Quick Draw') 
		and (spell.element == world.day_element or spell.element == world.weather_element) then

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
	
	--Weapon Swaps
	
		--Equip Black Halo Setup--
		if command == 'melee' then	
			add_to_chat(170, 'Black Halo Set with Maxentius and Thibron.')
			WeaponLock = 1
			equip(sets.Weapons.DD)
		end
		--Equip Savage Blade Setup--
		if command == 'savage' then	
			add_to_chat(170, 'Savage Blade Set with Naegling and Thibron.')
			WeaponLock = 2
			equip(sets.Weapons.Savage)
		end
		--Equip Seraph Blade Setup--
		if command == 'seraph' then	
			add_to_chat(170, 'Seraph Blade Set with Crocea Mors and Daybreak.')
			WeaponLock = 3
			equip(sets.Weapons.Seraph)
		end
		--Equip Aeolian Edge Setup--
		if command == 'ae' then	
			add_to_chat(170, 'Aeolian Edge Set with Tauret and Daybreak.')
			WeaponLock = 4
			equip(sets.Weapons.AE)
		end
		--Weapon Unlock Setup--
		if command == 'unlock' then	
			add_to_chat(170, 'Weapons unlocked - Full potency swapping allowed.')
			WeaponLock = 0
		end
	
	--Lockstyle Command--
	if command == 'style' then
		style()
	end
	
	aftercast()
		
end

--Subfunction for Magic Precast--
function precast_magic(spell, action)

	--Dispelga Precast--
	if spell.english == "Dispelga" and (WeaponLock == 0 or player.tp <= 200) then
		equip(sets.precast['Dispelga'])
		
	--Cancel Dispelga if weapons locked--
	elseif spell.english == "Dispelga" then
		cancel_spell()
		
	--Default Fast Cast--
	else
		equip(sets.precast.FC)
	end

end

--Subfunction for Job Ability Precast--
function precast_ja(spell, action)

	--Chainspell Trigger--
	if spell.skill == "Chainspell" then
		equip(sets.JA['Chainspell'])
	end
	
end

--Subfunction for Weaponskill Precast--
function precast_weaponskill(spell, action)

	--'Savage Blade' Trigger--	
	if spell.english == "Savage Blade" then
		equip(sets.WS['Savage Blade'])
		
	--'Seraph Blade / Shining Strike' Trigger--	
	elseif spell.english == "Seraph Blade" or spell.english == "Shining Strike" then
		equip(sets.WS['Seraph Blade'])

	--Sanguine Blade Trigger--
	elseif spell.english == "Sanguine Blade" then	
		equip(sets.WS['Sanguine Blade'])
		
	--Aeolian Edge Trigger--
	elseif spell.english == "Aeolian Edge" then	
		equip(sets.WS['Aeolian Edge'])
	
	--Default WS Set--
	else 
		equip(sets.WS.Standard)
	end
	
	--Moonshade Swap Trigger--
	if sets.WS.Moonshade:contains(spell.english) and player.tp < 2750 then
		equip({lear = 'Moonshade Earring'})
	end

end

--Subfunction for Midcast Magic--
function midcast_magic(spell, action)
		
	--MidCast Gear for Enhancing Magic--
	if spell.skill == 'Enhancing Magic' then

		--Refresh Trigger--
		if string.find(spell.english,'Refresh')then
			equip(sets.midcast['Refresh'])
			
		--Enchaning Skill--
		elseif red.EnhPot:contains(spell.english) then
			equip(sets.midcast['Enhancing Skill'])
		
		--Gain Trigger--
		elseif red.Gain:contains(spell.english) then
			equip(sets.midcast['Gain'])
		
		--Phalanx Trigger--
		elseif string.find(spell.english,'Phalanx') and spell.target.type == "SELF" then
			equip(sets.midcast['Phalanx - Self'])			
			
		--Self Enhancing Trigger--
		elseif spell.target.type == "SELF" then
			equip(sets.midcast['Enhancing Self'])
					
		--Default Enhancing--
		else
			equip(sets.midcast['Enh - Duration'])
		end
		
		--Weapon Change for Enhancing--
		if WeaponCycle == 0 or player.tp <= 200 then
			--Weapon Change for Phalanx--
			if string.find(spell.english,'Phalanx') and spell.target.type == "SELF" then
				equip(sets.Weapons.Phalanx)
			--Default Enhancing Weapons--
			else
				equip(sets.Weapons.Enh)
			end
		end
		
	--Enfeebling Magic--
	elseif spell.skill == "Enfeebling Magic" then
	
		--Dispelga Trigger--
		if spell.english == "Dispelga" then
			equip(sets.midcast['Dispelga'])
			
		--Stymie/Unmissable Trigger--
		elseif buffactive['Stymie'] or red.Stymie:contains(spell.english) then
			equip(sets.midcast.Stymie)
			
		--Enfeebling Skill--
		elseif red.ESkill:contains(spell.english) then
			equip(sets.midcast.EnfSkill)
			
		--MND Potency Enfeebles--
		elseif red.MNDPot:contains(spell.english) then
			equip(sets.midcast.MNDPot)
			
		--Magic Accuracy Duration--
		elseif red.MAccDur:contains(spell.english) then
			equip(sets.midcast.MAccDur)
			
		--Max Magic Accuracy--
		else
			equip(sets.midcast.MaxMAcc)
		end
			
		--Swap in Saboteur Gloves for spells that benefit--
		if buffactive['Saboteur'] and red.SaboGloves:contains(spell.english) then
			equip(sets.JA['Saboteur'])
		end
		
		--Enfeebling Weapon Swap--
		if WeaponCycle == 0 or player.tp <= 200 then
			--If no stymie spell 
			if red.MaxMAcc:contains(spell.english) and not buffactive['Stymie'] then
				equip(sets.Weapons.EnfeebMAcc)
			else
				equip(sets.Weapons.EnfeebSkill)				
			end
		end
		
		
	--Elemental Magic--
	elseif spell.skill == 'Elemental Magic' then
		if MBurst == 1 then
			equip(sets.midcast['MBurst'])
		else
			equip(sets.midcast['Nuke'])
		end
		
		--Weapon Change for Nuke--
		if WeaponLock == 0 or player.tp <= 100 then
			equip(sets.Weapons.Nuke)
		end
		
	--Healing Magic--
	elseif spell.skill == 'Healing Magic' then
		equip(sets.midcast['Cure'])
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
	
	--Weapon Swap--
	if WeaponLock == 0 then
		equip(sets.Weapons.Idle)
	end
	
	--Disability Swap--
	if buffactive['terror'] or buffactive['petrification'] 
		or buffactive['stun'] or buffactive['sleep'] then
			equip(sets.Idle.DT)
    end
	
end

--Aftercast Swap while Engaged--
function aftercast_engaged()

	--Standard TP Function--	
	if DTTrigger == 1 then
		equip(sets.Idle.DT)
	elseif HybridTrigger == 1 then
		equip(sets.engaged.Hybrid)
	else
		equip(sets.engaged.Standard)
	end
	
	--Weapon Swaps--
	if WeaponLock == 1 then
		equip(sets.Weapons.DD)
	elseif WeaponLock == 2 then
		equip(sets.Weapons.Savage)
	elseif WeaponLock == 3 then
		equip(sets.Weapons.Seraph)
	elseif WeaponLock == 4 then
		equip(sets.Weapons.AE)
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
	if buff == "terror" or buff == "petrification" or 
		buff == "stun" or buff == "sleep" then
		
		--DT Gear On--
    	if gain then  
			equip(sets.Idle.DT)
		
		--Handicap Restore--
		else
			--Aftercast Function Trigger--
			aftercast()
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