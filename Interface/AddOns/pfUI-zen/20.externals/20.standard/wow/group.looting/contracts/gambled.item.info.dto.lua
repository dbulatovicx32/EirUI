﻿local using = assert((_G or getfenv(0) or {}).pvl_namespacer_get)

local Guard        = using "System.Guard" --@formatter:off
local Scopify      = using "System.Scopify"
local EScopes      = using "System.EScopes"

local StringsHelper   = using "System.Helpers.Strings"
local BooleansHelper  = using "System.Helpers.Booleans"

local EWowItemQuality = using "Pavilion.Warcraft.Enums.EWowItemQuality" --  @formater:on

local Class = using "[declare]" "Pavilion.Warcraft.GroupLooting.Contracts.GambledItemInfoDto"

Scopify(EScopes.Function, {})

function Class:New(options)
    Scopify(EScopes.Function, self)
    
    Guard.Assert.IsTable(options, "options") -- todo   Guard.Assert.IsTableWithSpecificPropertyNames(options, OptionsPrototype)  

    Guard.Assert.IsNonDudStringOfMaxLength(options.Name, 512, "options.Name")
   
    Guard.Assert.IsPositiveIntegerOrZero(options.GamblingId, "options.GamblingId")
    Guard.Assert.IsPositiveIntegerOfMaxValue(options.ItemQuality, 20, "options.ItemQuality") -- EWowItemQuality  but better not enforce checking for the enum type

    Guard.Assert.IsNilOrBooleanizable(options.IsNeedable, "options.IsNeedable") -- the following are all optionals
    Guard.Assert.IsNilOrBooleanizable(options.IsGreedable, "options.IsGreedable")
    Guard.Assert.IsNilOrBooleanizable(options.IsBindOnPickUp, "options.IsBindOnPickUp")
    Guard.Assert.IsNilOrBooleanizable(options.IsDisenchantable, "options.IsDisenchantable")
    Guard.Assert.IsNilOrBooleanizable(options.IsTransmogrifiable, "options.IsTransmogrifiable")

    Guard.Assert.IsNilOrNonDudStringOfMaxLength(options.TextureFilepath, 1024, "options.TextureFilepath")
    Guard.Assert.IsNilOrPositiveIntegerOfMaxValue(options.Count, 2000, "options.Count")
    Guard.Assert.IsNilOrPositiveIntegerOrZeroOfMaxValue(options.EnchantingLevelRequiredToDEItem, 3000, "options.EnchantingLevelRequiredToDEItem")

    Guard.Assert.IsNilOrPositiveIntegerOrZeroOfMaxValue(options.NeedInelligibilityReasonType, 20, "options.NeedInelligibilityReasonType")  --            EWowLootingInelligibilityReasonType  but its better to not enforce the enum type via an explicit check
    Guard.Assert.IsNilOrPositiveIntegerOrZeroOfMaxValue(options.GreedInelligibilityReasonType, 20, "options.GreedInelligibilityReasonType") --           EWowLootingInelligibilityReasonType
    Guard.Assert.IsNilOrPositiveIntegerOrZeroOfMaxValue(options.DisenchantInelligibilityReasonType, 20, "options.DisenchantInelligibilityReasonType") -- EWowLootingInelligibilityReasonType

    return self:Instantiate({ --@formatter:off
        _name            = StringsHelper.Trim(options.Name),
        _gamblingId      = options.GamblingId,
        _itemQuality     = options.ItemQuality,
        
        _isNeedable                = BooleansHelper.Booleanize(options.IsNeedable,         true),
        _isGreedable               = BooleansHelper.Booleanize(options.IsGreedable,        true),
        _isBindOnPickUp            = BooleansHelper.Booleanize(options.IsBindOnPickUp,     true),
        _isDisenchantable          = BooleansHelper.Booleanize(options.IsDisenchantable,   true),
        _isTransmogrifiable        = BooleansHelper.Booleanize(options.IsTransmogrifiable, true),

        _count                           = options.Count                           == nil and 1  or options.Count,
        _textureFilepath                 = options.TextureFilepath                 == nil and "" or options.TextureFilepath,
        _enchantingLevelRequiredToDEItem = options.EnchantingLevelRequiredToDEItem == nil and 0  or options.EnchantingLevelRequiredToDEItem,
        
        _needInelligibilityReasonType       = options.NeedInelligibilityReasonType       == nil and 0 or options.NeedInelligibilityReasonType, --        can be nil if isNeedable       is true
        _greedInelligibilityReasonType      = options.GreedInelligibilityReasonType      == nil and 0 or options.GreedInelligibilityReasonType, --       can be nil if isGreedable      is true
        _disenchantInelligibilityReasonType = options.DisenchantInelligibilityReasonType == nil and 0 or options.DisenchantInelligibilityReasonType --   can be nil if isDisenchantable is true
    }) --@formatter:on
