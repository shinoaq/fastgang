script_name ("fast gang")
script_version ("09.05.2019")

function _()
	return 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
end

local key = require 'vkeys'
local imgui = require 'imgui'
local encoding = require 'encoding'
local main_window_state = imgui.ImBool(false)
local bEnable = imgui.ImBool(false)
local bBuy = false
local bPaused = false
local tScore = {}
local iBuffers_score = {}

encoding.default = 'CP1251'
u8 = encoding.UTF8

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end
	autoupdate("https://raw.githubusercontent.com/shinoaq/fastgang/master/version.json?token=AKNXPZMWURBYZNO3EEBI3PS42PVQ6", '['..string.upper(thisScript().name)..']: ', "vk.com/id1")
	repeat
		wait(0)
	until sampIsLocalPlayerSpawned()
	sampAddChatMessage("fast gang loaded /{FFFFFF} developed by shinoa ", 0xff0000)
	sampRegisterChatCommand('eat1', function() eda = true end)
	sampRegisterChatCommand("beer1", function() drink1 = true end)
	sampRegisterChatCommand("sprunk1", function() drink2 = true end)
	sampRegisterChatCommand("fill", function () toggle = true end)
	sampRegisterChatCommand("ak", ak) 
	sampRegisterChatCommand("m4", m4) 
	sampRegisterChatCommand("de", de)
	sampRegisterChatCommand("sh", shot) 
	sampRegisterChatCommand("ri", ri) 
	sampRegisterChatCommand("sm", smg) 
	sampRegisterChatCommand("sn", sn) 
	sampRegisterChatCommand("uzi", uzi)
	sampRegisterChatCommand("fix", fixcar)
	sampRegisterChatCommand("us", usedrugs)
	sampRegisterChatCommand("hl", usemed)
	sampRegisterChatCommand("ar", adrenaline)
	sampRegisterChatCommand("cmd", function () main_window_state.v = not main_window_state.v end)
	sampRegisterChatCommand("/dd", function() bEnable.v = not bEnable.v end)
	while true do
		wait(0)
		
			resid, pid = sampGetPlayerIdByCharHandle(PLAYER_PED)  -- получения ника для вывода инфы юзания пива/спранка
			pname = sampGetPlayerNickname(pid)
			
			imgui.Process = bEnable.v or main_window_state.v
			
		 if toggle then
			toggle = not toggle
			sampSendChat("/fill")
			while not sampTextdrawIsExists(2071) do
		wait(0)
		end
			sampSendClickTextdraw(2071)
			while not sampTextdrawIsExists(27) do
		wait(0)
		end
		wait(600)
			sampSendClickTextdraw(29)
		end
		 
		if eda then
			eda = not eda
			sampSendClickTextdraw(595)
		end
		if drink1 then
			drink1 = not drink1
			sampSendClickTextdraw(593)
			sampSendClickTextdraw(593)
			sampAddChatMessage(''.. pname.. ' выпил(а) бутылку пива', 0xC2A2DA)
		end
		if drink2 then
			drink2 = not drink2
			sampAddChatMessage (''.. pname.. ' выпил(а) банку спранка', 0xC2A2Da)
			for k = 0, 20 do
			sampSendClickTextdraw(591)
			end
		end
	end
	wait(-1)
end

local amount, gun

local tab = {
	de = 0,
	shot = 1,
	smg = 2,
	m4 = 3,
	ak = 4,
	ri = 5,
	sn = 6,
	uzi = 7
}

function cr(num, name)
	if num then
		amount = num
		gun = tab[name]
		sampSendChat('/creategun')
	end
end

function de(num)
	cr(num, 'de')
end

function smg(num)
	cr(num, 'smg')
end

function m4(num)
	cr(num, 'm4')
end

function ak(num)
	cr(num, 'ak')
end

function ri(num)
	cr(num, 'ri')
end

function sn(num)
	cr(num, 'sn')
