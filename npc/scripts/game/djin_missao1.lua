local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end



function Access(cid, message, keywords, parameters, node)

		
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	

		if getPlayerStorageValue(cid, sid.DJIN_QUEST_1) ~= 1 then
			selfSay(cid, "Ok, you are now in my list of brave warriors! Now you need to down on teleport, in south of here, and kill all monsters! Have a good battle.")
			setPlayerStorageValue(cid, sid.DJIN_QUEST_2, 1)
		else
			selfSay(cid, "You already have this quest.")
		end

end

keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask with me about mission, and I take the mission for you."})


local node1 = keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want, to make the mission for me?'})
    node1:addChildKeyword({'yes'}, Access, {npcHandler = npcHandler, onlyFocus = true, reset = true})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Oaaa, I hate you.', reset = true})


npcHandler:addModule(FocusModule:new())
