PredicateParser = {}
PredicateParser.metatable = {
    __index = PredicateParser,
}
setmetatable(
        PredicateParser,
        {
            __call = function(self, ...)
                return self:Get(unpack(arg))
            end
        }
)

function PredicateParser:Get()
    if not self.instance then
        self.instance = self:New()
    end
    return self.instance
end

function PredicateParser:New()
    local self = setmetatable({}, PredicateParser.metatable)

    self.compiledFunctions = {
    }

    self.funcHeader = "return function(...)\n"
    self.funcArgs = "local args = {...}\n"
    self.footer = "\nend;"

    return self
end

function PredicateParser:GetLocalsUnrolled(...)
    local argsCnt = table.getn(arg)
    local localStr = "local "

    for i = 1, argsCnt do
        if i ~= 1 then
            localStr = localStr .. ","
        end
        localStr = localStr .. string.char(96 + i)
    end

    for i = 1, argsCnt do
        localStr = localStr .. "\n" .. string.char(96 + i) .. " = args[" .. i .. "];"
    end
    localStr = localStr .. "\n"
    return localStr
end

function PredicateParser:GetLocalsNamed(argsNames, ...)
    local argsCnt = table.getn(arg)
    local localStr = "local "

    for i = 1, argsCnt do
        local name = argsNames[i]
        if not name then
            name = string.char(96 + i)
        end
        if i ~= 1 then
            localStr = localStr .. ","
        end
        localStr = localStr .. name
    end

    for i = 1, argsCnt do
        local name = argsNames[i]
        if not name then
            name = string.char(96 + i)
        end
        localStr = localStr .. "\n" .. name .. " = args[" .. i .. "];"
    end
    localStr = localStr .. "\n"
    return localStr
end

function PredicateParser:IsNamedParameters(predicate, ...)
    local arrowPos = string.find(predicate, "=>")
    if not arrowPos then
        return false
    end

    local args = self:Trim(string.sub(predicate, 1, arrowPos - 1))
    local argsNames = self:Split(args, ",")
    if not argsNames then
        return false
    end

    local predReal = self:Trim(string.sub(predicate, arrowPos + 2, table.getn(predicate)))

    return true, predReal, argsNames
end

function PredicateParser:GetQueryFunction(predicate, ...)
    local localsString
    
    local isNamed, pred, argsNames = self:IsNamedParameters(predicate, unpack(arg))
    if isNamed then
        predicate = pred
        localsString = self:GetLocalsNamed(argsNames, unpack(arg))
    else
        localsString = self:GetLocalsUnrolled(unpack(arg))
    end

    local argsCnt = table.getn(arg)
    local hash = self:HashValue(argsCnt .. "-" .. predicate)
    if not self.compiledFunctions[hash] then
        local hasReturn = string.find(predicate, "return")
        local fullFunc = self.funcHeader .. self.funcArgs .. localsString
        if not hasReturn then
            fullFunc = fullFunc .. "return "
        end
        fullFunc = fullFunc .. predicate .. self.footer
        local loaded = loadstring(fullFunc)()
        self.compiledFunctions[hash] = loaded
    end
    return self.compiledFunctions[hash]
end

function PredicateParser:GetPredicateFunction(pred, ...)
    local func = false
    if type(pred) == "function" then
        func = pred
    elseif type(pred) == "string" then
        func = PredicateParser():GetQueryFunction(pred, 1, unpack(arg))
    else
        return false
        -- error("Wrong argument to PredicateParser:GetPredicateFunction(), expected function or string predicate")
    end
    return func
end

function PredicateParser:SortingFunction(data, predicate, ...)
    local sortingCache = {}
    local func = PredicateParser():GetPredicateFunction(predicate, unpack(arg))
    for _, val in _ipairs(data) do
        sortingCache[val] = func(val, unpack(arg))
    end
    table.sort(data, function(a, b)
        return sortingCache[a] < sortingCache[b]
    end)
end

function PredicateParser:HashValue(val)
    if type(md5) == "function" then
        return md5(val)
    end
    return val
end

function PredicateParser:Split(str, sep)
    if type(split) == "function" then
        return split(str, sep)
    end

    local ret = {}
    local n = 1
    for w in string.gmatch(str, "([^" .. sep .. "]*)") do
        ret[n] = ret[n] or w
        if w == "" then
            n = n + 1
        end
    end
    return ret
end

function PredicateParser:Trim(str)
    if string and type(string.trim) == "function" then
        return string.trim(str)
    end
    return (string.gsub(str, "^%s*(.-)%s*$", "%1"))
end