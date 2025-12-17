-- Entry point for config; individual sections live in the split files.
Config = Config or {}

-- Access control
-- mode = "esx": kræver job match (standard)
-- mode = "standalone": ingen job-adgangskrav (alle kan åbne)
Config.Access = {
    mode = "esx"
}
