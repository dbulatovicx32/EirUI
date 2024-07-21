﻿-- we just want to preemptively declare the namespaces so that we will be able to use strings.* inside guard.* and vice-versa

local using = assert((_G or getfenv(0) or {}).pvl_namespacer_get) --@formatter:off

-- using "[declare]" "System.Scopify"      no need to predeclare this really

using "[declare:enum]" "System.Language.SRawTypes"

using "[declare]" "System.Try"
using "[declare]" "System.Nils"
using "[declare]" "System.Math"
using "[declare]" "System.Time"
using "[declare]" "System.Table"
using "[declare]" "System.Guard"
using "[declare]" "System.Event"
using "[declare]" "System.Iterators"
using "[declare]" "System.Validation"
using "[declare]" "System.Reflection"

using "[declare]" "System.Console"
using "[declare]" "System.Console.Writer"

using "[declare]" "System.Classes.Metatable"
using "[declare]" "System.Classes.Instantiator"

using "[declare]" "System.Helpers.Arrays"
using "[declare]" "System.Helpers.Tables"
using "[declare]" "System.Helpers.Strings"
using "[declare]" "System.Helpers.Booleans"

using "[declare]" "System.Language.RawTypeSystem"

using "[declare]" "System.Exceptions.Throw"
using "[declare]" "System.Exceptions.Rethrow"
using "[declare]" "System.Exceptions.Utilities"

using "[declare]" "System.Exceptions.Exception"
using "[declare]" "System.Exceptions.ValueAlreadySetException"
using "[declare]" "System.Exceptions.ValueCannotBeNilException"
using "[declare]" "System.Exceptions.ValueIsOutOfRangeException"
using "[declare]" "System.Exceptions.ValueIsOfInappropriateTypeException"

using "[declare]" "System.Externals.WoW.UI.GlobalFrames"
