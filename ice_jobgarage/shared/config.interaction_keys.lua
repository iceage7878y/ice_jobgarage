-- Interaction and key system configuration
Config.Keys = {
    enabled = true,                   -- true = aktiv‚r key system, false = sl† fra
    type = "t1ger_keys",              -- typer: "t1ger_keys", "custom", "none"
    customTriggerGive = "mykeys:giveTemp", -- event navn til custom give
    customTriggerLock = "mykeys:lockVeh"   -- event navn til custom lock
}

Config.Interaction = {
    type = "ox_textui", -- KUN OX der vikrer PT!! muligheder: "ox_target", "ox_textui", #"ice_ui", #"k_interactions", #"j_textui", #"textui"
    radius = 2.0        -- r‘kkevidde til interaktion ved ice_ui/textui/k_interactions/j_textui
}