end

function Class:GetName()
    Scopify(EScopes.Function, self)

    return _name
end

function Class:GetGamblingId()
    Scopify(EScopes.Function, self)

    return _gamblingId
end

function Class:GetTextureFilepath()
    Scopify(EScopes.Function, self)

    return _textureFilepath
end

function Class:GetCount()
    Scopify(EScopes.Function, self)

    return _count
end

function Class:IsNeedable()
    Scopify(EScopes.Function, self)

    return _isNeedable
end

function Class:IsGreedable()
    Scopify(EScopes.Function, self)

    return _isGreedable
end

function Class:IsDisenchantable()
    Scopify(EScopes.Function, self)

    return _isDisenchantable
end

function Class:IsTransmogrifiable()
    Scopify(EScopes.Function, self)

    return _isTransmogrifiable
end

function Class:GetItemQuality()
    Scopify(EScopes.Function, self)

    return _itemQuality
end

function Class:IsGreyQuality()
    Scopify(EScopes.Function, self)

    return _itemQuality == EWowItemQuality.Grey
end

function Class:IsWhiteQuality()
    Scopify(EScopes.Function, self)

    return _itemQuality == EWowItemQuality.White
end

function Class:IsGreenQuality()
    Scopify(EScopes.Function, self)

    return _itemQuality == EWowItemQuality.Green
end

function Class:IsBlueQuality()
    Scopify(EScopes.Function, self)

    return _itemQuality == EWowItemQuality.Blue
end

function Class:IsPurpleQuality()
    Scopify(EScopes.Function, self)

    return _itemQuality == EWowItemQuality.Purple
end

function Class:IsOrangeQuality()
    Scopify(EScopes.Function, self)

    return _itemQuality == EWowItemQuality.Orange
end

function Class:IsLegendaryQuality()
    Scopify(EScopes.Function, self)

    return _itemQuality == EWowItemQuality.Legendary
end

function Class:IsArtifactQuality()
    Scopify(EScopes.Function, self)

    return _itemQuality == EWowItemQuality.Artifact
end

function Class:IsBindOnPickUp()
    Scopify(EScopes.Function, self)

    return _isBindOnPickUp
end

function Class:GetEnchantingLevelRequiredToDEItem()
    Scopify(EScopes.Function, self)

    return _enchantingLevelRequiredToDEItem
end

-- @return EWowLootingInelligibilityReasonType
function Class:GetNeedInelligibilityReasonType()
    Scopify(EScopes.Function, self)
    
    return _needInelligibilityReasonType
end

-- @return EWowLootingInelligibilityReasonType
function Class:GetGreedInelligibilityReasonType()
    Scopify(EScopes.Function, self)

    return _greedInelligibilityReasonType
end

-- @return EWowLootingInelligibilityReasonType
function Class:GetDisenchantInelligibilityReasonType()
    Scopify(EScopes.Function, self)

    return _disenchantInelligibilityReasonType
end

function Class:ToString()
    Scopify(EScopes.Function, self)

    return StringsHelper.Format( --@formatter:off
            "{\n"                                              ..
            "  Name                               = %q,\n"     ..
            "  Quality                            = %q,\n"     ..
            "  GamblingId                         = %s,\n"     ..

            "  IsNeedable                         = %s,\n"     ..
            "  IsGreedable                        = %s,\n"     ..
            "  IsBindOnPickUp                     = %s,\n"     ..
            "  IsDisenchantable                   = %s,\n"     ..
            "  IsTransmogrifiable                 = %s,\n"     ..

            "  Count                              = %s,\n"     ..
            "  Texture                            = %q,\n"     ..
            "  EnchantingLevelRequiredToDEItem          = %s,\n"     ..

            "  NeedInelligibilityReasonType       = %s,\n"     ..
            "  GreedInelligibilityReasonType      = %s,\n"     ..
            "  DisenchantInelligibilityReasonType = %s\n"      ..
            "}\n",
            self:GetName(),
            self:GetItemQuality(),
            self:GetGamblingId(),

            self:IsNeedable(),
            self:IsGreedable(),
            self:IsBindOnPickUp(),
            self:IsDisenchantable(),
            self:IsTransmogrifiable(),

            self:GetCount(),
            self:GetTextureFilepath(),
            self:GetEnchantingLevelRequiredToDEItem(),

            self:GetNeedInelligibilityReasonType(),
            self:GetGreedInelligibilityReasonType(),
            self:GetDisenchantInelligibilityReasonType()            
    ) --@formatter:on
end
Class.__tostring = Class.ToString

