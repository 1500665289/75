local tbModifier = GameMain:GetMod("_ModifierScript"):GetModifier("LQDX_XGFB");
local time = 0
local LQDX = GameMain:GetMod("LQDX");
local tbEvent = GameMain:GetMod("_Event");



--进入modifier
function tbModifier:Enter(modifier, npc)
if npc:GetProperty("DeepPracticeSpeedSpecialCoefficient") > 0 then
	npc.PropertyMgr:SetPropertyOverwrite("DeepPracticeSpeedSpecialCoefficient",0)
end
end

--modifier step
function tbModifier:Step(modifier, npc, dt)
time = time +dt
if time > 10 then
	if npc:GetProperty("DeepPracticeSpeedSpecialCoefficient") > 0 then
		npc.PropertyMgr:SetPropertyOverwrite("DeepPracticeSpeedSpecialCoefficient",0)
	end
	time = 0
end

end

--离开modifier
function tbModifier:Leave(modifier, npc)

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