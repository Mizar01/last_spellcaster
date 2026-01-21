-- useful functions that can be copied in the game code.

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
    flog(str)
end