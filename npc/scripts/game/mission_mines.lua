local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end



function Access(cid, message, keywords, parameters, node)

	local msg1 = "Congratulations, now you have access for the northrend mines! Warning, the mines is a Hell!!!!!!!"
	local msg2 = "You need 40 shards to make the full mission for me."
	local msg3 = "Only premium accounts can work for me."
	local itemid = getItemIdByName("shard")
	
    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
		if getPlayerItemCount(cid,itemid) >= 40 then
			if doPlayerRemoveItem(cid, itemid,40) then
				selfSay(cid, msg1)
			else
				selfSay(cid, msg2)
			end
		else
			selfSay(cid, msg2)
		end
	else
		selfSay(cid, msg3)
	end
	
	
	end

end

keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask with me about mission, and I take the mission for you."})


local node1 = keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want, to make the mission for me? For this, you need 40 shards!'})
    node1:addChildKeyword({'yes'}, Access, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Oaaa, I hate you.', reset = true})


npcHandler:addModule(FocusModule:new())