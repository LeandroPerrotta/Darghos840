function createClass(parent)
	local newClass = {}
	function newClass:new(instance)
		local instance = instance or {}
		setmetatable(instance, {__index = newClass})
		return instance
	end

	if(parent ~= nil) then
		setmetatable(newClass, {__index = parent})
	end

	function newClass:getSelf()
		return newClass
	end

	function newClass:getParent()
		return baseClass
	end

	function newClass:isa(class)
		local tmp = newClass
		while(tmp ~= nil) do
			if(tmp == class) then
				return true
			end

			tmp = tmp:getParent()
		end

		return false
	end
	
	function newClass:setAttributes(attributes)
		for k, v in pairs(attributes) do
			newClass[k] = v
		end
	end

	return newClass
end

dofile(getDataDir() .. "lib/constant.lua")
dofile(getDataDir() .. "lib/function.lua")
dofile(getDataDir() .. "lib/compat.lua")
dofile(getDataDir() .. "lib/database.lua")
dofile(getDataDir() .. "lib/const_positions.lua")
dofile(getDataDir() .. "lib/aids.lua")
dofile(getDataDir() .. "lib/sids.lua")