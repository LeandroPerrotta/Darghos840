function onLogin(cid)
	registerCreatureEvent(cid, "PlayerDeath")
	
	-- DARGHOS --
	itemFromShop(cid)
	-- END DARGHOS --

	return TRUE
end
