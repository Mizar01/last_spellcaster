-- useful functions that can be copied in the game code.
-- I don't put them in the common file to save some tokens and chars space.

-- print a matrix where rows are already inverted for easier coords reading [x,y] (usually in my games I made them like that)
-- * is an empty string, - is a nil value
function test_print_matrix(mat)
    local str = ""
    for ty = 0, #mat[0] - 1 do
        for tx = 0, #mat - 1 do
            local v = tostr(mat[tx][ty])
            str = str .. (v == "" and "*" or (v == nil and "-" or v))
        end
        str = str .. "\n"
    end
    -- flog(str)
end

-- returns true or false alternating every given seconds
function altern_time(seconds)
    return flr(time() / seconds) % 2 == 0
end