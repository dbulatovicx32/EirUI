local using = assert((_G or getfenv(0) or {}).pvl_namespacer_get)

local B = using "[built-ins]" [[  PfuiConfiguration = pfUI.env.C  ]]

local Namespacer = using "System.Namespacer"

Namespacer:Bind("Pavilion.Warcraft.Addons.Zen.Externals.Pfui.Configuration", B.PfuiConfiguration)
