function onLogin(cid)
	registerCreatureEvent(cid, "PlayerDeath")
	
	-- DARGHOS --
	freeInPremiumArea(cid)
	itemFromShop(cid)
	-- END DARGHOS --

	return TRUE
end
