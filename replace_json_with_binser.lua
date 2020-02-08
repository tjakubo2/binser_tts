assert(binser, 'Binser needs to be defined before replacing JSON')

local encode_pretty_warned = false
JSON = {
    encode = binser.serialize,
    decode = binser.deserialize,
    
    encode_pretty = function()
        if not encode_pretty_warned then
            broadcastToAll('Warning: encode_pretty is not supported by binser', {1, 1, 0})
            encode_pretty_warned = true
        end
        return binser.serialize(...)
    end
}