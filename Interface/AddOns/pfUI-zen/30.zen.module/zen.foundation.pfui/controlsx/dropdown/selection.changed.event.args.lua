﻿-- the main reason we introduce this class is to be able to set the selected option by nickname  on top of that
-- the original pfui dropdown control has a counter-intuitive api surface that is not fluent enough for day to day use 

local _assert, _setfenv, _type, _getn, _, _, _unpack, _pairs, _importer, _namespacer, _setmetatable = (function()
    local _g = assert(_G or getfenv(0))
    local _assert = assert
    local _setfenv = _assert(_g.setfenv)

    _setfenv(1, {})

    local _type = _assert(_g.type)
    local _getn = _assert(_g.table.getn)
    local _error = _assert(_g.error)
    local _print = _assert(_g.print)
    local _pairs = _assert(_g.pairs)
    local _unpack = _assert(_g.unpack)
    local _importer = _assert(_g.pvl_namespacer_get)
    local _namespacer = _assert(_g.pvl_namespacer_add)
    local _setmetatable = _assert(_g.setmetatable)

    return _assert, _setfenv, _type, _getn, _error, _print, _unpack, _pairs, _importer, _namespacer, _setmetatable
end)()

_setfenv(1, {})

local Scopify = _importer("System.Scopify")
local EScopes = _importer("System.EScopes")

local Class = _namespacer("Pavilion.Warcraft.Addons.Zen.UI.Pfui.ControlsX.Dropdown.SelectionChangedEventArgs")

function Class:New()
    Scopify(EScopes.Function, self)

    return self:Instantiate({
        _old = nil,
        _new = nil,
    })
end

function Class:GetOldValue()
    Scopify(EScopes.Function, self)

    return _old
end

function Class:GetNewValue()
    Scopify(EScopes.Function, self)

    return _new
end

function Class:ChainSetOld(old)
    Scopify(EScopes.Function, self)

    _assert(old == nil or _type(old) == "string")

    _old = old

    return self
end

function Class:ChainSetNew(new)
    Scopify(EScopes.Function, self)

    _assert(_type(new) == "string")

    _new = new

    return self
end
