local this = {}

function this.get_selected_id(playerid)
	local inventory_id, active_slot = player.get_inventory(playerid)
	local item_id, item_count = inventory.get(inventory_id, active_slot)
	return item_id
end

function this.get_selected_name(playerid)
	local inventory_id, active_slot = player.get_inventory(playerid)
	local item_id, item_count = inventory.get(inventory_id, active_slot)
	if item_id ~= 0 then
		return item.name(item_id)
	end
	return nil
end

function this.is_item_selected(playerid, item_name)
	local selected = this.get_selected_name(playerid)
	if selected ~= nil and selected == item_name then
		return true
	end
	return false
end

function this.is_selected_item_in_list(playerid, item_names)
	local selected = this.get_selected_name(playerid)
	if not selected then
		return
	end
	for key, item_name in pairs(item_names) do
		if selected ~= nil and selected == item_name then
			return true
		end
	end
	return false
end

return this
