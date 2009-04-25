function onStepIn(cid, item, position, fromPosition)


	if item.actionid == aid.POI_MOVE_TP1 then
		doTeleportThing(cid, mcord.POI_MOVE_TP1GO)
		
	end
	
	if item.actionid == aid.POI_MOVE_TP2 then
		doTeleportThing(cid, mcord.POI_MOVE_TP2GO)
	end	

	if item.actionid == aid.POI_MOVE_TP3 then
		doTeleportThing(cid, mcord.POI_MOVE_TP3GO)
	end

	if item.actionid == aid.POI_MOVE_TP4 then
		doTeleportThing(cid, mcord.POI_MOVE_TP4GO)
	end

	if item.actionid == aid.POI_MOVE_TP5 then
		doTeleportThing(cid, mcord.POI_MOVE_TP5GO)
	end
	
	if item.actionid == aid.POI_MOVE_TP6 then
		doTeleportThing(cid, mcord.POI_MOVE_TP6GO)
	end	
	
	if item.actionid == aid.POI_MOVE_TP7 then
		doTeleportThing(cid, mcord.POI_MOVE_TP7GO)
	end	
	
	if item.actionid == aid.POI_MOVE_TP8 then
		doTeleportThing(cid, mcord.POI_MOVE_TP8GO)
	end	
	return TRUE
end
