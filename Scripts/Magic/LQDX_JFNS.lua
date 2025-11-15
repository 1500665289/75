local tbTable = GameMain:GetMod("MagicHelper");
local tbMagic = tbTable:GetMagic("LQDX_JFNS");



function tbMagic:EnableCheck(npc)
	return true;
end


function tbMagic:TargetCheck(key, t)	
	if t.FSItemState == 1 or t.FSItemState == 2 or t.FSItemState == 3 then
		return true;
	else
		return false;
	end
end

function tbMagic:MagicEnter(IDs, IsThing)
	self.targetId = IDs[0];
end

function tbMagic:MagicStep(dt, duration)	
	self:SetProgress(duration/self.magic.Param1);
	if duration >=self.magic.Param1  then
		return 1;	
	end
	return 0;
end

function tbMagic:MagicLeave(success)
	if success == true then		
		world:SetRandomSeed();	
		local target = ThingMgr:FindThingByID(self.targetId);
		local zj = self.bind
		local DH = zj.LuaHelper:GetDaoHang()
		local random = zj.LuaHelper:RandomInt(1,10);
		local ra = target.Rate
		if target ~= nil then
			if random == 1 then 
			zj.PropertyMgr.SkillData:AddSkillLevelOverAddion(CS.XiaWorld.g_emNpcSkillType.Fabao,1)
		CS.Wnd_Message.Show(nil,1,nil,true,"汲风纳水成功",0,0,"御器等级上升")
			elseif random == 2 then 
			zj.PropertyMgr.SkillData:AddSkillLevelOverAddion(CS.XiaWorld.g_emNpcSkillType.Fight,1)
		CS.Wnd_Message.Show(nil,1,nil,true,"汲风纳水成功",0,0,"战斗等级上升")
			elseif random == 3 then 
			zj.PropertyMgr.SkillData:AddSkillLevelOverAddion(CS.XiaWorld.g_emNpcSkillType.Qi,1)
		CS.Wnd_Message.Show(nil,1,nil,true,"汲风纳水成功",0,0,"气感等级上升")
			elseif random == 4 then 
			zj.PropertyMgr.SkillData:AddSkillLevelOverAddion(CS.XiaWorld.g_emNpcSkillType.SocialContact,1)
		CS.Wnd_Message.Show(nil,1,nil,true,"汲风纳水成功",0,0,"处世等级上升")
			elseif random == 5 then 
			zj.PropertyMgr.SkillData:AddSkillLevelOverAddion(CS.XiaWorld.g_emNpcSkillType.Art,1)
		CS.Wnd_Message.Show(nil,1,nil,true,"汲风纳水成功",0,0,"雅艺等级上升")
			elseif random == 6 then 
			zj.PropertyMgr.SkillData:AddSkillLevelOverAddion(CS.XiaWorld.g_emNpcSkillType.FightSkill,1)
		CS.Wnd_Message.Show(nil,1,nil,true,"汲风纳水成功",0,0,"术法等级上升")
			elseif random == 7 then 
			zj.PropertyMgr.SkillData:AddSkillLevelOverAddion(CS.XiaWorld.g_emNpcSkillType.Barrier,1)
		CS.Wnd_Message.Show(nil,1,nil,true,"汲风纳水成功",0,0,"护体等级上升")
			elseif random == 8 then 
			zj.PropertyMgr.SkillData:AddSkillLevelOverAddion(CS.XiaWorld.g_emNpcSkillType.Zhen,1)
		CS.Wnd_Message.Show(nil,1,nil,true,"汲风纳水成功",0,0,"阵法等级上升")
			elseif random == 9 then 
			zj.PropertyMgr.SkillData:AddSkillLevelOverAddion(CS.XiaWorld.g_emNpcSkillType.Manual,1)
		CS.Wnd_Message.Show(nil,1,nil,true,"汲风纳水成功",0,0,"炼器等级上升")
			elseif random == 10 then
			zj.PropertyMgr.SkillData:AddSkillLevelOverAddion(CS.XiaWorld.g_emNpcSkillType.Medicine,1) 
		CS.Wnd_Message.Show(nil,1,nil,true,"汲风纳水成功",0,0,"炼丹等级上升")
			end
			zj.PropertyMgr.Practice:AddTreeExp(ra*ra*1000+DH*DH*10)
			zj.PropertyMgr:ModifierProperty("NpcLingMaxValue",0,0,-99,0);
			target.FSItemState = 0
			CS.GameWatch.Instance:PlayUIAudio("Sound/ding");
		end
	end
end
