local combat = createCombatObject()
local area = createCombatArea(AREA_CROSS5X5)
setCombatArea(combat, area)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 2 * 60 * 1000)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, 2)

function onCastSpell(cid, var)
	local pos = getCreaturePosition(cid)
	if(getPlayerParty(cid) == nil) then
		doPlayerSendCancel(cid, "No party members in range.")
		doSendMagicEffect(pos, CONST_ME_POFF)
		return LUA_ERROR
	end

	local membersList = getPartyMembers(cid)
	if(type(membersList) ~= 'table' or table.maxn(membersList) <= 1) then
		doPlayerSendCancel(cid, "No party members in range.")
		doSendMagicEffect(pos, CONST_ME_POFF)
		return LUA_ERROR
	end

	local affectedList = {}
	for _, pid in ipairs(membersList) do
		if(getDistanceBetween(getCreaturePosition(pid), pos) <= 36) then
			table.insert(affectedList, pid)
		end
	end

	local tmp = table.maxn(affectedList)
	if(tmp <= 1) then
		doPlayerSendCancel(cid, "No party members in range.")
		doSendMagicEffect(pos, CONST_ME_POFF)
		return LUA_ERROR
	end

	local mana = (tmp * 50)
	if(getCreatureMana(cid) < mana) then
		doPlayerSendCancel(cid, "You do not have enough mana.")
		doSendMagicEffect(pos, CONST_ME_POFF)
		return LUA_ERROR
	end

	if(doCombat(cid, combat, var) ~= LUA_NO_ERROR) then
		doPlayerSendCancel(cid, "Sorry, not possible.")
		doSendMagicEffect(pos, CONST_ME_POFF)
		return LUA_ERROR
	end

	doCreatureAddMana(cid, -mana, FALSE)
	doPlayerAddSpentMana(cid, mana)
	for _, pid in ipairs(affectedList) do
		doAddCondition(pid, condition)
	end

	return LUA_NO_ERROR
end

