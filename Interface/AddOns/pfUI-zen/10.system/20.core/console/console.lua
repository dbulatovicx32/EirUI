﻿local using = assert((_G or getfenv(0) or {}).pvl_namespacer_get)

local Guard = using "System.Guard"
local Scopify = using "System.Scopify"
local EScopes = using "System.EScopes"

local A = using "System.Helpers.Arrays"
local T = using "System.Helpers.Tables"
local S = using "System.Helpers.Strings"

local WoWUIGlobalFrames = using "System.Externals.WoW.UI.GlobalFrames"

local Console = using "[declare]" "System.Console [Partial]"

Console.Writer = using "[declare]" "System.Console.Writer [Partial]"

Scopify(EScopes.Function, {})

function Console.Writer:New(nativeWriteCallback)
    Scopify(EScopes.Function, self)

    Guard.Assert.IsFunction(nativeWriteCallback, "nativeWriteCallback")
    
    return self:Instantiate({
        _nativeWriteCallback = nativeWriteCallback
    })
end

function Console.Writer:WriteFormatted(format, ...)
    local variadicsArray = arg
    
    Scopify(EScopes.Function, self)

    Guard.Assert.IsString(format, "format")

    if T.IsNilOrEmpty(variadicsArray) then --optimization
        _nativeWriteCallback(format)
        return
    end

    _nativeWriteCallback(S.Format(format, A.Unpack(variadicsArray)))
end

function Console.Writer:Write(message)
    Scopify(EScopes.Function, self)
    
    Guard.Assert.IsString(message, "message")

    _nativeWriteCallback(message)
end

function Console.Writer:WriteLine(message)
    Scopify(EScopes.Function, self)

    Guard.Assert.IsString(message, "message")

    _nativeWriteCallback(message .. "\n")
end

-- @formatter:off
Console.Out   = Console.Writer:New(function(message) WoWUIGlobalFrames.DefaultChatFrame:AddMessage(S.Format("|cffffff55%s", message)) end)
Console.Error = Console.Writer:New(function(message) WoWUIGlobalFrames.DefaultChatFrame:AddMessage(S.Format("|cffff5555%s", message)) end)
-- @formatter:on
