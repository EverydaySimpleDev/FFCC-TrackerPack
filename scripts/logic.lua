-- $stage_key|<code>: a dungeon's chests are in logic once its key is found,
-- or always when the seed has no stage keys ("Stage Keys Required" off).

function stage_key(code)
    local on = Tracker:FindObjectForCode("stage_keys_on")
    if not (on and on.Active) then
        return true
    end
    local key = Tracker:FindObjectForCode("key_" .. code)
    return key ~= nil and key.Active
end
