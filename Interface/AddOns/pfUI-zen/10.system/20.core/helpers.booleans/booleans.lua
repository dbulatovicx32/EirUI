﻿local using = assert((_G or getfenv(0) or {}).pvl_namespacer_get)

local Guard = using "System.Guard"
local Reflection = using "System.Reflection"
local StringsHelper = using "System.Helpers.Strings"

local Class = using "[declare]" "System.Helpers.Booleans [Partial]"

function Class.Booleanize(value, defaultValueWhenValueIsNil)
    _ = defaultValueWhenValueIsNil == nil
            and Guard.Assert.IsBooleanizable(value)
            or Guard.Assert.IsNilOrBooleanizable(value)
    
    if value == nil then
        return defaultValueWhenValueIsNil
    end

    if Reflection.IsString(value) then --00
        value = StringsHelper.ToUppercase(value)

        return     value == "1" --     @formatter:off
                or value == "Y"
                or value == "T"
                or value == "YES"
                or value == "TRUE" --  @formatter:on
    end

    if Reflection.IsNumber(value) then
        return value >= 1
    end
    
    return value --10
    
    -- 00  this must mirrors the logic in Guard.Utilities.IsBooleanizableString
    -- 10  if we fallthrough then we must be dealing with a boolean
end
