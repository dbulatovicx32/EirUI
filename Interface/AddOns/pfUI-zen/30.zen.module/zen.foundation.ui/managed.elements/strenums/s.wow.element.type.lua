﻿local using = assert((_G or getfenv(0) or {}).pvl_namespacer_get)

local SWoWElementType = using "[declare:enum]" "Pavilion.Warcraft.Addons.Zen.Foundation.UI.ManagedElements.Strenums.SWoWElementType"

SWoWElementType.Model                    = "Model" --@formatter:off
SWoWElementType.Frame                    = "Frame"
SWoWElementType.Slider                   = "Slider"
SWoWElementType.Button                   = "Button"
SWoWElementType.Minimap                  = "Minimap"
SWoWElementType.EditBox                  = "EditBox"
SWoWElementType.Cooldown                 = "Cooldown"
SWoWElementType.StatusBar                = "StatusBar"
SWoWElementType.SimpleHTML               = "SimpleHTML"
SWoWElementType.ColorSelect              = "ColorSelect"
SWoWElementType.GameTooltip              = "GameTooltip"
SWoWElementType.ScrollFrame              = "ScrollFrame"
SWoWElementType.MessageFrame             = "MessageFrame"
SWoWElementType.ScrollingMessageFrame    = "ScrollingMessageFrame" --@formatter:on
