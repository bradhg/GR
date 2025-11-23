-- util.lua

-- commas: add thousands separators to a number
function commas(n)
    -- make sure it's an integer string with no spaces
    local s = string.format("%d", n)

    local k
    -- repeatedly insert commas from the right
    while true do
        s, k = s:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
        if k == 0 then break end
    end
    return s
end

function formatSecondsAuto(seconds)
    -- Define scale thresholds and units
    local scales = {
        { threshold = 1,      unit = "s",  factor = 1 },
        { threshold = 1e-3,   unit = "ms", factor = 1e3 },
        { threshold = 1e-6,   unit = "μs", factor = 1e6 },
        { threshold = 1e-9,   unit = "ns", factor = 1e9 },
    }

    -- Find the most appropriate scale
    for _, scale in ipairs(scales) do
        if math.abs(seconds) >= scale.threshold then
            local value = seconds * scale.factor
            return string.format("%.1f %s", value, scale.unit)
        end
    end

    -- If even smaller than nanoseconds, default to fs
    return string.format("%.1f ps", seconds * 1e12)
end

function printf(fmt, ...)
    tex.print(string.format(fmt, ...))
end
