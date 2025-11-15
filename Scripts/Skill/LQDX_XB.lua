--自爆金丹脚本
local tbTable = GameMain:GetMod("_SkillScript")
local tbSkill = tbTable:GetSkill("LQDX_XB")


--技能被释放
function tbSkill:Cast(skilldef, from)

	CS.WorldLuaHelper():CameraShake(1.5,1.8);
	local fabao = from:GetFirstAtkFabao() 
	from.Equip:UnEquipItem(fabao, false) 
  	ThingMgr:RemoveThing(fabao, true, false) --移除这个法宝。
	--local skillDef = FightMgr:GetSkillDef("")
	
end

--技能在key点生效
function tbSkill:Apply(skilldef, key, from)
	--print(1)
	
end

--技能在fightbody身上生效
function tbSkill:FightBodyApply(skilldef, fightbody, from)
	fightbody.Npc.LuaHelper:AddModifier("LQDX_xb_debuff")
	
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