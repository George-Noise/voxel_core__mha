local inventory_util = require("mha:inventory_util")
local registry = require("mha:registry")

local this = {}

local mouse_buttons = { "mouse:left", "mouse:right" }
local last_inputs = {
	["mouse:left"] = false,
	["mouse:right"] = false,
}

local isDefaultMouseBindingsNow = true

--- on/off default mouse buttons bindings
local function set_mouse_active(active)
	if isDefaultMouseBindingsNow ~= active then
		local all_binds = input.get_bindings() -- get_bindings - get array of strings
		local disable = { "player.build", "player.attack", "player.destroy", "player.pick" }
		for key, bind in ipairs(all_binds) do
			if table.has(disable, bind) then
				input.set_enabled(bind, active)
			end
		end

		isDefaultMouseBindingsNow = active
	end
end

local function is_string_in_array(array, str)
	for _, value in ipairs(array) do
		if value == str then
			return true
		end
	end
	return false
end

--- @param playerid - number
--- @param input_id - 'mouse:left' | 'mouse:right'
--- @param input_type - 'down' | 'up'
local function use_item(playerid, input_id, input_type)
	local selected = inventory_util.get_selected_name(playerid)
	if is_string_in_array(registry.items_ids, selected) then
		local func = registry.items[selected][input_id]
		if func then
			func(input_type)
		end
	end
end

local function handle_input(playerid, input_id)
	local pressed = input.is_pressed(input_id)
	if pressed and not last_inputs[input_id] then
		use_item(playerid, input_id, "down")
	end
	if not pressed and last_inputs[input_id] then
		use_item(playerid, input_id, "up")
	end
	last_inputs[input_id] = pressed
end

--- @param playerid - number
function this.on_player_tick(playerid)
	if inventory_util.is_selected_item_in_list(playerid, registry.items_ids) then
		set_mouse_active(false)
		for k, v in pairs(mouse_buttons) do
			handle_input(playerid, v)
		end
	else
		set_mouse_active(true)
	end
end

return this
