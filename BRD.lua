--[[

	Kanryu_BRD
	
	2/11/22

]]

--!!INIT!!--

	--Enable All--
	send_command('gs enable all')	
	
	--Set Macro Information and Lockstyle--
	send_command('input /macro book 10; wait .1; input /macro set 10; wait 5; style')
		
	--Command Aliases--
	send_command('alias dt gs c dt')	--DT Trigger
	send_command('alias hyb gs c hyb') 	--Hybrid Trigger
	send_command('alias tank gs c tank') 	--Tank Trigger
	
	--Bard Weapon Setup Commands--
	send_command('alias carn gs c carn') --Carnwenhan Trigger
	send_command('alias savage gs c savage') --Savage Blade Trigger
	send_command('alias ae gs c ae') --Aeolian Edge Trigger

--Main()--
function get_sets()

	--Variable Triggers--
	DTTrigger 	= 	0
	WeapTrig	=	0
	HybridTrigger = 1
	Aftermath	=	0
	tank		=	0
	
	--Weapon Sets--
	
		sets.Weapons = {}
		
		sets.Weapons.Main = {
			main	=	{ name="Nibiru Knife", bag="Wardrobe"},
			sub		=	{ name="Nibiru Knife", bag="Wardrobe 5"},
		}
		
		sets.Weapons.MainNoDW = {
			main	=	{ name="Nibiru Knife", bag="Wardrobe"},
			sub		=	"Genmei Shield",
		}
		
		sets.Weapons.Carn = {
			main	=	"Carnwenhan",
			--sub		=	"Crepuscular Knife",
			sub		=	"Fusetto +2",
		}
		
		sets.Weapons.Savage = {
			main	=	"Naegling",
			--sub		=	"Crepuscular Knife",
			sub		=	"Fusetto +2",
		}
		
		sets.Weapons.Aeolian = {
			main	=	"Tauret",
			sub		=	"Malevolence",
		}
	
	--Idle Sets--
		
		sets.Idle = {}
		
		--DT Idle Set--
		sets.Idle.DT = {
			range	=	"Nibiru Harp",
			head	=	"Nyame Helm",
			neck	=	"Warder's Charm +1",
			lear	=	"Eabani Earring",
			rear	=	"Etiolation Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Vengeful Ring",
			rring	=	"Defending Ring",
			back	=	{ name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','Evasion+15',}},
			waist	=	"Carrier's Sash",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--Standard Idle Set--
		sets.Idle.Standard = set_combine(sets.Idle.DT, {
			
		})
		
		--Evasion Idle--
		sets.Idle.Evasion = set_combine(sets.Idle.DT, {
			range	=	{ name="Linos", augments={'Evasion+15','Phys. dmg. taken -2%','HP+19'}},
			neck	=	"Bathy Choker +1",
			rear	=	"Infused Earring",
			waist	=	"Svelt. Gouriz +1",
			feet	=	"Hippo. Socks +1",
		})
		
	-- TP Sets--
	
		sets.engaged = {}
		
		--Standard Idle Set--
		sets.engaged.Standard = {
			range	=	{ name="Linos", augments={'Attack+20','"Store TP"+4','Quadruple Attack +3',}},
			head	=	"Bunzi's Hat",
			neck	=	"Bard's Charm +2",
			lear	=	"Crep. Earring",
			rear	=	"Telos Earring",
			body	=	"Ashera Harness",
			hands	=	"Bunzi's Gloves",
			lring	=	"Moonlight Ring",
			rring	=	"Chirich Ring +1",
			back	=	{ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Volte Tights",
			feet	=	"Nyame Sollerets",
		}
		
		--DT Hybrid Set--
		sets.engaged.Hybrid = set_combine(sets.engaged.Standard, {
			lear	=	"Eabani Earring",
			waist	=	"Reiki Yotai",
		})
		
	--Weaponskill Sets--
	
		sets.WS = {}
		
		sets.WS.Moonshade	=	S{'Savage Blade', 'Rudra\'s Storm', 'Aeolian Edge'}
		
		--Default Generic WS Set--
		sets.WS.Standard = {
			range	=	{ name="Linos", augments={'Attack+20','Weapon skill damage +3%','STR+5 AGI+5',}},
			head	=	"Nyame Helm",
			neck	=	"Bard's Charm +2",
			lear	=	"Eabani Earring",
			rear	=	"Ishvara Earring",
			body	=	"Nyame Mail",
			hands	=	"Nyame Gauntlets",
			lring	=	"Epaminondas's Ring",
			rring	=	"Chirich Ring +1",
			back	=	{ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Sailfi Belt +1",
			legs	=	"Nyame Flanchard",
			feet	=	"Nyame Sollerets",
		}
		
		--Rudra's Storm Set--
		sets.WS['Rudras Storm'] = set_combine(sets.WS.Standard, {
		
		})
		
		--Aeolian Edge Set--
		sets.WS['Aeolian Edge'] = set_combine(sets.WS.Standard, {
			range	=	{ name="Linos", augments={'"Mag.Atk.Bns."+18','Weapon skill damage +2%','INT+8',}},
			rear	=	"Friomisi Earring",
			neck	=	"Baetyl Pendant",
			rring	=	"Metamor. Ring +1",
			back	=	{ name="Intarabus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
			waist	=	"Orpheus's Sash",
		})
		
	--Job Ability Sets--
	
		sets.JA = {}
		
		--'Soul Voice' Set--
		sets.JA['Soul Voice'] = {
			legs	=	"Bihu Cannions +3",
		}
		
		--'Troubadour' Set--
		sets.JA['Troubadour'] = {
			body	=	"Bihu Jstcorps. +3",
		}
		
		--'Nightingale' Set--
		sets.JA['Nightingale'] = {
			feet	=	"Bihu Slippers +3",
		}
				
	--Spell Sets--
		
		--Precast Sets--
		
		sets.precast = {}
		
		--Default FC Set--
		sets.precast.FC = {
			head	=	"Bunzi's Hat", --10
			neck	=	"Orunmila's Torque", --5
			lear	=	"Enchntr. Earring +1", --2
			rear	=	"Loquac. Earring", --2
			body	=	"Inyanga Jubbah +2", --14 
			hands	=	"Leyline Gloves", --8
			lring	=	"Kishar Ring", --4
			rring	=	"Rahab Ring", --2
			back	=	{ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','CHR+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}, --10
			waist	=	"Embla Sash", --5
			legs	=	"Aya. Cosciales +2", --6
			--feet	=	"Volte Gaiters", --6
		}
		
		--Song FC Set--
		sets.precast.Song = set_combine(sets.precast.FC, {
			head	=	"Fili Calot +1",
			feet	=	"Bihu Slippers +3",
		})
		
		--Honor March Set (Precast)--
		sets.precast['Honor March'] = set_combine(sets.precast.Song, {
			range	=	"Marsyas",
		})
		
		--Midcast Sets--
		
		sets.midcast = {}
		
		sets.midcast.Dummy	=	S{'Herb Pastoral','Shining Fantasia','Warding Round','Fowl Aubade', 'Army\'s Paeon', 'Army\'s Paeon II'}
		
		--Dummy Song Set--
		sets.midcast.DummySong = set_combine(sets.Idle.Standard, {
			range	=	"Daurdabla",
		})
		
		--Song Sets--
		sets.midcast.Song = set_combine(sets.Idle.Standard, {
			main	=	"Carnwenhan",
			sub		=	{ name="Kali", bag="Wardrobe 2"},
			range	=	"Gjallarhorn",
			head	=	"Fili Calot +1",
			neck	=	"Mnbw. Whistle +1",
			body	=	"Fili Hongreline +1",
			hands	=	"Fili Manchettes +1",
			legs	=	"Inyanga Shalwar +2",
			feet	=	"Brioso Slippers +3",
		})
		
		--Mages Ballad Set--
		sets.midcast['Mages Ballad'] = set_combine(sets.midcast.Song, {
			legs	=	"Fili Rhingrave +1",
		})
		
		--Scherzo Set--
		sets.midcast['Scherzo'] = set_combine(sets.midcast.Song, {
			feet	=	"Fili Cothurnes +1",
		})
		
		--Etudes Set--
		sets.midcast['Etudes'] = set_combine(sets.midcast.Song, {
			head	=	"Mousai Turban +1",
		})
		
		--Threnody Set--
		sets.midcast['Threnody'] = set_combine(sets.midcast.Song, {
			body	=	"Mousai Manteel +1",
		})
		
		--Carol Set--
		sets.midcast['Carol'] = set_combine(sets.midcast.Song, {
			hands	=	"Mousai Gages +1",
		})
		
		--Minne Set--
		sets.midcast['Minne'] = set_combine(sets.midcast.Song, {
			legs	=	"Mousai Seraweels +1",
		})
		
		--Mambo Set--
		sets.midcast['Mambo'] = set_combine(sets.midcast.Song, {
			feet	=	"Mousai Crackows +1",
		})
		
		--Honor March Set (Midcast)--
		sets.midcast['Honor March'] = set_combine(sets.midcast.Song, {
			range	=	"Marsyas",
		})
		
		--Magic Accuracy Set--
		sets.midcast['Magic Accuracy'] = {
			main	=	"Carnwenhan",
			sub		=	"Ammurapi Shield",
			range	=	"Gjallarhorn",
			head	=	"Brioso Roundlet +3",
			neck	=	"Mnbw. Whistle +1",
			lear	=	"Crep. Earring",
			rear	=	"Regal Earring",
			body	=	"Brioso Justau. +3",
			hands	=	"Inyan. Dastanas +2",
			lring	=	{ name="Stikini Ring +1", bag="Wardrobe 7"},
			rring	=	{ name="Stikini Ring +1", bag="Wardrobe 5"},
			back	=	{ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','CHR+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
			waist	=	"Acuity Belt +1",
			legs	=	"Brioso Cannions +3",
			feet	=	"Brioso Slippers +3",
		}
		
		--Magic Accuracy Set--
		sets.midcast['Lullaby'] = set_combine(sets.midcast['Magic Accuracy'], {
			--range	=	"Marsyas",
			range	=	"Blurred Harp +1",
			lear	=	"Gersemi Earring",
			waist	=	"Harfner's Sash",
			legs	=	"Inyanga Shalwar +2",
			feet	=	"Bihu Slippers +3",
		})
		
		sets.midcast.enmity = set_combine(sets.Idle.DT, {
			main	=	"Ungeri Staff",
			sub		=	"Alber Strap",
			head	=	"Halitus Helm",
			neck	=	"Unmoving Collar +1",
			lear	=	"Trux Earring",
			rear	=	"Cryptic Earring",
			body	=	"Emet Harness +1",
			lring	=	"Vengeful Ring",
			rring	=	"Eihwaz Ring",
			back	=	{ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','CHR+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
			waist	=	"Goading Belt"
		})
		
end

--Precast Core--
function precast(spell, action)
	
	--Magic Precast Handler--
	if spell.action_type == 'Magic' then
		if buffactive['Nightingale'] then
			midcast_magic(spell)
		else
			precast_magic(spell)
		end
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

	--Magic Midcast Handler--
	if spell.action_type == 'Magic' then
		if buffactive['Nightingale'] then
			return
		else
			midcast_magic(spell)
		end
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
				add_to_chat(170, 'Hybrid Toggled - Hybrid TP / DT Set Enabled (DT Override On)')
				HybridTrigger = 1
			else
				add_to_chat(170, 'Hybrid Toggled - Hybrid TP / DT Set Enabled')
				HybridTrigger = 1
			end
		end
	end
	
	--Weapon Triggers--
	if command == 'carn' then
		add_to_chat(170, 'Mordant Rime with Carnwenhan and Crepuscular Knife.')
		WeapTrig = 0
	elseif command == 'savage' then
		add_to_chat(170, 'Savage Blade with Naegling and Crepuscular Knife.')
		WeapTrig = 1
	elseif command == 'ae' then
		add_to_chat(170, 'Aeolian Edge with Tauret and Malevolence.')
		WeapTrig = 2
	end
	
	if command == 'tank' then
		if tank == 1 then
			tank = 0
			add_to_chat(170, 'Tank song gear released!')
		else
			tank = 1
			add_to_chat(170, 'Tank song gear on!')
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

	--Cure Set--
	if spell.skill == "Healing Magic" then
		equip(sets.precast.FC)
			
	--Honor March Set--
	elseif spell.english == "Honor March" then
		equip(sets.precast['Honor March'])
		
	--Default Songs--
	elseif spell.skill == "Ninjutsu" then
		equip(sets.precast.FC)
	
	else
		equip(sets.precast.Song)
	end

end

--Subfunction for Job Ability Precast--
function precast_ja(spell, action)
	
	--Soul Voice Trigger--
	if spell.english == "Soul Voice" then
		equip(sets.JA['Soul Voice'])
	end
	
	--Troubadour Trigger--
	if spell.english == "Troubadour" then
		equip(sets.JA['Troubadour'])
	end
	
	--Nightingale Trigger--
	if spell.english == "Nightingale" then
		equip(sets.JA['Nightingale'])
	end
	
end

--Subfunction for Weaponskill Precast--
function precast_weaponskill(spell, action)

	--Sanguine Blade Trigger--
	if spell.english == "Rudra's Storm" then	
		equip(sets.WS['Rudras Storm'])
	
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

	--Dummy Song Trigger--
	if sets.midcast.Dummy:contains(spell.english) then
		equip(sets.midcast.DummySong)
		
	elseif tank == 1 then
		equip(sets.midcast.enmity)
		return
		
	--Ballad Set--	
	elseif string.find(spell.english,'Ballad') then
		equip(sets.midcast['Mages Ballad'])
		
	--Scherzo Set--	
	elseif string.find(spell.english,'Scherzo') then
		equip(sets.midcast['Scherzo'])
		
	--Etudes Set--	
	elseif string.find(spell.english,'Etude') then
		equip(sets.midcast['Etudes'])
		
	--Threnody Set--	
	elseif string.find(spell.english,'Threnody') then
		equip(sets.midcast['Threnody'])
		
	--Carol Set--	
	elseif string.find(spell.english,'Carol') then
		equip(sets.midcast['Carol'])
		
	--Minne Set--	
	elseif string.find(spell.english,'Minne') then
		equip(sets.midcast['Minne'])
		
	--Mambo Set--	
	elseif string.find(spell.english,'Mambo') then
		equip(sets.midcast['Mambo'])
		
	--Lullaby Set--	
	elseif string.find(spell.english,'Lullaby') then
		equip(sets.midcast['Lullaby'])
		
	--Honor March Set--
	elseif spell.english == "Honor March" then
		equip(sets.midcast['Honor March'])
		
	--Utsusemi Set--	
	elseif string.find(spell.english,'Utsusemi') then
		equip(sets.Idle.DT)
	
	--Cure Set--
	elseif spell.skill == "Healing Magic" then
		equip(sets.midcast['Cure'])
		
	--Finale/Enfeeb Set--
	elseif spell.skill == "Enfeebling Magic" or string.find(spell.english, 'Finale') or string.find(spell.english, 'Elegy') then
		equip(sets.midcast['Magic Accuracy'])
	
	--Default Song Set--
	else
		equip(sets.midcast.Song)
	end

end

--Aftercast Swap while Idle--
function aftercast_idle()

	--Idle Setup--
	if DTTrigger == 1 then
		equip(sets.Idle.DT)
	elseif HybridTrigger == 1 then
		equip(sets.Idle.Evasion)
	else
		equip(sets.Idle.Standard)
	end
	
	--Weapon Handling--
	if player.tp <= 300 and not (buffactive['Aftermath: Lv.3']) then
		if player.sub_job ~= 'NIN' then
			equip(sets.Weapons.MainNoDW)
		else
			equip(sets.Weapons.Main)
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
	
	if WeapTrig == 1 then
		equip(sets.Weapons.Savage)
	elseif WeapTrig == 2 then
		equip(sets.Weapons.Aeolian)
	else
		equip(sets.Weapons.Carn)
	end
	
	--Disability Swap--
	if buffactive['terror'] or buffactive['petrification'] 
		or buffactive['stun'] or buffactive['sleep'] then
			equip(sets.Idle.DT)
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

--Buff Gain Function--
function buff_change(buff,gain)

	--Buff Gained--
	if gain then
	
		--Handicap Protection--
		if buff == "terror" or buff == "petrification" or 
			buff == "stun" or buff == "sleep" then
				equip(sets.Idle.DT)
		end
	
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
		
	end
	
	--Buff Lost--
	if not gain then
		
		--Aftermath Lost--
		if string.find(buff,'Aftermath') then
			Aftermath = 0
			windower.add_to_chat(210,"Aftermath Down")
		end
		
    end
	
end

--Stylelock Function--
function style()

	--Lockstyle Function--
	send_command('input /lockstyleset 10;')	
	add_to_chat(170, 'Style Locked')

end