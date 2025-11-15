local tbTable = GameMain:GetMod("MagicHelper");
local tbMagic = tbTable:GetMagic("LQDX_WXLS");



function tbMagic:EnableCheck(npc)
	if npc.LuaHelper:GetGongName() == "Gong_32" then
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

function is_sss(num1)

   if (num1 > 0.4) then
      result = 0.4;
   else
      result = num1;
   end

   return result; 
end
function tbMagic:MagicStep(dt, duration)	
	self:SetProgress(duration/self.magic.Param1);
	if duration >=self.magic.Param1  then
		return 1;	
	end
	return 0;
end
function setp(efb,mb,Par1)
	local fbp = mb.Fabao:GetProperty(efb)
	mb.Fabao:SetProperty(efb,fbp*Par1)
end
function tbMagic:MagicLeave(success)
	if success == true then	
		world:SetRandomSeed();	
		local target = ThingMgr:FindThingByID(self.targetId);
		local zj = self.bind
		local QH_cs = 3
		local QH_jc = is_sss(zj.LuaHelper:GetProperty("FabaoMake_TwelveRateChance")/5)
		local fbsx = {
		CS.XiaWorld.Fight.g_emFaBaoP.TailLenght,
		CS.XiaWorld.Fight.g_emFaBaoP.AttackPower,
		CS.XiaWorld.Fight.g_emFaBaoP.KnockBackAddition,
		CS.XiaWorld.Fight.g_emFaBaoP.LingRecover,
		CS.XiaWorld.Fight.g_emFaBaoP.MaxLing,
		CS.XiaWorld.Fight.g_emFaBaoP.KnockBackResistance,
		CS.XiaWorld.Fight.g_emFaBaoP.FlySpeed,
		CS.XiaWorld.Fight.g_emFaBaoP.RotSpeed,
		CS.XiaWorld.Fight.g_emFaBaoP.Scale
		}
		if QH_cs > 0 then 
		local random = zj.LuaHelper:RandomFloat(0.8+QH_jc,1.2);
		local random1 = zj.LuaHelper:RandomInt(1,10)
		setp(fbsx[random1],target,random)
		end
		if QH_cs > 1 then 
		local random2 = zj.LuaHelper:RandomFloat(0.8+QH_jc,1.2);
		local random3 = zj.LuaHelper:RandomInt(1,10)
		setp(fbsx[random3],target,random2)
		end
		if QH_cs > 2 then 
		local random4 = zj.LuaHelper:RandomFloat(0.8+QH_jc,1.2);
		local random5 = zj.LuaHelper:RandomInt(1,10)
		setp(fbsx[random5],target,random4)
		end
	
		CS.Wnd_Message.Show(nil,1,nil,true,"五行炼神决成功！",0,0,"")
		
	end
end