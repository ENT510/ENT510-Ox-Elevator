
Elevator = {}
Elevator.Framework = 'newEsx' -- qbcore or newEsx
Elevator.DebugEnabled = true -- Print for detect error and information
Elevator.ElevatorZone = {
    ['Office Management'] = {
        PedElevatorEnter = vec4(-83.4459, -841.8102, 40.5456, 336.3083), -- Ped for Open Menu Plans
        PedElevatorModel = 's_m_m_fiboffice_01', -- Model Ped
        TeleportCoordsExit = vec4(-79.4607, -836.8304, 40.5582, 177.6933), -- Exit spawn coords for all plans
        Plans = {
            { 
                PlansName = 'Executive Cool',  -- Name Plan
                TeleportSpawnEnter = vec4(-1579.678, -565.0034, 108.5229, 0.0), -- Spawn coords Enter Plans
                PedPosExitPlans = vec4(-1580.5570, -563.5488, 108.5229, 302.0484), -- Ped for open Menu Exit Plans
                PasswordPlans ='1234', -- Password for this plan, work all if UsePasswordPlans = true, 
                UsePasswordPlans = true, -- Enable/Disable Password System
                Image = '', -- Image Prewiev 
                DescriptionPlans = '', -- Description Plan
            },
            {
                PlansName = 'Executive Rich',  -- Name Plan
                TeleportSpawnEnter = vec4(-75.5217, -824.2700, 243.3858, 344.3858), -- Spawn coords Enter Plans
                PedPosExitPlans = vec4(-76.1262, -828.3138, 243.3858, 73.4772), -- Ped for open Menu Exit Plans
                PasswordPlans = '1998', -- Password for this plan, work all if UsePasswordPlans = true, 
                UsePasswordPlans = false,  -- Enable/Disable Password System
                Image = '', -- Image Prewiev 
                DescriptionPlans = '', -- Description Plan
            },
            { 
                PlansName = 'Executive Rich Maze Bank',   -- Name Plan
                TeleportSpawnEnter = vec4(-1392.667, -480.4736, 72.04217 , 0.0), -- Spawn coords Enter Plans 
                PedPosExitPlans = vec4(-1394.2230, -480.7376, 72.0422, 15.5329),  -- Ped for open Menu Exit Plans
                PasswordPlans ='1111',  -- Password for this plan, work all if UsePasswordPlans = true, 
                UsePasswordPlans = true,  -- Enable/Disable Password System
                Image = '', -- Image Prewiev 
                DescriptionPlans = '', -- Description Plan
            },
        },
        Blip = {
            Sprite = 521,
            Color = 11,
            Scale =  0.7,
            Name = 'Building Plans',
            Enabled = true
        },
    },
}
