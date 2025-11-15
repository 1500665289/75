local tbTable = GameMain:GetMod("MagicHelper");
local tbMagic = tbTable:GetMagic("LQDX_ZTB");



function tbMagic:EnableCheck(npc)
	if npc.LuaHelper:GetGongName() == "Gong_32" then
	return true;
	else
	return false;
	end
end

function tbMagic:TargetCheck(key, t)
	if t.IsFaBao == true and t.Rate >= 9 and t.Fabao.OitemDef.Item.Lable == g_emItemLable.Weapon   then
	return true;
	else
	return false;
	end
end

function tbMagic:MagicEnter(IDs, IsThing)
	self.targetId = IDs[0];
	local target = ThingMgr:FindThingByID(self.targetId);
	WorldLua:PlayEffect(89,target.Key, self.magic.Param1)
end

function tbMagic:MagicStep(dt, duration)	
	self:SetProgress(duration/self.magic.Param1);
	if duration >=self.magic.Param1  then
		return 1;	
	end
	return 0;
end
function is_limit(num1)

   if (num1 > 24) then
      result = 24;
   else
      result = num1;
   end

   return result; 
end
function tbMagic:MagicLeave(success)
	if success == true then	
		world:SetRandomSeed();	
		local target = ThingMgr:FindThingByID(self.targetId);
		local zj = self.bind
		local TW = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.TailLenght)
		local GS = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.AttackRate)
		local GJ = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.AttackPower)
		local JT = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.KnockBackAddition)
		local HL = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.LingRecover)
		local LX = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.MaxLing)
		local KT = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.KnockBackResistance)
		local FS = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.FlySpeed)
		local RS = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.RotSpeed)
		local TJ = target.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.Scale)
		local RATE1 = is_limit(target.Rate)
		local name = target.Fabao.OitemDef.Name;
		local name2 = target.Fabao.OName;
		local name3 = target.m_szName
		local kb = (GJ/10+5)^0.5
	if target ~= nil then
		WorldLua:PlayEffect(400005,target.Key, 5)
		local item =CS.XiaWorld.ItemRandomMachine.RandomItem(name,nil,6,6,100);
		item.Rate = RATE1;
		item:SetName(target:GetName())
		item:AddEquiptData("BodyPractice_SuperPartAddp_AtkPower",(TJ/4+1)*RATE1*kb/200,0)
		item:AddEquiptData("BodyPratice_SuperPartCostAddP",TJ/3-1/3,0)
		if string.find(name,"Knife") ~= nil or string.find(name2,"刀") ~= nil then
		item:AddEquiptData("NpcFight_BaseDodgeChance",0,kb*(RS/FS-1)^0.5/100)
		item:AddEquiptData("MoveSpeed",kb/TJ,0)
		item:AddEquiptData("BodyPractice_SuperPartAddp_ArmorPenetration",0,-kb*LX/HL/200)
			
		end
		if string.find(name,"Sword") ~= nil  or string.find(name2,"剑") ~= nil then
		item:AddEquiptData("BodyPractice_SuperPartAddv_AtkPower",(kb-2)^4*300*(JT/10+1),0)
		item:AddEquiptData("BodyPractice_SuperPartAddp_AtkRate",kb*(1+GS)/10,0)
		item:AddEquiptData("BodyPractice_SuperPartAddp_CatchFabao",-kb*KT/300*TW^0.5,0)
			
		end
		if string.find(name,"Lance") ~= nil  or string.find(name2,"枪") ~= nil then
		item:AddEquiptData("BodyPractice_SuperPartAddp_ArmorPenetration",0,kb*LX/HL/100)
		item:AddEquiptData("BodyPractice_AngerFireEffectAddp",0,kb*HL/LX/2)
		item:AddEquiptData("NpcFight_BaseDodgeChance",0,-kb*(RS/FS-1)^0.5/100)
			
		end
		if string.find(name,"Halbert") ~= nil  or string.find(name2,"锤") ~= nil then
		item:AddEquiptData("BodyPractice_SuperPartAddv_DefPower",(kb-2)^4*300*(JT/10+1),0)
		item:AddEquiptData("BodyPractice_SuperPartAddp_AtkRate",0,-kb*(1+GS)/15)
		item:AddEquiptData("BodyPractice_SuperPartAddp_DefRate",0,kb*TJ*(KT/10+1)/50)
			
		end
		if string.find(name,"Ring") ~= nil  or string.find(name2,"环") ~= nil then
		item:AddEquiptData("BodyPractice_SuperPartAddp_CatchFabao",0,kb*KT/200*TW^0.5)
		item:AddEquiptData("BodyPratice_SuperPartRecoverAddP",0,kb*HL/LX/10)
		item:AddEquiptData("BodyPractice_SuperPartAddp_DefRate",0,-kb*TJ*(KT/10+1)/70)
			
		end
		ThingMgr:RemoveThing(target,false,true)
		zj.map:DropItem(item,zj.Key, true, true, false, false, 0, false, false);
		item:SetName(name3)
		end
	end
end