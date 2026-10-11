local registry = require("mha:registry")

local api = {}

--- Add one or multiple items/blocks to mouse buttons handler
---
--- @example
---	mha.register({
---		["vd__debug_tools:debug_balls_transform.item"] = {
---			on_lmb = function(state) print(state) end,
---			on_rmb = function(state) print(state) end,
---		},
---		["vd__debug_tools:debug_balls_transform.item"] = {
---			on_lmb = function(state) print(state) end,
---			on_rmb = function(state) print(state) end,
---		},
---	})
---
--- @example
--- api.registry2(
---   'mod_id:some_item.item',
--- 	{
---     on_lmb = function(state) print(state) end,
---		  on_rmb = function(state) print(state) end,
--- 	}
--- )
---
---
---	item_id: string ('mod_id:some_item.item')
--- callbacks:
--- {
---   ['mod_id:some_item.item'] =
---     {
---       on_lmb = function(state),
---       on_rmb = function(state),
---     },
---   on_lmb = function(state),
---		on_rmb = function(state),
--- }
--- state: 'down' | 'up'
--- @param param1 - item_id | callbacks
--- @param param2 - callbacks | nil
function api.register(param1, param2)
	registry.register(param1, param2)
end

--- @deprecated use register() instead
---
--- Add one item/block to mouse buttons handler
---
--- @param item_id - string ('mod_id:some_item.item')
--- @param lmb_func - func('down' | 'up') | nil
--- @param rmb_func - func('down' | 'up') | nil
function api.add_item(item_id, lmb_func, rmb_func)
	registry.add_item(item_id, lmb_func, rmb_func)
end

return api
