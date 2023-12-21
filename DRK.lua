--[[

	Kanryu_DRK.lua
	
	2/11/22

]]

	--Includes--
	res = require 'resources'
	p = require('packets')

	--Enable All--
	send_command('gs enable all')
	
	--Set Macro Information and Lockstyle--
	send_command('input /macro book 08; wait .1; input /macro set 10; wait 5; style')

	--Command Aliases--		Any custom commands for Windower should be put into this section.
	send_command('alias dt gs c dt')	--DT Trigger
	send_command('alias hyb gs c hyb') 	--Hybrid Trigger
	
	--Dark Weapon Setup Commands--
	send_command('alias calad gs c calad')	
	send_command('alias liber gs c liber')	
	send_command('alias redemp gs c redemp')
	send_command('alias apoc gs c apoc')
	send_command('alias savage gs c savage')
	send_command('alias gaxe gs c gaxe')
	send_command('alias club gs c club')
	
--Main()--
function get_sets()

	--Variable Triggers--
	DTTrigger 	= 	0
	HybridTrigger = 1
	
	--Weapon Sets--
	
		sets.Weapons = {}
		
		--Caladbolg Set--
		sets.Weapons.Calad = {
			main	=	"Caladbolg",
			sub		=	"Utu Grip",
		}
		
		--Liberator Set--
		sets.Weapons.Lib = {
			main	=	"Liberator",
			sub		=	"Utu Grip",
		}
		
		--Redemption Set--
		sets.Weapons.Redem = {
			main	=	"Redemption",
			sub		=	"Utu Grip",
		}
		
		--Apocalypse Set--
		sets.Weapons.Apoc = {
			main	=	"Apocalypse",
			sub		=	"Utu Grip",
		}
		
		--Savage Set--
		sets.Weapons.Savage = {
			main	=	"Naegling",
			sub		=	"Blurred Shield +1",
		}
		
		--Armor Break Set--
		sets.Weapons.Lycurgos = {
			main	=	"Lycurgos",
			sub		=	"Utu Grip",
		}
		
		--Club Set--
		sets.Weapons.Club = {
			main	=	"Loxotic Mace +1",
			sub		=	"Blurred Shield +1",
		}
		
	--Idle Sets--
		
		sets.Idle = {}
		
		--DT Idle Set--
		sets.Idle.DT = {
			ammo	=	"Staunch Tathlum +1",
			head	=	"Nyame Helm",
			neck	=	"Warder's Charm +1",
			lear	=	"Eabani Earring",
			rear	=	"Etiolation Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Vengeful Ring",
			rring	=	"Moonlight Ring",
			back	=	{ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
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
		
		--Greatsword TP Sets--
		sets.engaged.GSD = {}
		
		sets.engaged.GSD.Standard = {
			ammo	=	"Coiste Bodhar",
			head	=	"Flam. Zucchetto +2",
			neck	=	"Abyssal Beads +2",
			lear	=	"Telos Earring",
			rear	=	"Dedition Earring",
			body	=	"Sakpata's Plate",
			hands	=	"Sakpata's Gauntlets",
			lring	=	"Chirich Ring +1",
			rring	=	"Regal Ring",
			back	=	{ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Ig. Flanchard +3",
			feet	=	"Flam. Gambieras +2",
		}
		
		--Scythe TP Sets--
		sets.engaged.Scythe = {}
		
		sets.engaged.Scythe.Standard = {
			ammo	=	"Coiste Bodhar",
			head	=	"Flam. Zucchetto +2",
			neck	=	"Abyssal Beads +2",
			lear	=	"Dedition Earring",
			rear	=	"Telos Earring",
			body	=	"Sakpata's Plate",
			hands	=	"Sakpata's Gauntlets",
			lring	=	"Niqmaddu Ring",
			rring	=	"Chirich Ring +1",
			back	=	{ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Ig. Flanchard +3",
			feet	=	"Flam. Gambieras +2"
		}
		
		--Scythe Liberator AM Set--
		sets.engaged.Scythe.LibAM = {
			ammo	=	"Aurgelmir Orb +1",
			head	=	"Flam. Zucchetto +2",
			neck	=	"Abyssal Beads +2",
			lear	=	"Dedition Earring",
			rear	=	"Telos Earring",
			body	=	{ name="Valorous Mail", augments={'"Store TP" +8',}},
			hands	=	"Sakpata's Gauntlets",
			lring	=	"Chirich Ring +1",
			rring	=	"Chirich Ring +1",
			back	=	{ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	{ name="Odyssean Cuisses", augments={'"Store TP" +8',}},
			feet	=	{ name="Valorous Greaves", augments={'"Store TP" +8',}},
		}
		
		--Scythe Redemption AM Set--
		sets.engaged.Scythe.RedempAM = {
			ammo	=	"Coiste Bodhar",
			head	=	"Sakpata's Helm",
			neck	=	"Abyssal Beads +2",
			lear	=	"Brutal Earring",
			rear	=	"Schere Earring",
			body	=	"Sakpata's Plate",
			hands	=	"Sakpata's Gauntlets",
			rring	=	"Regal Ring",
			lring	=	"Niqmaddu Ring",
			back	=	{ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Double Attack"+10','Phys. dmg. taken-10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Ig. Flanchard +3",
			feet	=	"Flam. Gambieras +2",
		}
		
		--Hybrid Set--
		sets.engaged.Hybrid = {
			ammo	=	"Seeth. Bomblet +1",
			head	=	"Hjarrandi Helm",
			neck	=	"Bathy Choker +1",
			lear	=	"Schere Earring",
			rear	=	"Digni. Earring",
			body	=	"Dagon Breast.",
			hands	=	"Sakpata's Gauntlets",
			lring	=	"Moonlight Ring",
			rring	=	"Niqmaddu Ring",
			back	=	{ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Sakpata's Cuisses",
			feet	=	"Sakpata's Leggings",
		}
		
	--Weaponskill Sets--
	
		sets.WS = {}
		
		sets.WS.Moonshade	=	S{'Cross Reaper', 'Entropy', 'Insurgency', 'Quietus', 'Torcleaver', 'Resolution', 'Savage Blade', 'Judgement',}
		
		--Default Set--
		sets.WS.Standard = {
			ammo	=	"Crepuscular Pebble",
			head	=	"Nyame Helm",
			neck	=	"Abyssal Beads +2",
			lear	=	"Lugra Earring +1",
			rear	=	"Thrud Earring",			
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Epaminondas's Ring",
			rring	=	"Niqmaddu Ring",
			back	=	{ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets"
		}
		
		--'Torcleaver' Set--
		sets.WS['Torcleaver'] = {
			ammo	=	"Crepuscular Pebble",
			head	=	"Nyame Helm",
			neck	=	"Abyssal Beads +2",
			lear	=	"Lugra Earring +1",
			rear	=	"Thrud Earring",			
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Epaminondas's Ring",
			rring	=	"Niqmaddu Ring",
			back	=	{ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Fotia Belt",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets"
		}
		
		--'Resolution' Set--
		sets.WS['Resolution'] = {
			ammo	=	"Crepuscular Pebble",
			head	=	"Sakpata's Helm",
			neck	=	"Abyssal Beads +2",
			lear	=	"Lugra Earring +1",
			rear	=	"Schere Earring",			
			body	=	"Sakpata's Plate",
			hands	=	"Sakpata's Gauntlets",
			lring	=	"Regal Ring",
			rring	=	"Niqmaddu Ring",
			back	=	{ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Fotia Belt",
			legs	=	"Sakpata's Cuisses",
			feet	=	"Sakpata's Leggings",
		}
		
		--'Entropy' Set--
		sets.WS['Entropy'] = {
			ammo	=	"Coiste Bodhar",
			head	=	"Sakpata's Helm",
			neck	=	"Abyssal Beads +2",
			lear	=	"Lugra Earring +1",
			rear	=	"Schere Earring",
			body	=	"Sakpata's Plate",
			hands	=	"Sakpata's Gauntlets",
			lring	=	"Metamor. Ring +1",
			rring	=	"Niqmaddu Ring",
			back	=	{ name="Ankou's Mantle", augments={'INT+20','Accuracy+20 Attack+20','INT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Fotia Belt",
			legs	=	"Sakpata's Cuisses",
			feet	=	"Nyame Sollerets"
		}
		
		--'Insurgency' Set--
		sets.WS['Insurgency'] = {
			ammo	=	"Crepuscular Pebble",
			head	=	"Sakpata's Helm",
			neck	=	"Abyssal Beads +2",
			lear	=	"Lugra Earring +1",
			rear	=	"Thrud Earring",
			body	=	"Sakpata's Plate",
			hands	=	"Sakpata's Gauntlets",
			lring	=	"Regal Ring",
			rring	=	"Niqmaddu Ring",
			back	=	{ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Fotia Belt",
			legs	=	"Sakpata's Cuisses",
			feet	=	"Sakpata's Leggings"
		}
		
		--'Infernal Scythe' Set--
		sets.WS['Infernal Scythe'] = {
			ammo	=	"Knobkierrie",
			head	=	"Pixie Hairpin +1",
			neck	=	"Sanctity Necklace",
			lear	=	"Malignance Earring",
			rear	=	"Friomisi Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Epaminondas's Ring",
			rring	=	"Archon Ring",
			back	=	{ name="Ankou's Mantle", augments={'INT+20','Accuracy+20 Attack+20','INT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Orpheus's Sash",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--'Savage Blade' / 'Judgement' Set--
		sets.WS['Savage Blade'] = set_combine(sets.WS.Standard, {
			ammo	=	"Crepuscular Pebble",
			head	=	"Nyame Helm",
			neck	=	"Abyssal Beads +2",
			lear	=	"Lugra Earring +1",
			rear	=	"Thrud Earring",			
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Epaminondas's Ring",
			rring	=	"Niqmaddu Ring",
			back	=	{ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets"
		})
		
	--Job Ability Sets--
	
		sets.JA = {}
		
		--Blood Weapon Set--
		sets.JA["Blood Weapon"] = {
			body	=	"Fall. Cuirass +3",
		}
		
		--Arcane Circle Set--
		sets.JA["Arcane Circle"] = {
			feet	=	"Igno. Sollerets +1",
		}
		
		--Soul Eater Set - Activation Cape Only--
		sets.JA["Soul Eater"] = {
			back	=	"Ankou's Mantle",
		}
		
		--Weapon Bash Set - Chainbound Only--
		sets.JA["Weapon Bash"] = {
			hands	=	"Ig. Gauntlets +3",
		}
		
		--Dark Seal Set - must be on for cast--
		sets.JA["Dark Seal"] = {
			head	=	"Fall. Burgeonet +3",
		}
		
		--Diabolic Eye Set--
		sets.JA["Diabolic Eye"] = {
			hands	=	"Fall. Fin. Gaunt. +3",
		}
		
		--Nether Void Set - must be on for cast--
		sets.JA["Nether Void"] = {
			legs	=	"Heath. Flanchard +1",
		}
		
	--Spell Sets--
		
		--Precast Sets--
		
		sets.precast = {}
		
		--Default FC Set--
		sets.precast.FC = {
			ammo	=	"Sapience Orb",
			head	=	"Carmine Mask +1",
			neck	=	"Orunmila's Torque",
			lear	=	"Loquac. Earring",
			rear	=	"Malignance Earring",
			body	=	"Fall. Cuirass +3",
			hands	=	"Leyline Gloves",
			lring	=	"Kishar Ring",
			rring	=	"Rahab Ring",
			back	=	{ name="Ankou's Mantle", augments={'"Fast Cast"+10',}},
			legs	=	{ name="Odyssean Cuisses", augments={'"Fast Cast"+6',}},
			feet	=	{ name="Odyssean Greaves", augments={'"Fast Cast"+6',}},
		}
		
		--Midcast Sets--
		sets.midcast = {}
				
		--Dark Knight Nukes - HAHAHA Removed for relevancy--
		sets.midcast['Nuke'] = {
		
		}
		
		--Drain/Aspir Only--
		sets.midcast['Drain/Aspir'] = {
			ammo	=	"Pemphredo Tathlum",
			head	=	"Fall. Burgeonet +3",
			neck	=	"Erra Pendant",
			lear	=	"Hirudinea Earring",
			rear	=	"Digni. Earring",
			body	=	"Carm. Sc. Mail +1",
			hands	=	"Fall. Fin. Gaunt. +3",
			lring	=	"Archon Ring",
			rring	=	"Evanescence Ring",
			back	=	"Niht Mantle",
			waist	=	"Austerity Belt +1",
			legs	=	"Fall. Flanchard +3",
			feet	=	"Rat. Sollerets +1",
		}
		
		--Absorbs--
		sets.midcast['Absorb'] = set_combine(sets.midcast['Drain/Aspir'], {
			head	=	"Ig. Burgonet +3",
			lear	=	"Mani Earring",
			hands	=	"Pavor Gauntlets",
			lring	=	"Kishar Ring",
			rring	=	"Stikini Ring +1",
			back	=	"Chuparrosa Mantle",
			waist	=	"Casso Sash",
		})
		
		--Endark - Dark Skill--
		sets.midcast['Endark'] = set_combine(sets.midcast['Drain/Aspir'], {
			lear	=	"Mani Earring",
			lring	=	"Stikini Ring +1",
			back	=	"Niht Mantle",
			waist	=	"Casso Sash",
			legs	=	"Heath. Flanchard +1",
		})
		
		--Dread Spikes - High HP--
		sets.midcast['Dread Spikes'] = {
			ammo	=	"Egoist's Tathlum",
			head	=	"Ratri Sallet +1",
			neck	=	"Unmoving Collar +1",
			lear	=	"Odnowa Earring +1",
			rear	=	"Tuisto Earring",
			body	=	"Heath. Cuirass +1",
			hands	=	"Rat. Gadlings +1",
			lring	=	"Gelatinous Ring +1",
			rring	=	"Moonlight Ring",
			back	=	"Moonlight Cape",
			waist	=	"Gold Mog. Belt",
			legs	=	"Ratri Cuisses +1",
			feet	=	"Rat. Sollerets +1",
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

	if (spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic') and (spell.element == world.day_element or spell.element == world.weather_element) then
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
	
	--Weapon Swaps
	
		--Equip Caladbolg Setup--
		if command == 'calad' then
			add_to_chat(170, 'Torcleaver Set with Caladbolg and Utu Grip.')
			equip(sets.Weapons.Calad)
		end
		--Equip Liberator Setup--
		if command == 'liber' then
			add_to_chat(170, 'Insurgency Set with Liberator and Utu Grip.')
			equip(sets.Weapons.Lib)
		end	
		--Equip Redemption Setup--
		if command == 'redemp' then
			add_to_chat(170, 'Redemption Set with Redemption and Utu Grip.')
			equip(sets.Weapons.Redem)
		end
		--Equip Apocalypse Setup--
		if command == 'apoc' then
			add_to_chat(170, 'Catastrophe Set with Apocalypse and Utu Grip.')
			equip(sets.Weapons.Apoc)
		end
		--Equip Savage Blade Setup--
		if command == 'savage' then
			add_to_chat(170, 'Savage Blade Set with Naegling and Blurred Shield +1.')
			equip(sets.Weapons.Savage)
		end	
		--Equip Armor Break Setup--
		if command == 'gaxe' then
			add_to_chat(170, 'Armor Break Set with Lycurgos and Utu Grip.')
			equip(sets.Weapons.Lycurgos)
		end	
		--Equip Club Setup--
		if command == 'club' then
			add_to_chat(170, 'Judgement Set with Loxotic Mage +1 and Blurred Shield +1.')
			equip(sets.Weapons.Club)
		end
	
	--Style Lock--
	if command == 'style' then
		style()
	end
	
	--Set Scythe style.
	if command == 'typecheck' then
		add_to_chat(170, "Running type check.")
		if type_check() == 7 then
			add_to_chat(170, "Wearing a scythe. Type is "..type_check()..".")
		else
			add_to_chat(170, "Not wearing a scythe. Type is "..type_check()..".")
		end
	end
	
end


--Subfunction for Magic Precast--
function precast_magic(spell, action)

	equip(sets.precast.FC)

end

--Subfunction for Job Ability Precast--
function precast_ja(spell, action)

	--'Blood Weapon' Trigger--
	if spell.english == "Blood Weapon" then
		equip(sets.JA['Blood Weapon'])
	end

	--'Arcane Circle' Trigger--
	if spell.english == "Arcane Circle" then
		equip(sets.JA['Arcane Circle'])
	end
	
	--'Soul Eater' Trigger--
	if spell.english == "Soul Eater" then
		equip(sets.JA['Soul Eater'])
	end
	
	--'Weapon Bash' Trigger--
	if spell.english == "Weapon Bash" then
		equip(sets.JA['Weapon Bash'])
	end
	
	--'Diabolic Eye' Trigger--
	if spell.english == "Diabolic Eye" then
		equip(sets.JA['Diabolic Eye'])
	end
	
	--'Last Resort' Trigger--
	if spell.english == "Last Resort" then
		equip(sets.JA['Last Resort'])
	end
	
end

--Subfunction for Weaponskill Precast--
function precast_weaponskill(spell, action)

	--'Torcleaver' Trigger--	
	if spell.english == "Torcleaver" then
		equip(sets.WS['Torcleaver'])
		
	--'Resolution' Trigger--
	elseif spell.english == "Resolution" then
		equip(sets.WS['Resolution'])

	--'Entropy' Trigger--
	elseif spell.english == "Entropy" then	
		equip(sets.WS['Entropy'])
	
	--'Insurgency' Trigger--
	elseif spell.english == "Insurgency" then
		equip(sets.WS['Insurgency'])
		
	--'Infernal Scythe' Trigger--
	elseif spell.english == "Infernal Scythe" then
		equip(sets.WS['Infernal Scythe'])
		
	--'Savage Blade' Trigger--
	elseif spell.english == "Savage Blade" then
		equip(sets.WS['Savage Blade'])
	
	--All Other Weaponskills--
	else 
		equip(sets.WS.Standard)
	end
		
	--Moonshade Earring Swap--
	if (sets.WS.Moonshade:contains(spell.english) and player.tp < 2750) then
		equip({lear = 'Moonshade Earring'})
	end	

end

--Subfunction for Midcast Magic--
function midcast_magic(spell, action)
	
	--Dark Magic--
	if spell.skill == "Dark Magic" then
	
		--'Dread Spikes' Trigger--
		if spell.english == 'Dread Spikes' then
			equip(sets.midcast['Dread Spikes'])
			
		--'Endark' Trigger--
		elseif string.find(spell.english,'Endark') then
			equip(sets.midcast['Endark'])
			
		--'Absorb' Trigger--
		elseif string.find(spell.english,'Absorb') then
			equip(sets.midcast['Absorb'])
			if buffactive['Dark Seal'] then
				equip(sets.JA['Dark Seal'])
			end
			if buffactive['Nether Void'] then
				equip(sets.JA['Nether Void'])
			end
		
		--'Drain/Aspir' Trigger--
		elseif string.find(spell.english,'Drain') or string.find(spell.english,'Aspir') then
			equip(sets.midcast['Drain/Aspir'])
			if buffactive['Dark Seal'] then
				equip(sets.JA['Dark Seal'])
			end
			if buffactive['Nether Void'] then
				equip(sets.JA['Nether Void'])
			end
			
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

	--DT Function--	
	if DTTrigger == 1 then
		equip(sets.Idle.DT)
			
	--Hybrid Offence--
	elseif HybridTrigger == 1 then
		equip(sets.engaged.Hybrid)

	--Scythe Idle--
	elseif type_check() == 7 then
		if buffactive['Aftermath: Lv.3'] and player.equipment.range == "Liberator" then
			equip(sets.engaged.Scythe.LibAM)
		elseif (buffactive['Aftermath: Lv.3'] or buffactive['Aftermath: Lv.2'] 
			or buffactive['Aftermath: Lv.1']) and player.equipment.range == "Redemption" then
				equip(sets.engaged.Scythe.RedempAM)
		else
			equip(sets.engaged.Scythe.Standard)
		end
	--Greatsword Idle--
	else
		equip(sets.engaged.GSD.Standard)				
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
	else
		--Aftercast Function Trigger--
		if player.status == "Engaged" then
			aftercast_engaged()
		else
			aftercast_idle()
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

--Style Lock--
function style()

	--Set Scythe style.
	if type_check() == 7 then
		add_to_chat(170, "Locking style 002 for Scythe.")
		send_command('input /lockstyleset 002')
	else
		add_to_chat(170, "Locking style 010 for Greatsword.")
		send_command('input /lockstyleset 010')
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