end

function uzi(num)
	cr(num, 'uzi')
end

function shot(num)
	cr(num, 'shot')
end

local fix

function fixcar(name)
	if name and name ~= '' then
		fix = name
		sampSendChat('/cars')
	end
end

function apply_custom_style()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
	style.WindowRounding = 1.5
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
	style.ChildWindowRounding = 1.5
	style.FrameRounding = 1.0
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0
	style.WindowPadding = imgui.ImVec2(4.0, 4.0)
	style.FramePadding = imgui.ImVec2(2.5, 3.5)
	style.ButtonTextAlign = imgui.ImVec2(0.02, 0.4)

    colors[clr.FrameBg]                = ImVec4(0.48, 0.16, 0.16, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.98, 0.26, 0.26, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.98, 0.26, 0.26, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.48, 0.16, 0.16, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.48, 0.16, 0.16, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.48, 0.16, 0.16, 1.00)
    colors[clr.CheckMark]              = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.88, 0.26, 0.24, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.Button]                 = ImVec4(0.98, 0.26, 0.26, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.98, 0.06, 0.06, 1.00)
    colors[clr.Header]                 = ImVec4(0.98, 0.26, 0.26, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.98, 0.26, 0.26, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.75, 0.10, 0.10, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.75, 0.10, 0.10, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.98, 0.26, 0.26, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.98, 0.26, 0.26, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.98, 0.26, 0.26, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.98, 0.26, 0.26, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end
apply_custom_style()

function imgui.OnDrawFrame()
	if main_window_state.v then
	local sw, sh = getScreenResolution()
        imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(512, 287), imgui.Cond.FirstUseEver)
    imgui.Begin('Commands', main_window_state, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoMove)
    imgui.Text(u8('/eat1 - Пополнить сытость'))
		imgui.SameLine()
        imgui.TextQuestion(u8('Текст использования виден лишь тебе'))
	imgui.Text(u8('/sprnuk1 - Пополнить HP спранком'))
		imgui.SameLine()
        imgui.TextQuestion(u8('Текст использования виден лишь тебе'))
	imgui.Text(u8('/beer1 - Пополнить HP пивом'))
		imgui.SameLine()
        imgui.TextQuestion(u8('Текст использования виден лишь тебе'))
	imgui.Text(u8('/fix carname - Быстрый спавн личного Т/С'))
		imgui.SameLine()
        imgui.TextQuestion(u8('Регистр не учитывается\nДостаточно первых букв названия авто'))
	imgui.Text(u8('Сокращенные команды:\n/us - Употребить наркотики\n/ar - Употребить адреналин\n/hl - Использовать аптечку\n/de - Deagle\n/sh - Shotgun\n/m4 - M4\n/ak - AK-47\n/ri - Rifle\n/sn - Sniper\n/uzi - UZI\n/sm - MP5'))
		imgui.SameLine(150)
        imgui.TextQuestion(u8('Через пробел указывать количество'))
	imgui.Text(u8('Автоматические функции:'))
		imgui.SameLine()
	imgui.Text(u8('SkipReportDialog'))
		imgui.SameLine()
		imgui.TextQuestion(u8('Отключает окно ответа репорта'))
		imgui.SameLine()
	imgui.Text(u8('AntiFreeze'))
		imgui.SameLine()
		imgui.TextQuestion(u8('Отсутствие фриза при входе/выходе из интерьера'))
		imgui.SameLine()
	imgui.Text(u8('Auto-Fill'))
		imgui.SameLine()
		imgui.TextQuestion(u8('Автоматическая заправка транспорта на АЗС'))
		imgui.SameLine()
	imgui.Text(u8('Auto-Buy'))
		imgui.SameLine()
		imgui.TextQuestion(u8('Автоматическая закупка вещей в 24/7 или АЗС'))
	imgui.End()
	end
	if bEnable.v then
        imgui.SetNextWindowPos(imgui.ImVec2(convertGameScreenCoordsToWindowScreenCoords(1.8740849494934, 133.58332824707)), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.Begin("Auto-Buy", bEnable, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.AlwaysAutoResize + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoMove + imgui.WindowFlags.NoFocusOnAppearing)
        for k, v in pairs(tScore) do
            imgui.PushItemWidth(100)
            imgui.InputInt(u8(v), iBuffers_score[k])
            imgui.PopItemWidth()
        end
        if imgui.Button(u8"Купить") then
			for k, v in pairs(iBuffers_score) do
                for i = 0, v.v do 
                    if v.v > 0 then 
                        sampSendDialogResponse(dialogID, 1, k, "")
                        v.v = v.v - 1
                    end
                end
            end
        end
        imgui.End()
    end
end

function onWindowMessage(msg, wparam, lparam)
    if msg == 0x100 or msg == 0x101 then
        if (wparam == 0x1B and (bEnable.v or main_window_state.v)) and not isPauseMenuActive() then
            consumeWindowMessage(true, false)
            if msg == 0x101 then
                bEnable.v = false
				main_window_state.v = false
            end
        end
    end
end

function imgui.TextQuestion(text)
    imgui.TextDisabled('(?)')
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.PushTextWrapPos(450)
        imgui.TextUnformatted(text)
        imgui.PopTextWrapPos()
        imgui.EndTooltip()
    end
end

local sampev = require 'lib.samp.events'

function sampev.onShowDialog(id, style, title, but1, but2, text)
	if title:find("Магазин$") and not bBuy and not bPaused then
		tScore = {}
		iBuffers_score = {}
		dialogID = id
		local i = -1
		for var in text:gmatch("[^\r\n]+") do
			local s, _ = var:gsub("\t{.+}%d+%$", "")
			if not s:find("Предмет\t+Цена") then
				local s, _ = s:gsub("{.+}", "")
				i = i + 1
				tScore[i] = s
			end
		end
		for k, _ in pairs(tScore) do
			iBuffers_score[k] = imgui.ImInt(0)
		end
        bEnable.v = true
	end
	
	if id == 1333 or id == 1332 then
	return false
	end
	 
	if amount then
		if id == 7546 then
			sampSendDialogResponse(id, 1, gun, -1)
			return false
		end
		if id == 7545 then
			sampSendDialogResponse(id, 1, 0, tostring(amount))
			amount = nil
			return false
		end
	end
	if fix and title:match('Мой транспорт') then
		text = text .. '\n'
		for str in text:gmatch('.-\n') do
			str = str:lower()
			if str:find(fix) then
				local id = str:match('%((%d-)%)')
				sampSendChat('/fixmycar ' .. id)
			end
		end
		fix = nil
		return false
	end
end

function usedrugs(slot0)
	if tonumber(slot0) then
		sampSendChat(string.format("/usedrugs %d", tonumber(slot0)))
	else
		sampAddChatMessage("[fast gang]:{FFFFFF} Вы не ввели количество.", 0xFF0000)
	end
end

function usemed()
	sampSendChat("/usemed")
end

function adrenaline()
	sampSendChat("/adrenaline")
end

function sampev.onDisplayGameText(slot0, slot1, slot2)
	if slot2:find("This type of fuel") then
		sampSendClickTextdraw(15)
	end
end

function onReceiveRpc(id)
	if id == 15 then
		return false
	end
end

function autoupdate(json_url, prefix, url)
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  downloadUrlToFile(json_url, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage((prefix..'Обнаружено обновление. Пытаюсь обновиться c '..thisScript().version..' на '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('Загружено %d из %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('Загрузка обновления завершена.')
                      sampAddChatMessage((prefix..'Обновление завершено!'), color)
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'Обновление прошло неудачно. Запускаю устаревшую версию..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': Обновление не требуется.')
            end
          end
        else
          print('v'..thisScript().version..': Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
end
