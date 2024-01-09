local GUI = require("GUI")
local system = require("System")

local workspace, window, menu = system.addWindow(GUI.filledWindow(1, 1, 90, 30, 0xE1E1E1)) -- Создаём рабочее окно

local localization = system.getCurrentScriptLocalization() -- Берём язык Mine OS

local layout = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 4)) -- Задаём количество столбцов и строк

-- Заголовок программы
layout:setPosition(1, 1, layout:addChild(GUI.text(1, 1, 0x4B4B4B, "Управление освещением")))

layout:setPosition(1, 3, layout:addChild(GUI.button(1, 3, 26, 3, 0x4B4B4B, 0x000000, 0xAAAAAA, 0x0, "Включить освещение"))).onTouch = function()
  local com = require("component")
local zp = com.invoke
local list = {} -- Переменная для хранения адресов
local function scan() -- Добавление адресов блоков в массив
  list = {"7a9cb4ba-ac0e-43cd-bd61-ccdc7ebc5ce3", "ace33009-07c1-4b35-ad81-e309b4dc2666", "c1cd3e2e-fa93-4951-bf3c-9abf9fa9b6fa", "0face6a5-56b8-4446-a7bb-bbeb091c322f", "292d80e0-7e0f-49df-bdb1-e5b13d26a3d5"}
  for k, _ in pairs(com.list("redstone")) do -- Прогон по всем приборам
    list[#list+1] = k
  end
end
scan()
for i=1,#list do
  zp(list[i], 'setOutput', 1, 255) -- аналог redsone.setOutput(1, 255)
  zp(list[i], 'setOutput', 2, 255)
  zp(list[i], 'setOutput', 3, 255)
  zp(list[i], 'setOutput', 4, 255)
  zp(list[i], 'setOutput', 5, 255)
end
end

layout:setPosition(1, 4, layout:addChild(GUI.button(1, 4, 26, 3, 0x4B4B4B, 0x000000, 0xAAAAAA, 0x0, "Выключить освещение"))).onTouch = function()
local com = require("component")
local zp = com.invoke
local list = {} -- Переменная для хранения адресов
local function scan() -- Добавление адресов блоков в массив
  list = {"7a9cb4ba-ac0e-43cd-bd61-ccdc7ebc5ce3", "ace33009-07c1-4b35-ad81-e309b4dc2666", "c1cd3e2e-fa93-4951-bf3c-9abf9fa9b6fa", "0face6a5-56b8-4446-a7bb-bbeb091c322f", "292d80e0-7e0f-49df-bdb1-e5b13d26a3d5"}
  for k, _ in pairs(com.list("redstone")) do -- Прогон по всем приборам
    list[#list+1] = k
  end
end
scan()
for i=1,#list do
  zp(list[i], 'setOutput', 1, 0) -- аналог redsone.setOutput(1, 255)
  zp(list[i], 'setOutput', 2, 0)
  zp(list[i], 'setOutput', 3, 0)
  zp(list[i], 'setOutput', 4, 0)
  zp(list[i], 'setOutput', 5, 0)
end
end

-- Кнопки в верхнем тулбаре
local contextMenu = menu:addContextMenuItem("Файл")
contextMenu:addSeparator()
contextMenu:addItem("Закрыть").onTouch = function()
  window:remove()
end

-- Изменение размера окна
window.onResize = function(newWidth, newHeight)
  window.backgroundPanel.width, window.backgroundPanel.height = newWidth, newHeight
  layout.width, layout.height = newWidth, newHeight
end

workspace:draw() -- Отрисовка окна