local tbModifier = GameMain:GetMod("_ModifierScript"):GetModifier("LQDX_MiBao_ZMH_Day");
local time = {}
local fb = nil;
local LQDX = GameMain:GetMod("LQDX");
local tbEvent = GameMain:GetMod("_Event");



--进入modifier
function tbModifier:Enter(modifier, npc)
local fabaos = npc.Equip:FindFabao()
print(3)
	for _,fabao in pairs(fabaos) do
		if fabao.Fabao.OitemDef.Name == "LQDX_MiBao_YinYangHuan"and fabao.Fabao.AbilityDatas.Count < 2 then 
		local data ={Kind = CS.XiaWorld.Fight.g_emFabaoSpecialAbility.HitCountCostSkill,Desc = "每次攻击释放炎爆",nParam1= 1,sParam1="LQDX_0_ZMHSKILL"};
		local data1 ={Kind = CS.XiaWorld.Fight.g_emFabaoSpecialAbility.HitCountAddSubColdDown,Desc = "每次攻击减少大量冷却",nParam1= 1,fParam1=3};
		fabao.Fabao:AddAbilityData(data);
		fabao.Fabao:AddAbilityData(data1);
		end
	end
end

--modifier step
function tbModifier:Step(modifier, npc, dt)

if World.DaySecond <=150 or World.DaySecond >= 450 then
local fabaos = npc.Equip:FindFabao()
	for _,fabao in pairs(fabaos) do
		if fabao.Fabao.OitemDef.Name == "LQDX_MiBao_YinYangHuan" then 
		npc:RemoveModifier("LQDX_MiBao_ZMH_Day")
		fabao.Fabao.AbilityDatas:RemoveAt(fabao.Fabao.AbilityDatas.Count-1);
		fabao.Fabao.AbilityDatas:RemoveAt(fabao.Fabao.AbilityDatas.Count-1);
		npc:AddModifier("LQDX_MiBao_ZMH_Night")
		end
	end
	
end	
end

--离开modifier
function tbModifier:Leave(modifier, npc)
end


function tbModifier:UpdateStack(modifier, npc, add)
	
end
function LQDX.FHF_XRL(modifier, npc, add)
	
end

--获取存档数据
function tbModifier:OnGetSaveData()
end

--载入存档数据
function tbModifier:OnLoadData(modifier, npc, tbData)
  --self.duration = 0
end