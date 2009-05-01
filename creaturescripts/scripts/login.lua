function onLogin(cid)
	registerCreatureEvent(cid, "PlayerDeath")
	
	-- DARGHOS --
	runPremiumSystem(cid)
	itemFromShop(cid)
	-- END DARGHOS --

	return TRUE
end
