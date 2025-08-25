--crafting
has_xcompat = minetest.get_modpath("xcompat") ~= nil
has_mcl_core = minetest.get_modpath("mcl_core") ~= nil
has_default = minetest.get_modpath("default") ~= nil

-- default ingredients
local recipes_table = {
	-- empty simply is left undefined, so nothing is added
	_r05_ = "default:gravel",
	_r1_ = "default:sand",
	_r05h_ = "default:sandstone",
	_r1h_ = "default:flint"
}
local dye_red = "dye:red"
local dye_white = "dye:white"
local steel_ingot = "default:steel_ingot"
local cobble = "default:cobble"
local base_ingredient = "default:copper_ingot"
if has_xcompat then
	recipes_table = {
	  _r05_ = xcompat.materials["gravel"],
	  _r1_ = xcompat.materials["sand"],
	  _r05h_ = xcompat.materials["sandstone"],
	  _r1h_ = xcompat.materials["flint"]
	}
	dye_red = xcompat.materials["dye_red"]
	dye_white = xcompat.materials["dye_white"]
	steel_ingot = xcompat.materials["steel_ingot"]
	cobble = xcompat.materials["cobble"]
	base_ingredient = xcompat.materials["copper_ingot"]
elseif has_mcl_core then
	recipes_table = {
	  _r05_ = "mcl_core:gravel",
	  _r1_ = "mcl_core:sand",
	  _r05h_ = "mcl_core:sandstone",
	  _r1h_ = "mcl_core:flint"
	}
	dye_red = "mcl_colorblocks:concrete_red"
	dye_white = "mcl_colorblocks:concrete_white"
	steel_ingot = "mcl_core:iron_ingot"
	cobble = "mcl_core:cobble"
	base_ingredient = "mcl_copper:copper_ingot"
end
-- We still want to use concrete specifically if we have mcl_core
if has_mcl_core then
	dye_red = "mcl_colorblocks:concrete_red"
	dye_white = "mcl_colorblocks:concrete_white"
end

function nameznik.register_recipe(nname,nnum,count,_type)
	local this_recipe = {dye_white}
	-- add red color
	if nname == "koncovnik_" or nname == "nameznik_konc_" or nname == "koncovnik_konc_" then
		table.insert(this_recipe,dye_red)
	end
	if nname == "koncovnik_" then
		table.insert(this_recipe,steel_ingot)
	end
	if nname == "hranicnik" then
		table.insert(this_recipe,cobble)
	end
	if recipes_table[_type] ~= nil then
		table.insert(this_recipe, recipes_table[_type])
	end
	local x = tonumber(nnum)
	if x == nil then x = 0 end
	for _ = 1, x do
		table.insert(this_recipe,base_ingredient)
	end
	_type = _type:sub(2)
	--if _type ~= nil and _type ~= "" then _type = _type .. "_" end
	minetest.register_craft({
		output = "nameznik:" .. _type .. nname .. nnum .. " " .. count,
		type = "shapeless",
		recipe = this_recipe
	})
end
