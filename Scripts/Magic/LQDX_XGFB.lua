local tbTable = GameMain:GetMod("MagicHelper");
local tbMagic = tbTable:GetMagic("LQDX_XGFB");



function tbMagic:EnableCheck(npc)
	if npc.LuaHelper:GetGongName() == "Gong_32" and npc.PropertyMgr.Practice.GongStateLevel ~= CS.XiaWorld.g_emGongStageLevel.God2 then
	return true;
	else
	return false;
	end
end

function tbMagic:TargetCheck(key, t)	
	if t.IsFaBao == true then
		return true;
	else
		return false;
	end
end

function tbMagic:MagicEnter(IDs, IsThing)
	self.targetId = IDs[0];
end

function tbMagic:MagicStep(dt, duration)
	CS.MapRender.Instance:Strike(self.bind.Key);
	self:SetProgress(duration/self.magic.Param1);
	if duration >=self.magic.Param1  then
		return 1;	
	end
	return 0;
end
function is_shen(num1)

   if (num1 > 12) then
      result = num1-12;
   else
      result = 0;
   end

   return result; 
end
function tbMagic:MagicLeave(success)
	if success == true then	
		world:SetRandomSeed();	
		local target = ThingMgr:FindThingByID(self.targetId);
		local zj = self.bind
		local random = zj.LuaHelper:RandomFloat(0.8,1.2);
		local TW = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.TailLenght)
		local GS = 1/target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.AttackRate)
		local GJ = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.AttackPower)
		local JT = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.KnockBackAddition)
		local HL = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.LingRecover)
		local LX = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.MaxLing)
		local KT = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.KnockBackResistance)
		local RATE = target.Rate
		local BRate = is_shen(RATE)
		local EK = target.ElementKind
		local EK_N = 0;
		if EK == CS.XiaWorld.g_emElementKind.Jin then 
			EK_N = 1;
		elseif EK == CS.XiaWorld.g_emElementKind.Mu then 
			EK_N = 2;
		elseif EK == CS.XiaWorld.g_emElementKind.Shui then 
			EK_N = 3;
		elseif EK == CS.XiaWorld.g_emElementKind.Huo then 
			EK_N = 4;
		elseif EK == CS.XiaWorld.g_emElementKind.Tu then 
			EK_N = 5;
		end
	if target ~= nil then
		if EK_N == 0 then 
		local p1 = math.floor(RATE*RATE*GJ*random/8)
		local p2 = math.floor(BRate*GJ*random*93)
		local p3 = math.floor(RATE*random*100)
		local p4 = "人物灵气增加"..(p1).."%\n人物法宝威力减少"..(p3).."%\n人物法宝灵力减少"..(p3).."%\n人物法宝灵力回复减少"..(p3).."%\n人物法宝攻击间隔增加"..(p3).."%\n人物灵气强度减少"..(p3).."%\n修为增加"..(RATE*10000*random)
		zj.PropertyMgr:ModifierProperty("NpcLingMaxValue",0,p1/100,p2/100,0);
		zj.PropertyMgr:ModifierProperty("NpcFight_FabaoPowerAddP",0,-p3/200,0,0);
		zj.PropertyMgr:ModifierProperty("NpcFight_FabaoMaxLingAddP",0,-p3/300,0,0);
		zj.PropertyMgr:ModifierProperty("NpcFight_FabaoLingRecoverAddP",0,-p3/400,0,0);
		zj.PropertyMgr:ModifierProperty("NpcFight_FabaoCoolDownAddP",p3/5000,0,0,0);
		zj.PropertyMgr:ModifierProperty("NpcFight_ShieldConversionRateAddP",-p3/2000,0,0,0);
		CS.Wnd_Message.Show(nil,1,nil,true,"析构法宝——无.成功",0,0,p4)
		end
		if EK_N == 1 then 
		local p1 = math.floor(RATE*RATE*GJ*GJ*random/600)
		local p2 = math.floor(BRate*GJ*GJ*random/100000)
		local p3 = math.floor(RATE*random*10)
		local p4 = "人物法宝威力增加"..(p1).."%\n人物灵气强度减少"..(p3).."%\n修为增加"..(RATE*10000*random)
		zj.PropertyMgr:ModifierProperty("NpcFight_FabaoPowerAddP",p1/100,0,0,p2/100);
		zj.PropertyMgr:ModifierProperty("NpcFight_ShieldConversionRateAddP",-p3/100,0,0,0);
		CS.Wnd_Message.Show(nil,1,nil,true,"析构法宝——金.成功",0,0,p4)
		end
		if EK_N == 2 then 
		local p1 = math.floor(RATE*RATE*GJ*LX*random/25000)
		local p2 = math.floor(BRate*GJ*LX*random/30000)
		local p3 = math.floor(RATE*random*50)
		local p4 = "人物法宝灵力增加"..(p1).."%\n人物灵气减少"..(p3).."%\n修为增加"..(RATE*10000*random)
		zj.PropertyMgr:ModifierProperty("NpcFight_FabaoMaxLingAddP",0,p1/100,0,p2/100);
		zj.PropertyMgr:ModifierProperty("NpcLingMaxValue",0,-p3/100,0,0);
		CS.Wnd_Message.Show(nil,1,nil,true,"析构法宝——木.成功",0,0,p4)
		end
		if EK_N == 3 then 
		local p1 = math.floor(RATE*RATE*GJ*HL*random/10000)
		local p2 = math.floor(BRate*GJ*HL*random/20000)
		local p3 = math.floor(RATE*random*100)
		local p4 = "人物法宝灵力回复增加"..(p1).."%\n人物法宝威力减少"..(p3).."%\n修为增加"..(RATE*10000*random)
		zj.PropertyMgr:ModifierProperty("NpcFight_FabaoLingRecoverAddP",0,p1/100,0,p2/100);
		zj.PropertyMgr:ModifierProperty("NpcFight_FabaoPowerAddP",0,-p3/100,0,0);
		CS.Wnd_Message.Show(nil,1,nil,true,"析构法宝——水.成功",0,0,p4)
		end
		if EK_N == 4 then 
		local p1 = math.floor(RATE*RATE*GJ*GS*random/1000)
		local p2 = math.floor(BRate*GJ*GS*random/40)
		local p3 = math.floor(RATE*random*50)
		local p4 = "人物法宝攻击间隔减少"..(p1).."%\n人物法宝灵力回复减少"..(p3).."%\n人物法宝灵力减少"..(p3).."%\n修为增加"..(RATE*10000*random)
		zj.PropertyMgr:ModifierProperty("NpcFight_FabaoLingRecoverAddP",0,-p3/100,0,0);
		zj.PropertyMgr:ModifierProperty("NpcFight_FabaoMaxLingAddP",0,-p3/100,0,0);
		zj.PropertyMgr:ModifierProperty("NpcFight_FabaoCoolDownAddP",-p1/100,0,0,0);
		zj.PropertyMgr:ModifierProperty("NpcFight_SpellPowerAddP",0,0,0,p2/100);
		CS.Wnd_Message.Show(nil,1,nil,true,"析构法宝——火.成功",0,0,p4)
		end
		if EK_N == 5 then 
		local p1 = math.floor(RATE*RATE*GJ*JT*KT*random/400)
		local p2 = math.floor(BRate*GJ*JT*KT*random/20)
		local p3 = math.floor(RATE*random*3)
		local p4 = "人物灵气强度增加"..(p1).."%\n人物法宝攻击间隔增加"..(p3).."%\n修为增加"..(RATE*10000*random)
		zj.PropertyMgr:ModifierProperty("NpcFight_ShieldConversionRateAddP",p1/100,0,0,0);
		zj.PropertyMgr:ModifierProperty("NpcFight_FabaoCoolDownAddP",p3/100,0,0,0);
		zj.PropertyMgr:ModifierProperty("AbilityLvAddV",-p2,0,0,0);
		CS.Wnd_Message.Show(nil,1,nil,true,"析构法宝——土.成功",0,0,p4)
		end
		target:AddLing(99999)
		zj.Bag.m_lisItems:Add(target);
		zj.PropertyMgr.Practice:AddPractice(RATE*10000*random)
		zj.PropertyMgr:ModifierProperty("NeckCountdownAddV",-99999,0,0,0);
		ThingMgr:RemoveThing(target, true, false) --移除这个法宝。
		end
	end
end