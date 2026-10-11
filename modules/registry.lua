local registry = {}

--- {
---   [item_id]={
---     ['mouse:left']=lmb_func,
---     ['mouse:right']=rmb_func
---   }
--- }
registry.items = {}

--- id items/blocks
registry.items_ids = {}

function register(item_id, callbacks)
	local lmb_func = callbacks.on_lmb
	local rmb_func = callbacks.on_rmb

	if type(item_id) == "string" then
		local item = {}
		if lmb_func then
			item["mouse:left"] = lmb_func
		end
		if rmb_func then
			item["mouse:right"] = rmb_func
		end
		registry.items[item_id] = item
		table.insert(registry.items_ids, item_id)
	end
end

function registry.register(param1, param2)
	if type(param1) == "string" then
		-- param1: item_id
		-- param2: callbacks
		register(param1, param2)
	else
		-- param1: callbacks
		local items_callbacks = param1
		for item_id, callbacks in pairs(items_callbacks) do
			register(item_id, callbacks)
		end
	end
end

--- @deprecated
function registry.add_item(item_id, lmb_func, rmb_func)
	register(item_id, {
		on_lmb = lmb_func,
		on_rmb = rmb_func,
	})
end

return registry
