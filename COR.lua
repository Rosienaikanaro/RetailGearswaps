--[[

	Lynara_COR.lua
	
	2/14/2022

]]

	--Include--
	p = require('packets')

	--Startup--
	send_command('gs enable all')	
	
	--Set Macro Information and Lockstyle--
	send_command('input /macro book 17; wait .1; input /macro set 10; wait 5; style')
		
	--Command Aliases--
	send_command('alias dt gs c dt')	--DT Trigger
	send_command('alias hyb gs c hyb')	--Hyb Trigger
	send_command('alias lock gs c lock')	--Weapon Lock Trigger
	
	--Corsair Weapon Setup Commands--
	send_command('alias melee gs c melee')	--Melee Trigger
	send_command('alias leaden gs c leaden')	--Leaden Trigger
	send_command('alias aeolian gs c aeolian')	--Aeolian Trigger
	send_command('alias ranged gs c ranged')	--Ranged Trigger

--Main()--
function get_sets()

	--Variable Triggers--
	DTTrigger 	= 	0
	HybridTrigger = 1
	Weapons		=	0
	RollLock	=	0
	
	--Weapon Sets--
		sets.Weapons = {}
		
		sets.Weapons.Melee = {
			main	=	"Naegling",
			sub		=	"Demersal Degen +1",
			range	=	"Anarchy +2",
			ammo	=	"Living Bullet",
		}
		
		sets.Weapons.Leaden = {
			main	=	{ name="Rostam", augments={'Path: B',}},
			sub		=	"Tauret",
			range	=	"Death Penalty",
			ammo	=	"Living Bullet",
		}
		
		sets.Weapons.Aeolian = {
			main	=	{ name="Rostam", augments={'Path: B',}},
			sub		=	"Tauret",
			range	=	"Anarchy +2",
			ammo	=	"Living Bullet",
		}
		
		sets.Weapons.Ranged = {
			main	=	{ name="Rostam", augments={'Path: A',}},
			sub		=	"Nusku Shield",
			range	=	"Fomalhaut",
			ammo	=	"Chrono Bullet",
		}
		
		sets.Weapons.Roll = {
			main	=	{ name="Rostam", augments={'Path: C',}},
			range	=	"Compensator",
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
			ammo	=	"Chrono Bullet",
			head	=	"Nyame Helm",
			neck	=	"Warder's Charm +1",
			lear	=	"Eabani Earring",
			rear	=	"Odnowa Earring +1",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Vengeful Ring",
			rring	=	"Purity Ring",
			back	=	{ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Carrier's Sash",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--Standard Idle Set--
		sets.Idle.Standard = set_combine(sets.Idle.DT, {
			legs	=	"Carmine Cuisses +1",
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
			head	=	{ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
			neck	=	"Mirage Stole +2",
			lear	=	"Eabani Earring",
			rear	=	"Dedition Earring",
			body	=	"Malignance Tabard",
			hands	=	{ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
			lring	=	"Chirich Ring +1",
			rring	=	"Epona's Ring",			
			back	=	{ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Reiki Yotai",
			legs	=	"Malignance Tights",
			feet	=	"Malignance Boots",
		}
		
		--DT Hybrid Set--
		sets.engaged.Hybrid = set_combine(sets.engaged.Standard, {
			rear	=	"Telos Earring",
			head	=	"Malignance Chapeau",
			hands	=	"Malignance Gloves",
			rring	=	"Defending Ring",			
		})
		
	--RA Sets--
	
		sets.RA = {}
		
		--No Flurry - Standard Snapshot--
		sets.RA.Snapshot = {
			ammo	=	"Chrono Bullet",
			head	=	"Chass. Tricorne +1",
			neck	=	"Comm. Charm +2",
			body	=	"Oshosi Vest +1",
			hands	=	"Lanun Gants +3",
			back	=	{ name="Camulus's Mantle", augments={'"Snapshot"+10',}},
			waist	=	"Yemaya Belt",
			legs	=	{ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
			feet	=	"Meg. Jam. +2"
		}
		
		--Flurry 1 - 15% Snapshot--
		sets.RA.Flurry1 = set_combine(sets.RA.Snapshot, {
			body	=	"Laksa. Frac +3",
		})
		
		--Flurry2 - 30% Snapshot--
		sets.RA.Flurry2 = set_combine(sets.RA.Snapshot, {
			body	=	"Laksa. Frac +3",
			hands	=	"Carmine Fin. Ga. +1",
			feet	=	"Pursuer's Gaiters",
		})
		
		--Ranged Attack Set--
		sets.RA.Shot = {
			head	=	"Ikenga's Hat",
			neck	=	"Iskur Gorget",
			lear	=	"Enervating Earring",
			rear	=	"Telos Earring",			
			body	=	"Ikenga's Vest",
			hands	=	"Ikenga's Gloves",
			lring	=	"Ilabrat Ring",
			rring	=	"Cacoethic Ring +1",
			back	=	{ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Yemaya Belt",
			legs	=	"Ikenga's Trousers",
			feet	=	"Ikenga's Clogs"
		}
		
		--Triple Shot Set--
		sets.RA.TripleShot = set_combine(sets.RA.Shot, {
			head	=	"Oshosi Mask +1",
			body	=	"Chasseur's Frac +1",
			hands	=	"Lanun Gants +3",
			legs	=	"Osh. Trousers +1",
			feet	=	"Osh. Leggings +1"
		})
		
		--Empy Aftermath Shot--
		sets.RA.EmpyShot = {
			head	=	"Meghanada Visor +2",
			neck	=	"Comm. Charm +2",
			lear	=	"Telos Earring",
			rear	=	"Odr Earring",
			body	=	"Meg. Cuirie +2",
			hands	=	"Mummu Wrists +2",
			lring	=	"Mummu Ring",
			rring	=	"Begrudging Ring",
			back	=	{ name="Camulus's Mantle", augments={'AGI Crit Rate Cape',}},
			waist	=	"K. Kachina Belt +1",
			legs	=	"Mummu Kecks +2",
			feet	=	"Osh. Leggings +1"
		}
		
	--Weaponskill Sets--
	
		sets.WS = {}
		
		sets.WS.Moonshade	=	S{'Savage Blade','Leaden Salute','Last Stand','Aeolian Edge',}
		
		--Generic WS Set - Savage Blade Based--
		sets.WS.Standard = {
			head	=	"Nyame Helm",
			neck	=	"Rep. Plat. Medal",
			lear	=	"Telos Earring",
			rear	=	"Ishvara Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Epaminondas's Ring",
			rring	=	"Regal Ring",
			back	=	{ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets"
		}
		
		--'Wildfire' Set--
		sets.WS['Wildfire'] = {
			ammo	=	"Living Bullet",
			head	=	"Nyame Helm",
			neck	=	"Comm. Charm +2",
			lear	=	"Ishvara Earring",
			rear	=	"Friomisi Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Epaminondas's Ring",
			rring	=	"Dingir Ring",
			back	=	{ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Skrymir Cord +1",
			legs	=	"Nyame Flanchard",
			feet	=	"Lanun Bottes +3",
		}
		
		--'Leaden Salute' Set--
		sets.WS['Leaden Salute'] = set_combine(sets.WS['Wildfire'], {
			head	=	"Pixie Hairpin +1",
			lring	=	"Archon Ring",
		})
		
		--'Aeolian Edge' Set--
		sets.WS['Aeolian Edge'] = set_combine(sets.WS['Wildfire'], {
			back	=	{ name="Camulus's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		})
		
		--'Last Stand' Set--
		sets.WS['Last Stand'] = {
			ammo	=	"Chrono Bullet",
			head	=	"Nyame Helm",
			neck	=	"Fotia Gorget",
			lear	=	"Odr Earring",
			rear	=	"Ishvara Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Epaminondas's Ring",
			rring	=	"Regal Ring",
			back	=	{ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Fotia Belt",
			legs	=	"Nyame Flanchard",
			feet	=	"Lanun Bottes +3",
		}
		
	--Job Ability Sets--
	
		sets.JA = {}
		
		--'Phantom Roll' Sets--		
		sets.JA['Phantom Roll'] = {
			head	=	"Lanun Tricorne +3",
			neck	=	"Regal Necklace",
			hands	=	"Chasseur's Gants +1",
			rring	=	"Luzaf's Ring",
			back	=	{ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
		}
		
			--'Blitzer's Roll' Set--			
			sets.JA['Blitzers Roll'] = set_combine(sets.JA['Phantom Roll'], {
				head	=	"Chass. Tricorne +1",
			})
			
			--'Tacticians Roll' Set--			
			sets.JA['Tacticians Roll'] = set_combine(sets.JA['Phantom Roll'], {
				body	=	"Chasseur's Frac +1",
			})
			
			--'Casters Roll' Set--			
			sets.JA['Casters Roll'] = set_combine(sets.JA['Phantom Roll'], {
				legs	=	"Chas. Culottes +1",
			})
		
		--'Wild Card' Set--		
		sets.JA['Wild Card'] = {
			feet	=	"Lanun Bottes +3",
		}
				
		--'Random Deal' Set--		
		sets.JA['Random Deal'] = {
			body	=	"Lanun Frac +3",
		}
		
		--'Snake Eye' Set--		
		sets.JA['Snake Eye'] = {
			legs	=	"Lanun Trews +3",
		}
		
		--'Elemental QD' Set--		
		sets.JA['Elemental QD'] = set_combine(sets.WS['Wildfire'], {
			ammo	=	"Hauksbok Bullet",
			head	=	"Nyame Helm",
			neck	=	"Comm. Charm +2",
			lear	=	"Crematio Earring",
			rear	=	"Friomisi Earring",
			body	=	"Lanun Frac +3",
			hands	=	"Nyame Gauntlets",
			lring	=	"Dingir Ring",
			rring	=	"Fenrir Ring +1",
			back	=	{ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','"Magic Attack Bonus"+10','Phys. dmg. taken-10%',}},
			waist	=	"Skrymir Cord +1",
			legs	=	"Nyame Flanchard",
			feet	=	"Lanun Bottes +3",
		})
		
		--'Light/Dark QD' Set--		
		sets.JA['Light/Dark QD'] = {
			ammo	=	"Devastating Bullet",
			head	=	"Laksa. Tricorne +3",
			neck	=	"Comm. Charm +2",
			lear	=	"Digni. Earring",
			rear	=	"Crep. Earring",
			body	=	"Malignance Tabard",
			hands	=	"Laksa. Gants +3",
			lring	=	"Stikini Ring +1",
			rring	=	"Regal Ring",
			back	=	{ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','"Magic Attack Bonus"+10','Phys. dmg. taken-10%',}},
			waist	=	"K. Kachina Belt +1",
			legs	=	"Malignance Tights",
			feet	=	"Laksa. Bottes +3",
		}
		
	--Spell Sets--
		
		--Precast Sets--
		
		sets.precast = {}
		
		--Default FC Set--
		sets.precast.FC = {
			head	=	"Carmine Mask +1", --14
			neck	=	"Orunmila's Torque", --5
			lear	=	"Enchntr. Earring +1", --2 
			rear	=	"Loquac. Earring", --2
			body	=	"Adhemar Jacket +1", --10
			hands	=	"Leyline Gloves", --8
			lring	=	"Rahab Ring", --2 
			rring	=	"Kishar Ring", --4 
			back	=	{ name="Camulus's Mantle", augments={'"Fast Cast"+10',}}, --10 
			legs	=	{ name="Herculean Trousers", augments={'"Fast Cast"+6',}}, --8
			feet	=	"Carmine Greaves +1", --8
		}
	
end

--Precast Core--
function precast(spell, action)

	--Do not swap gear on Double-Up or CC--
	if spell.english == 'Double-Up' then
		return
	end
	
	--RA Preshot Handler--
	if spell.action_type == 'Ranged Attack' then
		precast_RA()
	end
	
	--Magic Precast Handler--
	if spell.action_type == 'Magic' then
		precast_magic(spell)
	end
	
	--Job Ability Precast Handler--
	if spell.type == 'JobAbility' or 'CorsairRoll' or 'CorsairShot' then
		precast_ja(spell)
	end
		
	--Weapon Skill Precast Handler--
	if spell.type == "WeaponSkill" then
		precast_weaponskill(spell)		
	end
	
end

--Midcast Core--
function midcast(spell, action)

	--Do not swap gear on Double-Up or CC--
	if spell.english == 'Double-Up' or spell.english == "Crooked Cards" then
		return
	end

	--RA Midshot Handler--
	if spell.action_type == 'Ranged Attack' then
		midcast_RA()
	end

	--Magic Precast Handler--
	if spell.action_type == 'Magic' then
		midcast_magic(spell)
	end
	
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
	
	--Weapon Swaps
	
		--Equip Savage Blade Setup--
		if command == 'melee' then	
			add_to_chat(170, 'Savage Blade with Naegling, Blurred Knife +1 and Aketos.')
			Weapons = 0
		end
		
		--Equip Leaden Salute Setup--
		if command == 'leaden' then
			add_to_chat(170, 'Leaden Salute with Rostam(B), Tauret and Mythic Gun.')
			Weapons = 1
		end
		
		--Equip Aeolian Edge Setup--
		if command == 'aeolian' then
			add_to_chat(170, 'Aeolian Edge with Rostam(B), Tauret and Aketos.')
			Weapons = 2
		end
		
		--Equip Last Stand Setup--
		if command == 'ranged' then
			add_to_chat(170, 'Last Stand with Kustawi +1, Nusku Shield, and Fomalhaut.')
			Weapons = 3		
		end
	
	--Roll Lock--
	if command == 'lock' then		
		if RollLock == 1 then
			add_to_chat(170, 'Roll gear allowed - Rostam + Compensator will swap in.')
			RollLock = 0
		else
			add_to_chat(170, 'Roll gear locked - Swapping disallowed.')
			RollLock = 1
		end
	end
	
	--Lockstyle Command--
	if command == 'style' then
		style()
	end
	
	aftercast()
	
end

--Subfunction for Preshot--
function precast_RA()

	--Flurry 2 Preshot--
	if FlurryState == 2 then
		equip(sets.RA.Flurry2)
		
	--Flurry Preshot--
	elseif FlurryState == 1 then
		equip(sets.RA.Flurry1)
		
	--No Flurry Preshot--
	else
		equip(sets.RA.Snapshot)
	end

end

--Subfunction for Magic Precast--
function precast_magic(spell, action)

	equip(sets.precast.FC)

end

--Subfunction for Job Ability Precast--
function precast_ja(spell, action)

	--Phantom Roll Handler--
	if spell.type == "CorsairRoll" then
		--Weapon Swap - if unlocked--
		if RollLock == 0 then
			equip(sets.Weapons.Roll)
		end
		
		--Blitzer's Roll Swap--
		if spell.skill == "Blitzer's Roll" then
			equip(sets.JA['Blitzers Roll'])
		
		--Tactician's Roll Swap--
		elseif spell.skill == "Tactician's Roll" then
			equip(sets.JA['Tacticians Roll'])		
		
		--Caster's Roll Swap--
		elseif spell.skill == "Caster's Roll" then
			equip(sets.JA['Casters Roll'])
		
		--Default Phantom Roll Gear--	
		else
			equip(sets.JA['Phantom Roll'])
		end
		
	end
	
	--Quick Draw Handler--		
	if spell.type == "CorsairShot" then
		
		--QD Acc for Light/Dark--
		if spell.skill == 'Light Shot' or 'Dark Shot' then
			equip(sets.JA['Light/Dark QD'])
		
		--QD Damage for Elements--
		else
			equip(sets.JA['Elemental QD'])
		end
	end
	
	--Wild Card Trigger--	
	if spell.skill == "Wild Card" then
		equip(sets.JA['Wild Card'])
	end
	
	--Random Deal Trigger--	
	if spell.skill == "Random Deal" then
		equip(sets.JA['Random Deal'])
	end
	
	--Snake Eye Trigger--	
	if spell.skill == "Snake Eye" then
		equip(sets.JA['Snake Eye'])
	end
	
end

--Subfunction for Weaponskill Precast--
function precast_weaponskill(spell, action)

	--'Wildfire' Trigger--		
	if spell.english == "Wildfire" then
		equip(sets.WS['Wildfire'])
		
	--'Leaden Salute' Trigger--	
	elseif spell.english == "Leaden Salute" or spell.english == "Sanguine Blade" then
		equip(sets.WS['Leaden Salute'])
	
	--'Aeolian Edge' Trigger--		
	elseif spell.english == "Aeolian Edge" then
		equip(sets.WS['Aeolian Edge'])	
	
	--'Last Stand' Trigger--			
	elseif spell.english == "Last Stand" then
		equip(sets.WS['Last Stand'])
		
	--Default WS Trigger - Savage Blade Focused--
	else 
		equip(sets.WS.Standard)
	end
	
	postmidcast(spell)
		
	if sets.WS.Moonshade:contains(spell.english) and player.tp < 2750 then
		equip({lear = 'Moonshade Earring'})
	end

end

--Subfunction for Midshot--
function midcast_RA()

	--Triple Shot Trigger--
	if buffactive['Triple Shot'] then
		equip(sets.RA.TripleShot)
		
	--Arma AM3 Trigger--
	elseif (buffactive['Aftermath: Lv.3'] or buffactive['Aftermath: Lv.2'] 
			or buffactive['Aftermath: Lv.1']) and player.equipment.range == "Armageddon" then
				equip(sets.RA.EmpyShot)
				
	--Default Shot--
	else
		equip(sets.RA.Shot)
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
	elseif HybridTrigger == 1 then
		equip(sets.Idle.Evasion)		
	else
		equip(sets.Idle.Standard)
	end
		
	--Roll Lock Handler--
	if RollLock == 0 then
		if Weapons == 0 then
			equip(sets.Weapons.Melee)
		elseif Weapons == 1 then
			equip(sets.Weapons.Leaden)
		elseif Weapons == 2 then
			equip(sets.Weapons.Aeolian)
		elseif Weapons == 3 then
			equip(sets.Weapons.Ranged)
		end
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
	
	--Roll Lock Handler--
	if RollLock == 0 then
		if Weapons == 0 then
			equip(sets.Weapons.Melee)
		elseif Weapons == 1 then
			equip(sets.Weapons.Leaden)
		elseif Weapons == 2 then
			equip(sets.Weapons.Aeolian)
		elseif Weapons == 3 then
			equip(sets.Weapons.Ranged)
		end
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
    	if gain then  
			equip(sets.Idle.DT)
		end
	end
	
end

--Buff Lost Function--
function buff_change(buff,lost)
	
	--Aftercast Function Trigger--
	if player.status == "Engaged" then
		aftercast_engaged()
	else
		aftercast_idle()
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

--Flurry Parser--
windower.raw_register_event("incoming chunk", function(id, data)
    if id == 0x028 then
        local packet = p.parse('incoming', data)
 
        if packet["Category"] == 4 then
     
            if packet["Param"] == 845 and FlurryState ~= 1 and FlurryState ~= 2 then
                -- Set FlurryState to 1 for Flurry.
                FlurryState = 1
				windower.add_to_chat(210,"Flurry 1 - 15% Snapshot Active")

                 
            elseif packet["Param"] == 846 and FlurryState ~= 2 then
                -- Set FlurryState to 2 for Flurry2.
                FlurryState = 2
				windower.add_to_chat(210,"Flurry 2 - 30% Snapshot Active")

            else
                -- End early because Flurry was already active.
            end
 
        end 
    end 
end)

--Stylelock Function--
function style()

	--Lockstyle Function--
	send_command('input /lockstyleset 06;')	
	add_to_chat(170, 'Style Locked')

end