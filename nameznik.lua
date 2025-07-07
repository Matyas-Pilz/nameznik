local S = core.get_translator("nameznik")
has_xcompat = minetest.get_modpath("xcompat") ~= nil
has_mcl_core = minetest.get_modpath("mcl_core") ~= nil
has_default = minetest.get_modpath("default") ~= nil

local nameznik__groups = {dig_immediate=2, not_blocking_trains=1}
local nameznik__simplenodebox = {type = "fixed",fixed = {
            {-0.5, -0.5, -0.1, 0.5, -0.46, 0.1}}}
local nameznik__oldnodebox = {type = "fixed",fixed = {
            {-0.5, -0.5, -0.1, 0.5, -0.49, 0.1},{-0.45, -0.49, -0.075, 0.45, -0.48, 0.075},{-0.4, -0.48, -0.05, 0.4, -0.47, 0.05},{-0.35, -0.47, -0.025, 0.35, -0.46, 0.025}}}
local nameznik__nodebox = {type = "fixed",fixed = {
            {-0.5, -0.5, -0.1, 0.5, -0.496, 0.1},{-0.48, -0.496, -0.09, 0.48, -0.492, 0.09},{-0.46, -0.492, -0.08, 0.46, -0.488, 0.08},{-0.44, -0.488, -0.07, 0.44, -0.484, 0.07},
			{-0.42, -0.484, -0.06, 0.42, -0.48, 0.06},{-0.4, -0.48, -0.05, 0.4, -0.476, 0.05},{-0.38, -0.476, -0.04, 0.38, -0.472, 0.04},{-0.36, -0.472, -0.03, 0.36, -0.468, 0.03},
			{-0.34, -0.468, -0.02, 0.34, -0.464, 0.02},{-0.32, -0.464, -0.01, 0.32, -0.46, 0.01}}}
local nameznik__nodebox_r05 = {type = "fixed",fixed = {
            {0.5+-0.5, -0.5, -0.1, 0.5+0.5, -0.496, 0.1},{0.5+-0.48, -0.496, -0.09, 0.5+0.48, -0.492, 0.09},{0.5+-0.46, -0.492, -0.08, 0.5+0.46, -0.488, 0.08},{0.5+-0.44, -0.488, -0.07, 0.5+0.44, -0.484, 0.07},
			{0.5+-0.42, -0.484, -0.06, 0.5+0.42, -0.48, 0.06},{0.5+-0.4, -0.48, -0.05, 0.5+0.4, -0.476, 0.05},{0.5+-0.38, -0.476, -0.04, 0.5+0.38, -0.472, 0.04},{0.5+-0.36, -0.472, -0.03, 0.5+0.36, -0.468, 0.03},
			{0.5+-0.34, -0.468, -0.02, 0.5+0.34, -0.464, 0.02},{0.5+-0.32, -0.464, -0.01, 0.5+0.32, -0.46, 0.01}}}
local nameznik__nodebox_r1 = {type = "fixed",fixed = {
            {1+-0.5, -0.5, -0.1, 1+0.5, -0.496, 0.1},{1+-0.48, -0.496, -0.09, 1+0.48, -0.492, 0.09},{1+-0.46, -0.492, -0.08, 1+0.46, -0.488, 0.08},{1+-0.44, -0.488, -0.07, 1+0.44, -0.484, 0.07},
			{1+-0.42, -0.484, -0.06, 1+0.42, -0.48, 0.06},{1+-0.4, -0.48, -0.05, 1+0.4, -0.476, 0.05},{1+-0.38, -0.476, -0.04, 1+0.38, -0.472, 0.04},{1+-0.36, -0.472, -0.03, 1+0.36, -0.468, 0.03},
			{1+-0.34, -0.468, -0.02, 1+0.34, -0.464, 0.02},{1+-0.32, -0.464, -0.01, 1+0.32, -0.46, 0.01}}}
local r05h=0.05
local nameznik__nodebox_r05h = {type = "fixed",fixed = {
            {0.5+-0.5, -0.5, -0.1, 0.5+0.5, r05h-0.496, 0.1},{0.5+-0.48, r05h-0.496, -0.09, 0.5+0.48, r05h-0.492, 0.09},{0.5+-0.46, r05h-0.492, -0.08, 0.5+0.46, r05h-0.488, 0.08},{0.5+-0.44, r05h-0.488, -0.07, 0.5+0.44, r05h-0.484, 0.07},
			{0.5+-0.42, r05h-0.484, -0.06, 0.5+0.42, r05h-0.48, 0.06},{0.5+-0.4, r05h-0.48, -0.05, 0.5+0.4, r05h-0.476, 0.05},{0.5+-0.38, -0.476, -0.04, 0.5+0.38, -0.472, 0.04},{0.5+-0.36, -0.472, -0.03, 0.5+0.36, -0.468, 0.03},
			{0.5+-0.34, r05h-0.468, -0.02, 0.5+0.34, r05h-0.464, 0.02},{0.5+-0.32, r05h-0.464, -0.01, 0.5+0.32, r05h-0.46, 0.01}}}
