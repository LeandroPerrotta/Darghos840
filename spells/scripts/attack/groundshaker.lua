local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)

function getSpellDamage(cid, weaponSkill, weaponAttack, attackStrength)
	local level = getPlayerLevel(cid)

	local min = -(((weaponSkill+weaponAttack)/2)+(level/5))
	local max = -(((weaponSkill+weaponAttack)*1.1)+(level/5))

	return min, max
end
setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "getSpellDamage")

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end