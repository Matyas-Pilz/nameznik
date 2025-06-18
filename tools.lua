local function is_color4dir_node(pos)
    local node = minetest.get_node_or_nil(pos)
    if not node then return false end
    local def = minetest.registered_nodes[node.name]
    return def and def.paramtype2 == "color4dir"
end

local function is_4dir_node(pos)
    local node = minetest.get_node_or_nil(pos)
    if not node then return false end
    local def = minetest.registered_nodes[node.name]
    return def and def.paramtype2 == "4dir" or "color4dir"
end

minetest.register_tool("nameznik:repainter", {
    description = "Repainter",
    inventory_image = "owires_repainter.png",

    -- Levý klik – posun barvy o 4
    on_use = function(itemstack, user, pointed_thing)
        if pointed_thing.type ~= "node" then return itemstack end
        local pos = pointed_thing.under
        if not is_color4dir_node(pos) then return itemstack end

        local node = minetest.get_node(pos)
        node.param2 = (node.param2 + 4) % 256
        minetest.swap_node(pos, node)

        return itemstack
    end,

    -- Pravý klik – posun barvy o 32
    on_place = function(itemstack, user, pointed_thing)
        if pointed_thing.type ~= "node" then return itemstack end
        local pos = pointed_thing.under
        if not is_color4dir_node(pos) then return itemstack end

        local node = minetest.get_node(pos)
        node.param2 = (node.param2 + 32) % 256
        minetest.swap_node(pos, node)

        return itemstack
    end,
})

minetest.register_tool("nameznik:rotator", {
    description = "Rotator",
    inventory_image = "owires_rotator.png",

    -- Levý klik – posun rotace o 1 (předpoklad: rotace je v dolních 2 bitech param2)
    on_use = function(itemstack, user, pointed_thing)
        if pointed_thing.type ~= "node" then return itemstack end
        local pos = pointed_thing.under
        if not is_4dir_node(pos) then return itemstack end

        local node = minetest.get_node(pos)
        node.param2 = (node.param2 + 1) % 4 + math.floor(node.param2 / 4) * 4
        minetest.swap_node(pos, node)

        return itemstack
    end,
})