local nameznik__nodebox_r1h = {type = "fixed",fixed = {
            {1+-0.5, -0.5, -0.1, 1+0.5, r05h-0.496, 0.1},{1+-0.48, r05h-0.496, -0.09, 1+0.48, r05h-0.492, 0.09},{1+-0.46, r05h-0.492, -0.08, 1+0.46, r05h-0.488, 0.08},{1+-0.44, r05h-0.488, -0.07, 1+0.44, r05h-0.484, 0.07},
			{1+-0.42, r05h-0.484, -0.06, 1+0.42, r05h-0.48, 0.06},{1+-0.4, r05h-0.48, -0.05, 1+0.4, r05h-0.476, 0.05},{1+-0.38, r05h-0.476, -0.04, 1+0.38, r05h-0.472, 0.04},{1+-0.36, r05h-0.472, -0.03, 1+0.36, r05h-0.468, 0.03},
			{1+-0.34, r05h-0.468, -0.02, 1+0.34, r05h-0.464, 0.02},{1+-0.32, r05h-0.464, -0.01, 1+0.32, r05h-0.46, 0.01}}}
local nameznik__sboxr = {type = "fixed",fixed = {
            {-0.5, -0.5, -0.1, 1, -0.35, 0.1}}}

local function get_palette(nname)
	if nname == "nameznik_" or nname == "nameznik_konc_" or nname == "koncovnik_" then
		return "nameznik_palette1.png"
	elseif nname == "hranicnik" then
		return "nameznik_palette2.png"
	end
	--safety
	minetest.log("warning","Nameznik: cannot get palette choice for " .. nnname)
	return "nameznik_palette1.png"
end

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
	base_ingredient = "mcl_core:copper"
end
-- We still want to use concrete specifically if we have mcl_core
if has_mcl_core then
	dye_red = "mcl_colorblocks:concrete_red"
	dye_white = "mcl_colorblocks:concrete_white"
end

local function register_recipe(nname,nnum,count,_type)
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

local function nameznik_regnode(nname, nnum, ndesc, nfront, nside, nback)
	local npalette = get_palette(nname)

	minetest.register_node("nameznik:" .. nname .. nnum, {
		description = S(ndesc) .. " " .. nnum,
		tiles = {"nameznik_bpx.png"},
		overlay_tiles = {
			{name = nfront, color = "white"},
			"",
			nside,
			nside,
			{name = nback, color = "white"},
			{name = nfront, color = "white"},
		},
		paramtype="light",
		paramtype2 = "color4dir",
		drawtype = "nodebox",
		node_box = nameznik__nodebox,
		groups = nameznik__groups,
		is_ground_content = false,
		palette = npalette,
	})
	register_recipe(nname, nnum, 15, "")
end

local function nameznik_regnoder05(nname, nnum, ndesc, nfront, nside, nback)
	local npalette = get_palette(nname)

	minetest.register_node("nameznik:r05_" .. nname .. nnum, {
		description = S(ndesc) .. " "..S("right").." +0,5 " .. nnum,
		tiles = {"nameznik_bpx.png"},
		overlay_tiles = {
			{name = nfront, color = "white"},
			"",
			nside,
			nside,
			{name = nback, color = "white"},
			{name = nfront, color = "white"},
		},
		paramtype="light",
		paramtype2 = "color4dir",
		drawtype = "nodebox",
		node_box = nameznik__nodebox_r05,
		selection_box = nameznik__sboxr,
		groups = nameznik__groups,
		is_ground_content = false,
		palette = npalette,
	})
	register_recipe(nname, nnum, 15, "_r05_")
end

local function nameznik_regnoder1(nname, nnum, ndesc, nfront, nside, nback)
	local npalette = get_palette(nname)

	minetest.register_node("nameznik:r1_" .. nname .. nnum, {
		description = S(ndesc) .. " "..S("right").." +1 ".. nnum,
		tiles = {"nameznik_bpx.png"},
		overlay_tiles = {
			{name = nfront, color = "white"},
			"",
			nside,
			nside,
			{name = nback, color = "white"},
			{name = nfront, color = "white"},
		},
		paramtype="light",
		paramtype2 = "color4dir",
		drawtype = "nodebox",
		node_box = nameznik__nodebox_r1,
		selection_box = nameznik__sboxr,
		groups = nameznik__groups,
		is_ground_content = false,
		palette = npalette,
	})
	register_recipe(nname, nnum, 15, "_r1_")
