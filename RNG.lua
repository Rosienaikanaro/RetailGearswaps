--[[

	Kanryu_RNG.lua
	
	2/10/2022

]]

	--Includes--
	p = require('packets')
	
	--Enable All--
	send_command('gs enable all')
	
	--Set Macro Information and Lockstyle--
	send_command('alias style gs c style') --Style Trigger
	send_command('input /macro book 11; wait .1; input /macro set 10; wait 5; style') --Macro Setup

	--Command Aliases--	
	send_command('alias dt gs c dt')	--DT Trigger
	send_command('alias hyb gs c hyb') 	--Hybrid Trigger
	
	--Ranger Weapon Setup Commands--
	send_command('alias savage gs c savage')
	send_command('alias ae gs c ae')
	send_command('alias youichi gs c youichi')
	send_command('alias gandiva gs c gandiva')
	send_command('alias failnot gs c failnot')
	send_command('alias gastra gs c gastra')
	send_command('alias anni gs c anni')
	send_command('alias arma gs c arma')
	send_command('alias fomal gs c fomal')

--Main()--
function get_sets()

	--Variable Triggers--
	DTTrigger	=	0
	HybridTrigger = 1
	Aftermath	=	0
	FlurryState	=	0
	
	--Haruspex Arrow Protection--
		Protected_WS 	=	S{"Flaming Arrow", "Piercing Arrow", "Dulling Arrow", "Sidewinder", "Blast Arrow", "Arching Arrow", "Empyreal Arrow", "Refulgent Arrow", "Apex Arrow", "Namas Arrow", "Jishnu's Radiance", "Hot Shot", "Split Shot", "Sniper Shot", "Slug Shot", "Blast Shot", "Heavy Shot", "Detonator", "Numbing Shot", "Last Stand", "Coronach", "Wildfire", "Trueflight", }
	
	--Weapon Sets--
	
		sets.Weapons = {}
			
		--Melee Ranger--
		sets.Weapons.Melee = {
			main	=	"Naegling",
			sub		=	"Blurred Knife +1",
			ranged	=	"Sparrowhawk +2",
			ammo	=	"Hauksbok Arrow",
		}
		
		--Aeolian Cleave Ranger--
		sets.Weapons.AE = {
			main	=	{ name="Malevolence", bag="Wardrobe"},
			sub		=	{ name="Malevolence", bag="Wardrobe 5"},
			ranged	=	"Sparrowhawk +2",
			ammo	=	"Hauksbok Arrow",
		}
		
		--Youichinoyumi - Relic Bow--
		sets.Weapons.Yoichi = {
			main	=	"Perun +1",
			sub		=	"Nusku Shield",
			ranged	=	"Yoichinoyumi",
		}
		
		--Gandiva - Empy Bow--
		sets.Weapons.Gandiva = {
			main	=	"Oneiros Knife",
			sub		=	"Nusku Shield",
			ranged	=	"Gandiva",
		}
		
		--Fail-not - Aeonic Bow--
		sets.Weapons.FailNot = {
			main	=	"Perun +1",
			sub		=	"Nusku Shield",
			ranged	=	"Fail-not",
		}
		
		--Gastraphetes - Mythic xBow--
		sets.Weapons.Gastra = {
			main	=	{ name="Malevolence", bag="Wardrobe"},
			sub		=	{ name="Malevolence", bag="Wardrobe 5"},
			ranged	=	"Gastraphetes",
		}
		
		--Annihilator - Relic Gun--
		sets.Weapons.Anni = {
			main	=	"Perun +1",
			sub		=	"Nusku Shield",
			ranged	=	"Annihilator",
		}
		
		--Armageddon - Empyrean Gun--
		sets.Weapons.Arma = {
			main	=	"Oneiros Knife",
			sub		=	"Nusku Shield",
			ranged	=	"Armageddon",
		}
		
		--Fomalhaut - Aeonic Gun--
		sets.Weapons.Fomal = {
			main	=	"Perun +1",
			sub		=	"Nusku Shield",
			ranged	=	"Fomalhaut",
		}

	--Idle Sets--
	
		sets.Idle = {}
		
		--DT Idle Base--
		sets.Idle.DT = {
			head	=	"Nyame Helm",
			neck	=	"Warder's Charm +1",
			lear	=	"Eabani Earring",
			rear	=	"Odnowa Earring +1",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Vengeful Ring",
			rring	=	"Defending Ring",
			back	=	{ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Flume Belt",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--Standard Idle--
		sets.Idle.Standard = set_combine(sets.Idle.DT, {
			legs	=	"Carmine Cuisses +1",
		})
		
		--Evasion Idle--
		sets.Idle.Evasion = set_combine(sets.Idle.DT, {
			neck	=	"Bathy Choker +1",
			rear	=	"Infused Earring",
			waist	=	"Svelt. Gouriz +1",
			feet	=	"Hippo. Socks +1",
		})
	
	--Engaged Sets--
	sets.engaged = {}
	
		--Standard Idle | RNG DT--
		sets.engaged.Standard = {
			head	=	{ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
			neck	=	"Iskur Gorget",
			lear	=	"Suppanomimi",
			rear	=	"Sherida Earring",
			body	=	{ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
			hands	=	{ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
			lring	=	"Chirich Ring +1",
			rring	=	"Epona's Ring",
			back	=	{ name="Belenus's Cape", augments={'TP cape here',}},
			waist	=	"Windbuffet Belt +1",
			legs	=	"Malignance Tights",
			feet	=	"Malignance Boots",
		}
		
		--Hybrid Set--
		sets.engaged.Hybrid = set_combine(sets.engaged.Standard, {
			head	=	"Malignance Chapeau",
			neck	=	"Loricate Torque +1",
			hands	=	"Malignance Gloves",
			rring	=	"Defending Ring",
		})
	
	--Ranged Attack Sets--
	sets.RA = {}
	
		--No Flurry - Standard Snapshot--
		sets.RA.Snapshot = {
			head	=	{ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
			neck	=	"Scout's Gorget +2",
			body	=	"Amini Caban +1",
			hands	=	"Oshosi Gloves +1",
			back	=	{ name="Belenus's Cape", augments={'"Snapshot"+10',}},
			waist	=	"Impulse Belt",
			legs	=	"Orion Braccae +3",
			feet	=	"Meg. Jam. +2"
		}
		
		--Flurry 1 - 15% Snapshot--
		sets.RA.Flurry1 = set_combine(sets.RA.Snapshot, {
			hands	=	"Carmine Fin. Ga. +1",			
			legs	=	{ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
		})
		
		--Flurry2 - 30% Snapshot--
		sets.RA.Flurry2 = set_combine(sets.RA.Snapshot, {
			head	=	"Orion Beret +3",
			hands	=	"Carmine Fin. Ga. +1",			
			legs	=	{ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
			feet	=	"Arcadian Socks +3",
		})
		
		--Standard Shot--
		sets.RA.Shot = {
			head	=	"Arcadian Beret +3",
			neck	=	"Iskur Gorget",
			lear	=	"Dedition Earring",
			rear	=	"Telos Earring",
			body	=	"Ikenga's Vest",
			hands	=	"Ikenga's Gloves",
			lring	=	"Ilabrat Ring",
			rring	=	"Regal Ring",
			back	=	{ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"K. Kachina Belt +1",
			legs	=	"Ikenga's Trousers",
			feet	=	"Ikenga's Clogs"
		}
		
		--Double Shot--
		sets.RA.DoubleShot = set_combine(sets.RA.Shot, {
			head	=	"Arcadian Beret +3",
			body	=	"Arc. Jerkin +3",
			hands	=	"Oshosi Gloves +1",
			legs	=	"Osh. Trousers +1",
			feet	=	"Osh. Leggings +1"
		})
		
		--Barrage - High Acc--
		sets.RA.Barrage = set_combine(sets.RA.Shot, {
			head	=	"Orion Beret +3",
			neck	=	"Iskur Gorget",
			lear	=	"Enervating Earring",
			rear	=	"Telos Earring",
			body	=	"Orion Jerkin +3",
			hands	=	"Orion Bracers +3",
			lring	=	"Cacoethic Ring +1",
			rring	=	"Regal Ring",
			back	=	{ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"K. Kachina Belt +1",
			legs	=	"Adhemar Kecks +1",
			feet	=	"Orion Socks +3",
		})
		
		--Camouflage Up - High Crit w/ sTP - Also AM Aftermath--
		sets.RA.CamoShot = {
			head	=	"Meghanada Visor +2",
			neck	=	"Scout's Gorget +2",
			lear	=	"Telos Earring",
			rear	=	"Odr Earring",
			body	=	"Meg. Cuirie +2",
			hands	=	"Mummu Wrists +2",
			lring	=	"Mummu Ring",
			rring	=	"Begrudging Ring",
			back	=	{ name="Belenus's Cape", augments={'AGI Crit Rate Cape',}},
			waist	=	"K. Kachina Belt +1",
			legs	=	"Mummu Kecks +2",
			feet	=	"Arcadian Socks +3"
		}
	
	--Weaponskill Sets--
	sets.WS = {}
	
		--Moonshade Earring Weaponskills--
		sets.WS.Moonshade	=	S{'Trueflight','Last Stand',}
		
		--Standard RNG Weaponskills--
		sets.WS.Standard = {
			head	=	"Nyame Helm",
			neck	=	"Rep. Plat. Medal",
			lear	=	"Sherida Earring",
			rear	=	"Ishvara Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Epaminondas's Ring",
			rring	=	"Regal Ring",
			back	=	{ name="Belenus's Cape", augments={'STR WSD Cape',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--Last Stand--
		sets.WS['Last Stand'] = {
			head	=	"Orion Beret +3",
			neck	=	"Scout's Gorget +2",
			lear	=	"Moonshade Earring",
			rear	=	"Ishvara Earring",
			body	=	"Ikenga's Vest",
			hands	=	"Ikenga's Gloves",
			lring	=	"Regal Ring",
			rring	=	"Epaminondas's Ring",
			back	=	{ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
			waist	=	"Fotia Belt",
			legs	=	"Arc. Braccae +3",
			feet	=	"Nyame Sollerets",
		}
		
		--Jishnu's Radiance Set - Gandiva Only--
		sets.WS['Jishnus Radiance'] = {
			head	=	{ name="Adhemar Bonnet +1", augments={'Path :C'}},
			neck	=	"Fotia Gorget",
			lear	=	"Sherida Earring",
			rear	=	"Odr Earring",
			body	=	"Meg. Cuirie +2",
			hands	=	"Mummu Wrists +2",
			lring	=	"Regal Ring",
			rring	=	"Begrudging Ring",
			back	=	{ name="Belenus's Cape", augments={'DEX Crit Rate Cape',}},
			waist	=	"Fotia Belt",
			legs	=	"Jokushu Haidate",
			feet	=	{ name="Adhe. Gamashes +1", augments={'Path :C'}},
		}
		
		--Trueflight/Wildfire Set - Magic WS--
		sets.WS['Trueflight'] = {
			head	=	"Nyame Helm",
			neck	=	"Scout's Gorget +2",
			lear	=	"Ishvara Earring",
			rear	=	"Friomisi Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Epaminondas's Ring",
			rring	=	"Dingir Ring",
			back	=	{ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
			waist	=	"Orpheus's Sash",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
	
	--Job Ability Sets--
	sets.JA = {}
	
		--BountyShot Set - TH+--
		sets.JA['BountyShot'] = {
			hands	=	"Amini Glove. +1",
		}
		
		--Camouflage Set - Duration+--
		sets.JA['Camouflage'] = {
			body	=	"Orion Jerkin +3",
		}
		
		--Scavenge Set - 7% Return+--
		sets.JA['Scavenge'] = {
			feet	=	"Orion Socks +3"
		}
		
		--Shadowbind Set--
		sets.JA['Shadowbind'] = set_combine(sets.RA.Barrage, {
			hands	=	"Orion Bracers +3",
		})
		
		--Sharpshot Set - +12 Racc--
		sets.JA['Sharpshot'] = {
			legs	=	"Orion Braccae +3",
		}
	
	--Magic Precast Sets--
	sets.precast = {}
	
		--Standard Magic Precast--
		sets.precast.FC = {
		
		}
		
end

--Precast Core--
function precast(spell, action)
	
	--RA Preshot Handler--
	if spell.action_type == 'Ranged Attack' then
		if player.equipment.ammo == "Hauksbok Arrow" then
			cancel_spell()
		else
			precast_RA()
		end
	end
	
	--Magic Precast Handler--
	if spell.action_type == 'Magic' then
		precast_magic(spell)
	end
	
	--Job Ability Precast Handler--
	if spell.type == 'JobAbility' then
		if player.equipment.ammo == "Hauksbok Arrow" and spell.english == "Shadowbind" then 
			cancel_spell()
		else
			precast_ja(spell)
		end
	end
		
	--Weapon Skill Precast Handler--
	if spell.type == "WeaponSkill" then
		if player.equipment.ammo == "Hauksbok Arrow" and Protected_WS:contains(spell.english) then
			cancel_spell()
		else
			precast_weaponskill(spell)
		end			
	end
	
end

--Midcast Core--
function midcast(spell, action)

	--RA Midshot Handler--
	if spell.action_type == 'Ranged Attack' then
		midcast_RA()
	end

	--Magic Precast Handler--
	if spell.action_type == 'Magic' then
		precast_magic(spell)
	end

end

--Post Midcast Core--
function postmidcast(spell, action)

	--Obi Function for Trueflight and Wildfire--
	if (spell.skill == 'Trueflight' or spell.skill == 'Wildfire') 
		and (spell.element == world.day_element or spell.element == world.weather_element) then		
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
				add_to_chat(170, 'Hybrid Toggled - Hybrid TP Enabled (DT Override On)')
				HybridTrigger = 1
			else
				add_to_chat(170, 'Hybrid Toggled - Hybrid TP Enabled')
				HybridTrigger = 1
			end
		end
	end
	
	--Weapon Swaps
	
		--Equip Melee Setup--
		if command == 'savage' then
			add_to_chat(170, 'Savage Set with Naegling, Blurred Knife +1, and Sparrowhawk.')
			equip(sets.Weapons.Melee)
		end
		--Equip Aeolian Cleave Setup--
		if command == 'ae' then
			add_to_chat(170, 'Aeolian Cleave Set with Maleviolence x2 and Sparrowhawk.')
			equip(sets.Weapons.AE)
		end	
		--Equip Yoichi Setup--
		if command == 'youichi' then
			add_to_chat(170, 'Youichi Set with Perun +1, Nusku Shield, and Youichinoyumi.')
			equip(sets.Weapons.Yoichi)
		end
		--Equip Gandiva Setup--
		if command == 'gandiva' then
			add_to_chat(170, 'Gandiva Set with Perun +1, Nusku Shield, and Gandiva.')
			equip(sets.Weapons.Gandiva)
		end
		--Equip FailNot Setup--
		if command == 'failnot' then
			add_to_chat(170, 'Fail-Not Set with Perun +1, Nusku Shield, and Fail-Not.')
			equip(sets.Weapons.FailNot)
		end	
		--Equip Gastra Setup--
		if command == 'gastra' then
			add_to_chat(170, 'Gastra Set with Perun +1, Nusku Shield, and Gastraphetes.')
			equip(sets.Weapons.Gastra)
		end	
		--Equip Anni Setup--
		if command == 'anni' then
			add_to_chat(170, 'Anni Set with Perun +1, Nusku Shield, and Annihilator.')
			equip(sets.Weapons.Anni)
		end
		--Equip Arma Setup--
		if command == 'arma' then
			add_to_chat(170, 'Arma Set with Oneiros Knife, Nusku Shield, and Armageddon.')
			equip(sets.Weapons.Arma)
		end
		--Equip Fomal Setup--
		if command == 'fomal' then
			add_to_chat(170, 'Fomal Set with Perun +1, Nusku Shield, and Fomalhaut.')
			equip(sets.Weapons.Fomal)
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

	--All Spells--
	equip(sets.precast.FC)

end

--Subfunction for Job Ability Precast--
function precast_ja(spell, action)

	--Bounty Shot Trigger--
	if spell.english == "Bounty Shot" then
		equip(sets.JA['BountyShot'])
	end
	
	--Scavenge Trigger--
	if spell.english == "Scavenge" then
		equip(sets.JA['Scavenge'])
	end
		
	--Sharpshot Trigger--
	if spell.english == "Sharpshot" then
		equip(sets.JA['Sharpshot'])
	end
		
	--Shadowbind Trigger--
	if spell.english == "Shadowbind" then
		equip(sets.JA['Shadowbind'])
	end
		
	--Camouflage Trigger--
	if spell.english == "Camouflage" then
		equip(sets.JA['Camouflage'])
	end
	
end

--Subfunction for Weaponskill Precast--
function precast_weaponskill(spell, action)

	--Trueflight Trigger--
	if spell.english == "Trueflight" then
		equip(sets.WS['Trueflight'])
	
	--Jishnu's Trigger--
	elseif spell.english == "Jishnu's Radiance" then
		equip(sets.WS['Jishnus Radiance'])
		
	--Last Stand Trigger--
	elseif spell.english == "Last Stand" then
		equip(sets.WS['Last Stand'])
		
	--All remaining WS--
	else
		equip(sets.WS.Standard)
	end
	
	--Moonshade Earring Trigger--
	if sets.WS.Moonshade:contains(spell.english) and player.tp < 2750 then
		equip({lear = 'Moonshade Earring'})
	end

end

--Subfunction for Midshot--
function midcast_RA()

	--Double Shot Trigger--
	if buffactive['Barrage'] then
		equip(sets.RA.Barrage)
		
	--Double Shot Set--
	elseif buffactive['Double Shot'] then
		equip(sets.RA.DoubleShot)
		
	--Gandiva Aftermath Set--
	elseif (player.equipment.range == "Gandiva" or player.equipment.range == "Armageddon") and Aftermath >= 1 then
		equip(sets.RA.CamoShot)
		
	--Crit Set if Camo Up--
	elseif CamoState == 1 then
		equip(sets.RA.CamoShot)
		
	--Standard Shot--
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

--Buff Change Function--
function buff_change(buff,gain,buff_table)

	--Buff Gained--
	if gain then
	
		--Aftermath Gain--
		if buff == "Aftermath: Lv.3" then
			Aftermath = 3
			windower.add_to_chat(210,"Aftermath Lvl3 Activated")
		elseif buff == "Aftermath: Lv.2" then
			Aftermath = 2
			windower.add_to_chat(210,"Aftermath Lvl2 Activated")
		elseif buff == "Aftermath: Lv.1" or buff == "Aftermath" then
			Aftermath = 1
			windower.add_to_chat(210,"Aftermath Activated")
		end
		
		--Camp Gain--
		if buff == "Camouflage" then
			CamoState = 1
			windower.add_to_chat(210,"Camouflage Activated - Crit++ :: Breaks on WS")
		end		
		
	end
	
	--Buff Lost--
	if not gain then
	
		--Flurry Loss--
		if buff == 'Flurry' then
			FlurryState = 0
			windower.add_to_chat(210,"No Flurry - 0% Snapshot Active")
		end
		
		--Camo Loss--
		if buff == "Camouflage" then
			CamoState = 0
			windower.add_to_chat(210,"Camouflage Broken")
		end
		
		--Aftermath Lost--
		if string.find(buff,'Aftermath') then
			Aftermath = 0
			windower.add_to_chat(210,"Aftermath Down")
		end
		
    end

end

--Status Change Core--
function status_change(new, old)

	aftercast()
	
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
	send_command('input /lockstyleset 09;')	

end