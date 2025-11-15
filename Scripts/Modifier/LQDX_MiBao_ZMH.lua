local tbModifier = GameMain:GetMod("_ModifierScript"):GetModifier("LQDX_MiBao_ZMH");
local time = {}
local LQDX = GameMain:GetMod("LQDX");
local tbEvent = GameMain:GetMod("_Event");



--进入modifier
function tbModifier:Enter(modifier, npc)
if World.DaySecond >150 and World.DaySecond < 450 then
	npc:AddModifier("LQDX_MiBao_ZMH_Day")
else
	npc:AddModifier("LQDX_MiBao_ZMH_Night")
end	
print(1)
end

--modifier step
function tbModifier:Step(modifier, npc, dt)
end

--离开modifier
function tbModifier:Leave(modifier, npc)
	npc:RemoveModifier("LQDX_MiBao_ZMH_Day")
	npc:RemoveModifier("LQDX_MiBao_ZMH_Night")

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