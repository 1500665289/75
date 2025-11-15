local tbTable = GameMain:GetMod("MagicHelper");
local tbMagic = tbTable:GetMagic("LQDX_FSTB");



function tbMagic:EnableCheck(npc)
	if npc.LuaHelper:GetGongName() == "Gong_32" and npc:GetFirstAtkFabao() ~= null then
	return true;
	else
	return false;
	end
end

function tbMagic:TargetCheck(key, t)	
		return true;
end

function tbMagic:MagicEnter(IDs, IsThing)
	self.targetId = IDs[0];
	WorldLua:PlayEffect("Effect/gsq/Zhen/skill/fx_ZhuXianJianZhenCaster",self.bind.Key, self.magic.Param1)
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
		local myfabao = zj:GetFirstAtkFabao()
		local name = myfabao:GetName();
		local random = zj.LuaHelper:RandomFloat(1,1.4);
		local prename = {"神","灵","冥","情","龙","天","幽","仙","君","泣","鬼","焚","殇","凶","羽","璃","星","风","秀","焱","帝","狂"}
		local random2 = zj.LuaHelper:RandomInt(1,#prename);
		local TW = myfabao.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.TailLenght)
		local GS = myfabao.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.AttackRate)
		local GJ = myfabao.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.AttackPower)
		local JT = myfabao.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.KnockBackAddition)
		local HL = myfabao.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.LingRecover)
		local LX = myfabao.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.MaxLing)
		local KT = myfabao.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.KnockBackResistance)
		local FS = myfabao.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.FlySpeed)
		local RS = myfabao.Fabao:GetProperty(CS.XiaWorld.Fight.g_emFaBaoP.RotSpeed)
		local RATE1 = is_limit(target.Rate)
		local RATE2 = is_limit(myfabao.Rate)
		
	if target ~= nil then
		zj.LuaHelper:AddModifier("LQDX_fstbhm")
		target.Rate = RATE1 + 2;
		myfabao.Rate = RATE2 + 2;
		zj.LuaHelper:TriggerStory("LQDX_fstbem")
		myfabao:SetName(""..prename[random2].."·"..name.."");
	local data ={Kind = CS.XiaWorld.Fight.g_emFabaoSpecialAbility.FlyDamageAddP,Desc = "天神之兵",fParam1= 0};
		myfabao.Fabao:AddAbilityData(data);
		myfabao:BindItem2Npc(zj)
		myfabao.Fabao:SetProperty(CS.XiaWorld.Fight.g_emFaBaoP.KnockBackResistance,KT*random)
		myfabao.Fabao:SetProperty(CS.XiaWorld.Fight.g_emFaBaoP.LingRecover,HL*random)
		myfabao.Fabao:SetProperty(CS.XiaWorld.Fight.g_emFaBaoP.MaxLing,LX*random)
		myfabao.Fabao:SetProperty(CS.XiaWorld.Fight.g_emFaBaoP.FlySpeed,FS*random)
		myfabao.Fabao:SetProperty(CS.XiaWorld.Fight.g_emFaBaoP.RotSpeed,RS*random)
		myfabao.Fabao:SetProperty(CS.XiaWorld.Fight.g_emFaBaoP.AttackPower,GJ*random)
		myfabao.Fabao:SetProperty(CS.XiaWorld.Fight.g_emFaBaoP.KnockBackAddition,JT*random)
		myfabao.Fabao:SetProperty(CS.XiaWorld.Fight.g_emFaBaoP.TailLenght,TW*random)
		myfabao.Fabao:SetProperty(CS.XiaWorld.Fight.g_emFaBaoP.AttackRate,GS/random)
		
		end
	end
end