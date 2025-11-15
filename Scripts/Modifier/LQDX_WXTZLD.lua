local tbModifier = GameMain:GetMod("_ModifierScript"):GetModifier("LQDX_WXTZLD");
local time = {}
local LQDX = GameMain:GetMod("LQDX");
local tbEvent = GameMain:GetMod("_Event");
local wk = {"WX_SLDDJ","WX_SLDJ","WX_SLDQ","WX_SLDBS","WX_SLDJJ","WX_SLDZC","WX_SLDP","WX_SLDL","WX_SLDC","WX_SLDD"}
local m_name = nil;


--进入modifier
function tbModifier:Enter(modifier, npc)
	if CS.XiaWorld.PracticeMgr.Instance:GetGongDef("Gong_SS").Name == "Gong_SS" then
	local equip = npc.Equip:GetEquip(CS.XiaWorld.g_emEquipType.Weapon)
	m_name = wk[checkkind(equip)]
	npc:AddModifier(m_name)
	print("LQDX联动")
	end
end

--modifier step
function tbModifier:Step(modifier, npc, dt)
end

--离开modifier
function tbModifier:Leave(modifier, npc)
if m_name then
npc:RemoveModifier(m_name)
end
end


function tbModifier:UpdateStack(modifier, npc, add)
	end
--获取存档数据
function tbModifier:OnGetSaveData()
end

--载入存档数据
function tbModifier:OnLoadData(modifier, npc, tbData)
  --self.duration = 0
end

function checkkind(weapon)
local k = -1;
local name = weapon.def.Name;
	if string.find(name,"Sword2") ~= nil then
	k = 1
	end
	if string.find(name,"Sword1") ~= nil or string.find(name,"Sword0") then
	k = 2
	end
	if string.find(name,"Lance0") ~= nil or string.find(name,"Lance1")then
	k = 3
	end
	if string.find(name,"Knife1") ~= nil then
	k = 4
	end
	if string.find(name,"Lance2") ~= nil then
	k = 5
	end
	if string.find(name,"Halbert2") ~= nil then
	k = 6
	end
	if string.find(name,"AxeRing2") ~= nil then
	k = 7
	end
	if string.find(name,"AxeRing0") ~= nil or string.find(name,"AxeRing1")then
	k = 8
	end
	if string.find(name,"Halbert1") ~= nil or string.find(name,"Halbert0")then
	k = 9
	end
	if string.find(name,"Knife0") ~= nil or string.find(name,"Knife2")then
	k = 10
	end
return k
end