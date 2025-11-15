

--以下内容请不要修改。
local LQDX = GameMain:NewMod("LQDX")
LQDX.Events = LQDX.Events or {}
local Events = LQDX.Events
local tbEvent = GameMain:GetMod("_Event");

function LQDX:OnBeforeInit()
end

function LQDX:OnInit()
  
	--print("32000")
	if world:GetWorldFlag(3200) ~= 1 then 
	--print("32001")
	world:ShowMsgBox("欢迎使用炼器大修mod，在游戏中按f10可以查看介绍","mod作者的留言")
	for i = 1, world:RandomInt(6,12) do
		world:AddDaNeng("DaNeng_SpDropList","TongYong_DropList","TongYong_DropList","TongYong_DropList","TongYong_DropList","TongYong_DropList","TongYong_DropList","TongYong_DropList","TongYong_DropList","TongYong_DropList","TongYong_DropList","TongYong_DropList","DaNeng_ZhengFa_EsotericDropList","DaNeng_GodPractice");
	end
	world:SetWorldFlag(3200,1)
  end
  --注册敌人增强事件。
  GameMain:GetMod("_Event"):RegisterEvent(CS.XiaWorld.g_emEvent.AddEnemies, self.Events.HandleAddEnemies, "LQDX_HandleAddEnemies")
  print("注册敌人法宝增强事件")
  --GameMain:GetMod("_Event"):RegisterEvent(g_emEvent.EquipUpdate, self.Events.HandleEquipUpdate, "LQDX_HandleEquipUpdate")
   --print("注册法宝更新事件")
	print("LQDX开始监听事件！")
	--GameMain:GetMod('_Event'):RegisterEvent(g_emEvent.FabaoHitFabao, function(e, Npc, Obj) GameMain:GetMod("LQDX"):FabaoHitFabao_Event(e, Npc, Obj); end, "LQDX_FabaoHitFabao");
end
function LQDX:OnEnter() 
end
function LQDX:FabaoHitFabao_Event(e, Npc, Obj)
	
end


function Events.WillOnFightBodyBeHit(data, npc, objs)

	if objs[2] ~= nil then
	local from = objs[2];
	--from是攻击者
	--npc是被击者
		if from.PropertyMgr:HasModifier("Dan_BasePracticeDrug") and from.GongKind == CS.XiaWorld.g_emGongKind.Dao then  --判定攻击者拥有buff则,建议不要是仙修，因为法宝也会触发。。。。。
			local a = 44 --或者string,这个是特效编号或路径
			local b = from.Key -- 坐标
			local c = 5 --持续时间
			WorldLua:PlayEffect(a,b, c) --播放特效
		end
	end
end

function Events.HandleAddEnemies(data, thing, objs)
  local npcs = objs[0]
  local powerlevel = objs[1]
  local basescore = CS.XiaWorld.SchoolMgr.Instance.Score
  local modifis = {"Ling","Shield","FabaoAtk","FabaoLing","FabaoSpeed","FabaoMiao","FabaoNum","FightSkillAtk","FightSkillCD"}
		local array = {"Item_WeaponKnife0","Item_WeaponKnife1","Item_WeaponKnife2","Item_WeaponLance0","Item_WeaponLance1","Item_WeaponLance2","Item_WeaponSword0","Item_WeaponSword1","Item_WeaponSword2","Item_WeaponHalbert0","Item_WeaponHalbert1","Item_WeaponHalbert2","Item_WeaponAxeRing0","Item_WeaponAxeRing1","Item_WeaponAxeRing2","Item_SysAcupuncture","Item_Dice","Item_SmallBell","Item_Bracelet"}
  local rate = math.floor(basescore / 1000)
			
  for _,npc in pairs(npcs) do
  if npc.GongKind == CS.XiaWorld.g_emGongKind.Dao then 
		local random = world:RandomInt(1,10);
        if rate*random > 50 then 
			local random2 =npc.LuaHelper:RandomInt(1,10);
			string2 = "Modifier_SpNpc_"..modifis[random2]
		npc.LuaHelper:AddModifier(string2)
		end
		local random3 = npc.LuaHelper:RandomInt(1,rate);
		if rate >= 9 then 
			rate = 9;
		end
        local fabaos = npc.Equip:FindFabao()
		
        for _,fabao in pairs(fabaos) do
		world:SetRandomSeed();
			--print("装备新法宝。")
			
			local random1 =world:RandomInt(1,19);	
			string1 = array[random1];
			local rater = npc.LuaHelper:RandomInt(rate,rate+4);
			local newfabao = CS.XiaWorld.ItemRandomMachine.RandomFabao( g_emItemLable.FightFabao, 0, 12, 1, nil, nil, rater, true);
		 -- local newfabao = CS.XiaWorld.ItemRandomMachine.RandomItem(CS.XiaWorld.g_emItemLable.FightFabao,rate-3,rate+3,100);
		if random3 > 30 then 
			newfabao = CS.XiaWorld.ItemRandomMachine.RandomFabao( g_emItemLable.FightFabao, 0, 12, 1, string1, nil, rater, true);
		end 
			npc.Equip:UnEquipItem(fabao, false) 
			ThingMgr:RemoveThing(fabao, true, false) 
			--print("移除这个法宝。")
			npc:EquipItem(newfabao) 
			--print("装备新法宝。")
       end
    
    --最后我们把灵气和法宝灵气全部补满。
    npc:AddLing(npc.MaxLing)
    local fabaos = npc.Equip:FindFabao()
		for _,fabao in pairs(fabaos) do
		fabao:AddLing(fabao.MaxLing)
		end
	end
  end
end