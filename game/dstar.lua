dstarfn = {} -- set of functions for _fn_ calls in dstar

-- dstar parser/deserializer
--   -  t is a table (existing or new)
--   -  s  is always a string or multiline string.
--   -  params is an optional table of parameters to be used for special value assignments.
-- Examples:
-- ```
-- -- arrays
-- dstar(t, "a") --> t = {"a"}
-- dstar(t, "a;b;c") --> t = {"a", "b", "c"}
-- dstar(t,[[
--     a
--     b
-- ]]) --> t = {"a", "b"}
-- -- tables with key-value pairs
-- dstar(t, "a=1;b=2;c=3") --> t = {a=1, b=2, c=3}
-- dstar(t,[[
--     a=1
--     b=2
-- ]]) --> t = {a=1, b=2}
-- dstar(t, "a=hello;b=world") --> t = {a="hello", b="world"}
-- -- mixed nested tables only in one line
-- dstaraddfn("f1", function(p) return p end)
-- dstar(t, [[
--     a = 1
--     b = hello
--     c = {x = 10;y = 20}
--     d = {foo;bar}
--     e = *1
--     f = _k_b
--     g = _fn_f1_pluto
-- ]], {"world"}) --> t = {a=1, b="hello", c={x=10, y=20}, d={"foo", "bar"}, e="world", f="hello", g="pluto"}
-- special values
--  nil, true, false, numbers,
--  strings (without quotes),
--  _k_ (use another key's value from the same table),
-- _fn_functionName_param (call a specific function to get the value, with optional string param)
--  *1, *2, ...*9 (assign a value from a given list of params if present.)
function dstar(t, s, params)
    t = t or {}
    params = params or {}
    
    -- corrected: manual trim function for pico-8
    -- (loops until it finds a non-whitespace character)
    local function trim(str)
        local l=1
        while l<=#str and (sub(str,l,l)==" " or sub(str,l,l)=="\n" or sub(str,l,l)=="\t") do
            l+=1
        end
        local r=#str
        while r>=l and (sub(str,r,r)==" " or sub(str,r,r)=="\n" or sub(str,r,r)=="\t") do
            r-=1
        end
        if (l>r) return ""
        return sub(str,l,r)
    end

    local i, len = 1, #s
    while i <= len do
        -- 1. skip delimiters (newlines, semicolons, spaces at start of entry)
        -- we loop here to find the start of the next token
        while i <= len do
            local char = sub(s, i, i)
            if char != " " and char != "\n" and char != ";" and char != "\t" then
                break
            end
            i += 1
        end
        if i > len then break end

        -- 2. extract the next entry (handling nested braces)
        local start = i
        local depth = 0
        local eq_pos = nil
        
        while i <= len do
            local char = sub(s, i, i)
            if (char == "{") depth += 1
            if (char == "}") depth -= 1
            
            if depth == 0 then
                if (char == "=" and not eq_pos) eq_pos = i
                -- break on separator
                if (char == ";" or char == "\n") break
            end
            i += 1
        end

        -- 3. separate key and value
        local key, val_str
        if eq_pos then
            key = trim(sub(s, start, eq_pos - 1))
            val_str = trim(sub(s, eq_pos + 1, i - 1))
        else
            val_str = trim(sub(s, start, i - 1))
        end

        -- 4. parse value types
        local val
        local first = sub(val_str, 1, 1)
        
        if first == "{" and sub(val_str, -1) == "}" then
            -- recursion for nested tables
            val = dstar({}, sub(val_str, 2, #val_str - 1), params)
            
        elseif first == "*" then
            -- param lookup (*1, *2)
            local idx = tonum(sub(val_str, 2))
            val = params[idx]
            
        elseif sub(val_str, 1, 3) == "_k_" then
            -- key lookup from current table (_k_a)
            local ref_key = sub(val_str, 4)
            val = t[ref_key]
        elseif sub(val_str, 1, 4) == "_fn_" then
            local fnarr = split(sub(val_str, 5), "_")
            val = dstarfn[fnarr[1]](#fnarr >= 2 and fnarr[2] or nil)
        elseif val_str == "true" then val = true
        elseif val_str == "false" then val = false
        elseif val_str == "nil" then val = nil
        else
            -- number or string
            val = tonum(val_str)
            -- if tonum fails, it returns nil, so we keep the string
            if (val == nil) val = val_str 
        end
        -- print("key:"..tostring(key).." val_str:"..val_str.." val:"..tostring(val))

        -- 5. assign to table
        if key and key != "" then
            t[key] = val
        elseif val_str != "" then
            add(t, val)
        end
    end
    
    return t
end

-- function to add a dstar function
function dstar_add(fname, fn) dstarfn[fname] = fn end

-- dstar constructor that returns a new table
function dstarc(s, params) 
    local t = {}
    dstar(t, s, params)
    return t
end
-- the same as dstarc but returns unpacked values
function dstaru(s, params) return unpack(dstarc(s, params)) end