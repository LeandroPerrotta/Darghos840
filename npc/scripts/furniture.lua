local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 			end
function onCreatureSay(cid, type, msg) 			npcHandler:onCreatureSay(cid, type, msg) 		end
function onThink() 					npcHandler:onThink() 					end

-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
keywordHandler:addKeyword({'chairs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell wooden, sofa, red cushioned, green cushioned, tusk and ivory chairs.'})
keywordHandler:addKeyword({'tables'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell big, square, round, small, stone, tusk, bamboo tables.'})
keywordHandler:addKeyword({'plants'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell pink and green flowers, also christmas trees.'})
keywordHandler:addKeyword({'furniture'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell large trunks, boxes, drawers, dressers, lockers and troughs.'})
keywordHandler:addKeyword({'more'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell coal basins, birdcages, harps, pianos, globes, clocks and lamps.'})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell blue, green, orange, pink, red, white and yellow tapestries.'})
keywordHandler:addKeyword({'small'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell small purple, small green, small red, small blue, small orange, small turquiose and small white pillows.'})
keywordHandler:addKeyword({'round'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell round blue, round red, round purple and round turquiose pillows.'})
keywordHandler:addKeyword({'square'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell blue, red, green and yellow pillows.'})
keywordHandler:addKeyword({'pillows'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I sell heart, small, sqare and round pillows.'})

npcHandler:addModule(FocusModule:new())
