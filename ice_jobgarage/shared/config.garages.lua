-- Garage configurations
Config.Garages = {

    -- ?? POLITI GARAGE
    police = {
        Job = 'police',
        Label = 'Politi Garage',
        GarageCoords = vector3(424.8780, -1012.7906, 30.0005),
        VehicleSpawn = vector3(426.2825, -1019.6027, 28.9860),
        DeleteZone   = vector3(426.2825, -1019.6027, 30.0005),
        -- Valgfrit blip-/enhedsvalg ved spawn (visualz_blips)
        BlipSelect = {
            enabled = true,
            group = "police",
            title = "Bil GPS",
            unitLabel = "Enhed",
            fleetLabel = "Fl†de nummer",
            fleetPlaceholder = "10-49",
            defaultUnit = "[Bravo]",
            options = {
                { label = 'Bravo', value = '[Bravo]' },
                { label = 'Alpha', value = '[Alpha]' },
                { label = 'Romeo', value = '[Romeo]' },
                { label = 'Foxtrot', value = '[Foxtrot]' },
                { label = 'Mike', value = '[Mike]' },
                { label = 'Mike-Kilo', value = '[Mike-Kilo]' },
                { label = 'Lima', value = '[Lima]' },
                { label = 'Kilo', value = '[Kilo]' }
            }
        },
        -- Category (Marked, Civil, Ledelse, MC)
        Vehicles = {
            { label = 'Almen - Argento', model = 'Polargento', category = 'Marked', stats = { speed = 185, accel = 7, handling = 8 } },
            { label = 'Almen - GXB', model = 'polgxb', category = 'Ice', stats = { speed = 175, accel = 6, handling = 7 } },
            { label = 'Almen - IDX (EL)', model = 'polidx', category = 'Marked', stats = { speed = 185, accel = 7, handling = 8 } },
            { label = 'Almen - Rebla', model = 'polrebla', category = 'Marked', stats = { speed = 175, accel = 6, handling = 7 } },
            { label = 'Almen - Argento', model = 'Polargento', category = 'Marked', stats = { speed = 185, accel = 7, handling = 8 } },
            { label = 'Almen - Stratos', model = 'polstratos', category = 'Marked', stats = { speed = 175, accel = 6, handling = 7 } },
            { label = 'Almen - Streiter', model = 'polstreiter', category = 'Marked', stats = { speed = 185, accel = 7, handling = 8 } },
            { label = 'Almen - XLS', model = 'polxls', category = 'Marked', stats = { speed = 175, accel = 6, handling = 7 } },
            { label = 'Almen - Strafes', model = 'strafesint', category = 'Marked', stats = { speed = 175, accel = 6, handling = 7 } },
            { label = 'Hundepatrulje - Polaris', model = 'polpolaris', category = 'Marked', stats = { speed = 175, accel = 6, handling = 7 } },
            { label = 'Hundepatrulje - Interceptor', model = 'nordint', category = 'Marked', stats = { speed = 175, accel = 6, handling = 7 } },


            { label = 'Romeo - Brute', model = 'polbrute', category = 'Ledelse', stats = { speed = 185, accel = 7, handling = 8 } },
            { label = 'Indsatsleder - Trasfer', model = 'poltransfer', category = 'Ledelse', stats = { speed = 175, accel = 6, handling = 7 } },
            { label = 'Aks - Bearcat', model = 'BearcatBB', category = 'Ledelse', stats = { speed = 175, accel = 6, handling = 7 } },

            { label = 'MC - Naga1300', model = 'polnaga1300', category = 'MC', stats = { speed = 185, accel = 7, handling = 8 } },
            { label = 'MC - Off-Road', model = 'poltrailmaster', category = 'MC', stats = { speed = 175, accel = 6, handling = 7 } },


            { label = 'Civil - Argento', model = 'polcargento', category = 'Civil', stats = { speed = 175, accel = 6, handling = 7 } },
            { label = 'Civil - Bravado', model = 'polcgresleyh', category = 'Civil', stats = { speed = 185, accel = 7, handling = 8 } },
            { label = 'Civil - Neon', model = 'polcneon', category = 'Civil', stats = { speed = 175, accel = 6, handling = 7 } },
            { label = 'Civil - Polaris', model = 'polcpolaris', category = 'Civil', stats = { speed = 175, accel = 6, handling = 7 } },
            { label = 'Civil - Rhinehart', model = 'polcrhinehart', category = 'Civil', stats = { speed = 175, accel = 6, handling = 7 } },
            { label = 'Civil - Stratos', model = 'polcstratos', category = 'Civil', stats = { speed = 185, accel = 7, handling = 8 } },
            { label = 'Civil - Transfer', model = 'polctransfer', category = 'Civil', stats = { speed = 175, accel = 6, handling = 7 } },
            { label = 'Civil - XLS', model = 'polcxls', category = 'Civil', stats = { speed = 175, accel = 6, handling = 7 } },
            { label = 'Civil - Rebla', model = 'reblax6u', category = 'Civil', stats = { speed = 175, accel = 6, handling = 7 } },

            { label = 'Test XLS', model = 'xls', category = 'Test Server', stats = { speed = 175, accel = 6, handling = 7 } },

        }
    },

    -- ?? EMS / L’GE GARAGE
    ems = {
        Job = 'ambulance',
        Label = 'L‘ge & EMS Garage',
        GarageCoords = vector3(-467.2192, -1022.1724, 24.2890),
        VehicleSpawn = vector3(-460.3834, -1017.5477, 24.2890),
        DeleteZone   = vector3(-460.3834, -1017.5477, 24.2890),
        BlipSelect = { enabled = false },
        Vehicles = {
            { label = 'Akut L‘ge - Streiter', model = 'gdstreiter2a', category = 'Akut', stats = { speed = 175, accel = 6, handling = 7 } },
            { label = 'Ambulance - TGE', model = 'emsbrute', category = 'Ambulance', stats = { speed = 150, accel = 5, handling = 6 } },
            { label = 'Mobil', model = 'emsmobil', category = 'Ambulance', stats = { speed = 150, accel = 5, handling = 6 } },
            { label = 'Polaris', model = 'emspolaris', category = 'Akut', stats = { speed = 150, accel = 5, handling = 6 } }
        }
    },

    -- ?? BRANDV’SEN GARAGE
    fire = {
        Job = 'fire',
        Label = 'Brandstation Garage',
        GarageCoords = vector3(-1036.1255, -1387.2596, 5.0043),
        VehicleSpawn = vector3(-1055.4496, -1369.9104, 4.9736),
        DeleteZone   = vector3(-1055.4496, -1369.9104, 4.9736),
        Vehicles = {
           -- { label = 'Cavalcade - Indsatschef', model = 'cbm-firecavalcade', category = 'Ledelse', stats = { speed = 160, accel = 6, handling = 6 } },
            { label = 'Tankvogn1', model = 'tankvogn1', category = 'Ledelse', stats = { speed = 160, accel = 6, handling = 6 } },
          --  { label = 'Benefactor Imperial', model = 'cbm-impefire', category = 'Tjeneste', stats = { speed = 165, accel = 6, handling = 7 } },
            { label = 'Benefactor Jogger Multik›ret›j', model = 'brandjogger', category = 'Tjeneste', stats = { speed = 160, accel = 6, handling = 6 } },
           -- { label = 'Benefactor Jogger HSE', model = 'cbm-firejog', category = 'Tjeneste', stats = { speed = 160, accel = 6, handling = 6 } },
            --{ label = 'Vandtankvogn', model = 'cbm-firetanker', category = 'Tung', stats = { speed = 130, accel = 5, handling = 5 } },
          --  { label = 'Stigevogn S118', model = 'cbm-jobuiltladder', category = 'Tung', stats = { speed = 125, accel = 4, handling = 5 } },
            { label = 'Autospr›jte', model = 'basisvogn', category = 'Tung', stats = { speed = 140, accel = 5, handling = 6 } },
            --{ label = 'HBR Redningsvogn', model = 'hbrstorm', category = 'HBR', stats = { speed = 160, accel = 6, handling = 6 } },
            --{ label = 'HBR F›lgeskade', model = 'hbrimperial', category = 'HBR', stats = { speed = 160, accel = 6, handling = 6 } },
           -- { label = 'HBR Flexibel enhed / Slagetenter', model = 'hbrcaran', category = 'HBR', stats = { speed = 150, accel = 5, handling = 5 } },
            --{ label = 'HBR Sagsbehandler', model = 'hbrbuffalosxu', category = 'HBR', stats = { speed = 160, accel = 6, handling = 6 } },
            --{ label = 'HBR INDSATSCHEF', model = 'hbralamo', category = 'Ledelse', stats = { speed = 165, accel = 6, handling = 6 } },
           -- { label = 'HBR INDSATSLEDER', model = 'brandisl2', category = 'Ledelse', stats = { speed = 165, accel = 6, handling = 6 } },
           -- { label = 'HBR N›dbehandler RTW', model = 'hbrlandstalker', category = 'HBR', stats = { speed = 155, accel = 5, handling = 5 } }
        }
    },

    -- ?? HELIKOPTER GARAGE
    police_heli = {
        Job = 'police',
        Label = 'Politi Helikopter Garage',
        GarageCoords = vector3(447.1893, -981.6710, 44.9549),
        VehicleSpawn = vector3(440.2789, -989.4745, 44.9550),
        DeleteZone   = vector3(440.2789, -989.4745, 44.9550),
        BlipSelect = {
            enabled = true,
            group = "police",
            title = "Heli GPS",
            unitLabel = "Enhed",
            fleetLabel = "Fl†de nummer",
            fleetPlaceholder = "H-01",
            defaultUnit = "[Bravo]",
            options = {
                { label = 'Bravo', value = '[Bravo]' },
                { label = 'Alpha', value = '[Alpha]' },
                { label = 'Romeo', value = '[Romeo]' },
                { label = 'Foxtrot', value = '[Foxtrot]' },
                { label = 'Mike', value = '[Mike]' },
                { label = 'Mike-Kilo', value = '[Mike-Kilo]' },
                { label = 'Lima', value = '[Lima]' },
                { label = 'Kilo', value = '[Kilo]' }
            }
        },
        Vehicles = {
            { label = 'Politi Helikopter - Maverick', model = 'polmav', category = 'Patrulje', stats = { speed = 180, accel = 7, handling = 8 } },
            { label = 'Politi MH6 - Litllebird', model = 'mh6', category = 'Romeo/AKS', stats = { speed = 180, accel = 7, handling = 8 } },
            { label = 'Politi UH60V - Blackhawk', model = 'uh60v', category = 'Romeo/AKS', stats = { speed = 180, accel = 7, handling = 8 } },
            { label = 'Politi AW101 - AW101', model = 'aw101', category = 'Patrulje/SAR', stats = { speed = 180, accel = 7, handling = 8 } },
            { label = 'Politi AS550 - Fennec ', model = 'as350', category = 'Patrulje/SAR', stats = { speed = 180, accel = 7, handling = 8 } },
        }
    }
}
