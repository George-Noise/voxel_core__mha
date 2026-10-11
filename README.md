# Mouse Handle API (MHA)

API to handle mouse buttons on selected hotbar item/block in VoxelCore

## Versions

VoxelCore 0.26 - 0.32+

## How it works

0. You register your item and callback functions through API.
1. MHA check selected item in hotbar.
2. Stop default mouse events on registred items.
3. Callback yours registred functions.

## Install

Copy `mha` to `content/` in your VoxelCore directory.

## Usage

For example in your `./scripts/world.lua` or look at [api.lua](./modules/api.lua)

```lua
local mha = require('mha:api')

local function on_left_click(state)
  if state == 'down' then
    print("lmb pressed")
  elseif state == 'up' then
    print("lmb depressed")
  end
end

local function on_right_click(state)
  if state == 'down' then
    print("rmb pressed")
  elseif state == 'up' then
    print("rmb depressed")
  end
end

mha.register({
  ["mod_id:some_item.item"] = {
    on_lmb = on_left_click,
    on_rmb = on_right_click,
  },
})
-- OR
mha.register("mod_id:some_item.item", {
  on_lmb = on_left_click,
  on_rmb = on_right_click,
})
```

## CREATORS

- VulpesDust
- Andryha

## LICENCE

- MIT | Apach 2.0
