--万剑归宗
local tbTable = GameMain:GetMod("_SkillScript")
local tbSkill = tbTable:GetSkill("LQDX_WJGZ")


--技能被释放
function tbSkill:Cast(skilldef, from)
local fabaos = from.Bag.m_lisItems
for _,fabao in pairs(fabaos) do
if  fabao.IsFaBao and fabao.Fabao.IsFighting == 0 then
from.FightBody:CastFaboFromBag(fabao,CS.XiaWorld.Fight.g_emFaBaoMode.None);
end
end
	--local skillDef = FightMgr:GetSkillDef("")
	
end

--技能在key点生效
function tbSkill:Apply(skilldef, key, from)
	--print(1)
	
end

--技能在fightbody身上生效
function tbSkill:FightBodyApply(skilldef, fightbody, from)
	
end

--技能产生的子弹在pos点爆炸
function tbSkill:MissileBomb(skilldef, pos, from)	

end

--数值加值
function tbSkill:GetValueAddv(skilldef, fightbody, from)
  return 0
end

--飞行检测
function tbSkill:FlyCheck(skilldef, keys, from)
	return 0
end