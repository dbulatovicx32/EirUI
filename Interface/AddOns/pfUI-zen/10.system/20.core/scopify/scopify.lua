﻿local using = assert((_G or getfenv(0) or {}).pvl_namespacer_get)

local B = using "[built-ins]" [[ Setfenv = setfenv ]]

local Namespacer = using "System.Namespacer"

-- its preferable to use the binder to register the function itself because
-- if we register it as a class:__Call__() it wont be as performant in practice

Namespacer:Bind("System.Scopify", B.Setfenv) -- no need to assert here   its done internally
Namespacer:Bind("System.EScopes", { EGlobal = 0, EFunction = 1 })
