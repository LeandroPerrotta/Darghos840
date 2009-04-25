function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	local stone = mcord.POI_STONE_ENTER
	local getStone = getThingfromPos(stone)
	
	if item.actionid == aid.POI_LEVER_ENTER and item.itemid == 1945 and getStone.itemid == 1304 then
		doRemoveItem(getStone.uid,1)
		setGlobalStorageValue(POI_ENTER_LEVER_VALUE, 1)
		addEvent(timer, 60*1000)
		doTransformItem(item.uid, 1946)
		
	elseif item.actionid == aid.POI_LEVER_ENTER and item.itemid == 1946 then
		if getGlobalStorageValue(POI_ENTER_LEVER_VALUE) == 0 then
			doCreateItem(1304,1,stone)
		else
			doPlayerSendCancel(cid, "You need wait 60 seconds for create the stone again.")
		end
	end	
	
	return TRUE
end

function timer()
	setGlobalStorageValue(POI_ENTER_LEVER_VALUE, 0)	
end