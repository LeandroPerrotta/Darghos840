function onLogin(cid)
	registerCreatureEvent(cid, "PlayerDeath")
	local message = "Dear "..getCreatureName(cid)..",\nYour premium time is over!\nYou were automatically taken to the temple of Quendor City.\nContinue contributing to the Darghos Server and have a good game!\n\nYours,\nUltraXSoft Team."
	PremDay = getPlayerPremiumDays(cid)	
	
	if 
		isInArea(getCreaturePosition(cid),aracura_verify1, aracura_verify2) or
		isInArea(getCreaturePosition(cid), north_verify1, north_verify2) or
		isInArea(getCreaturePosition(cid), sala_verify1, sala_verify2) then
			if PremDay < 1 then
				doTeleportThing(cid, TEMPLE.QUENDOR)
				doPlayerPopupFYI(cid,message)
			end
    end

	return TRUE
end