end

local function nameznik_regnoder05h(nname, nnum, ndesc, nfront, nside, nback)
	local npalette = get_palette(nname)

	minetest.register_node("nameznik:r05h_" .. nname .. nnum, {
		description = S(ndesc) .. " "..S("right").." +0,5 "..S("higher").." " .. nnum,
		tiles = {"nameznik_bpx.png"},
		overlay_tiles = {
			{name = nfront, color = "white"},
			"",
			nside,
			nside,
			{name = nback, color = "white"},
			{name = nfront, color = "white"},
		},
		paramtype="light",
		paramtype2 = "color4dir",
		drawtype = "nodebox",
		node_box = nameznik__nodebox_r05h,
		selection_box = nameznik__sboxr,
		groups = nameznik__groups,
		is_ground_content = false,
		palette = npalette,
	})
	register_recipe(nname, nnum, 15, "_r05h_")
end

local function nameznik_regnoder1h(nname, nnum, ndesc, nfront, nside, nback)
	local npalette = get_palette(nname)

	minetest.register_node("nameznik:r1h_" .. nname .. nnum, {
		description = S(ndesc) .. " "..S("right").." +1 "..S("higher").." " .. nnum,
		tiles = {"nameznik_bpx.png"},
		overlay_tiles = {
			{name = nfront, color = "white"},
			"",
			nside,
			nside,
			{name = nback, color = "white"},
			{name = nfront, color = "white"},
		},
		paramtype="light",
		paramtype2 = "color4dir",
		drawtype = "nodebox",
		node_box = nameznik__nodebox_r1h,
		selection_box = nameznik__sboxr,
		groups = nameznik__groups,
		is_ground_content = false,
		palette = npalette,
	})
	register_recipe(nname, nnum, 15, "_r1h_")
end

nameznik_regnode("nameznik_","1","Fouling point marker","nameznik_over1.png","","nameznik_over1.png")
nameznik_regnode("nameznik_","2","Fouling point marker","nameznik_over2.png","","nameznik_over2.png")
nameznik_regnode("nameznik_","3","Fouling point marker","nameznik_over3.png","nameznik_blpx.png","nameznik_over3.png")
nameznik_regnode("nameznik_","4","Fouling point marker","","","")
nameznik_regnode("nameznik_","5","Fouling point marker","nameznik_over5.png","","nameznik_over5.png")
nameznik_regnode("nameznik_konc_","1","Fouling point marker with end point of train route","nameznik_end1.png^nameznik_over1.png","","nameznik_over1.png")
nameznik_regnode("nameznik_konc_","2","Fouling point marker with end point of train route","nameznik_end1.png^nameznik_over2.png","","nameznik_over2.png")
nameznik_regnode("koncovnik_","1","End point marker of train route","nameznik_end1.png","","")
nameznik_regnode("hranicnik","","Border point marker of railway companies","nameznik_border1.png","","nameznik_border1.png")

nameznik_regnoder05("nameznik_","1","Fouling point marker","nameznik_over1.png","","nameznik_over1.png")
nameznik_regnoder05("nameznik_","2","Fouling point marker","nameznik_05over2.png","","nameznik_05over2.png")
nameznik_regnoder05("nameznik_","3","Fouling point marker","nameznik_05over3.png","nameznik_blpx.png","nameznik_05over3.png")
nameznik_regnoder05("nameznik_","4","Fouling point marker","","","")
nameznik_regnoder05("nameznik_","5","Fouling point marker","nameznik_over5.png","","nameznik_over5.png")
nameznik_regnoder05("nameznik_konc_","1","Fouling point marker with end point of train route","nameznik_05end1.png^nameznik_over1.png","","nameznik_over1.png")
nameznik_regnoder05("nameznik_konc_","2","Fouling point marker with end point of train route","nameznik_05end1.png^nameznik_05over2.png","","nameznik_05over2.png")
nameznik_regnoder05("koncovnik_","1","End point marker of train route","nameznik_05end1.png","","")
nameznik_regnoder05("hranicnik","","Border point marker of railway companies","nameznik_05border1.png","","nameznik_05border1.png")

nameznik_regnoder1("hranicnik","","Border point marker of railway companies","nameznik_border1.png","","nameznik_border1.png")

nameznik_regnoder05h("hranicnik","","Border point marker of railway companies","nameznik_05border1.png","","nameznik_05border1.png")

nameznik_regnoder1h("hranicnik","","Border point marker of railway companies","nameznik_border1.png","","nameznik_border1.png")
