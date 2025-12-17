local function loadLocaleFile(name)
    local path = ('locales/%s.lua'):format(name)
    local chunk = LoadResourceFile(GetCurrentResourceName(), path)
    if not chunk then
        print(('[Ice_jobgarage] Locale file not found: %s'):format(path))
        return {}
    end

    local fn, err = load(chunk, path)
    if not fn then
        print(('[Ice_jobgarage] Failed to load locale %s: %s'):format(path, err or 'unknown'))
        return {}
    end

    local ok, res = pcall(fn)
    if not ok then
        print(('[Ice_jobgarage] Error while reading locale %s: %s'):format(path, res))
        return {}
    end

    if type(res) ~= 'table' then
        print(('[Ice_jobgarage] Locale %s did not return a table'):format(path))
        return {}
    end

    return res
end

local defaultLocale = {
    lang = 'en',
    garage = 'Garage',
    no_access = 'You do not have access to this garage',
    open_garage = 'Open %s',
    press_to_open = 'Press [E] to open %s',
    remove_vehicle = 'Remove vehicle',
    remove_vehicle_prompt = '[E] - Remove vehicle',
    vehicle_removed = 'Vehicle removed',
    delete_too_far = 'You need to be in the vehicle or closer to it',
    no_vehicle = 'No vehicle nearby',
    config_missing = 'Garage configuration not found',
    invalid_model = 'Invalid vehicle model',
    spawn_point_missing = 'Spawn coordinates not configured',
    model_load_fail = 'Failed to load vehicle model: %s',
    spawn_blocked = 'Spawn area is occupied. Remove the vehicle first.',
    spawn_fail = 'Could not spawn vehicle',
    spawn_success = 'You retrieved a vehicle: %s',
    blip_title = 'Vehicle GPS',
    blip_unit_label = 'Unit',
    blip_fleet_label = 'Fleet number',
    blip_fleet_placeholder = '10-49',
    ui = {
        title = 'Garage',
        close = 'Close',
        search = 'Search for vehicles...',
        unknown_category = 'Unknown',
        none_found = 'No vehicles found',
        speed = 'Speed',
        acceleration = 'Acceleration',
        handling = 'Handling',
        spawn = 'Spawn Vehicle',
        spawning = 'Spawning...',
        speed_unit = ' km/h',
        accel_unit = '/10',
        handling_unit = '/10'
    }
}

local function withFallback(tbl, fallback)
    if type(tbl) ~= 'table' then tbl = {} end
    return setmetatable(tbl, { __index = fallback or function(_, key) return key end })
end

local selected = (Config and Config.Locale) or 'en'
local localeData = loadLocaleFile(selected)
if (not next(localeData)) and selected ~= 'en' then
    localeData = loadLocaleFile('en')
end

Locale = {}
Locale.data = withFallback(localeData, defaultLocale)
Locale.data.ui = withFallback(Locale.data.ui, defaultLocale.ui)

function Locale.lang()
    return Locale.data.lang or selected or 'en'
end

function Locale.all()
    return Locale.data
end

function Locale.ui()
    return Locale.data.ui
end

function _L(key, ...)
    local value = Locale.data[key]
    if type(value) == 'string' then
        if select('#', ...) > 0 then
            return value:format(...)
        end
        return value
    end
    return key
end
