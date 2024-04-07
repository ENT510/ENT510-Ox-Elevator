
Elevator = {}
Elevator.Framework = 'newEsx' -- qbcore or newEsx
Elevator.DebugEnabled = true -- Print for detect error and information
Elevator.EnableCoolDown = true -- If wrong the password, the time specified below must expire
Elevator.TimeCoolDown = 10

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
                Image = 'https://cdn.discordapp.com/attachments/1217899422604595300/1226488731062636584/image.png?ex=6624f3a4&is=66127ea4&hm=d26093507090d43b75eafeb74970fcbcbd517e224d154970019114c233855e6c&', -- Image Prewiev 
                DescriptionPlans = 'The Executive Cool office combines sleek design with high functionality. Featuring minimalist interiors and cutting-edge technology, this office caters to individuals who value innovation and style. With advanced security features and customizable workspace options, it provides a dynamic environment for creativity and collaboration. Whether networking with industry peers or brainstorming new ideas, the Executive Cool office offers the perfect balance of professionalism and creativity.',
                ItemsCard = 'water' -- if password enabled required item
            },
            {
                PlansName = 'Executive Rich',  -- Name Plan
                TeleportSpawnEnter = vec4(-75.5217, -824.2700, 243.3858, 344.3858), -- Spawn coords Enter Plans
                PedPosExitPlans = vec4(-76.1262, -828.3138, 243.3858, 73.4772), -- Ped for open Menu Exit Plans
                PasswordPlans = '1998', -- Password for this plan, work all if UsePasswordPlans = true, 
                UsePasswordPlans = false,  -- Enable/Disable Password System
                Image = 'https://cdn.discordapp.com/attachments/1217899422604595300/1226488408805871717/image.png?ex=6624f357&is=66127e57&hm=b0160fe62dcb65a31f6e335e930d29566c8488bc03e66a7d6bd4b0571c79fffa&', -- Image Prewiev 
                DescriptionPlans = 'The Executive Rich Maze Bank office provides a prestigious setting for conducting business in the heart of the city. Featuring modern architecture and panoramic views of the skyline, this office is designed to impress clients and inspire productivity. With state-of-the-art facilities and personalized services, it offers a seamless work experience for discerning professionals. Whether closing deals or strategizing for the future, the Executive Rich Maze Bank office sets the stage for success.',
                ItemsCard = 'water' -- if password enabled required item
            },
            { 
                PlansName = 'Executive Rich Maze Bank',   -- Name Plan
                TeleportSpawnEnter = vec4(-1392.667, -480.4736, 72.04217 , 0.0), -- Spawn coords Enter Plans 
                PedPosExitPlans = vec4(-1394.2230, -480.7376, 72.0422, 15.5329),  -- Ped for open Menu Exit Plans
                PasswordPlans ='1111',  -- Password for this plan, work all if UsePasswordPlans = true, 
                UsePasswordPlans = true,  -- Enable/Disable Password System
                Image = 'https://cdn.discordapp.com/attachments/1217899422604595300/1226488914739462205/image.png?ex=6624f3d0&is=66127ed0&hm=3cb0c7e4784407466f9c89491bec824e21a86b33a4b90e66fc29c4c00c218a1c&', -- Image Prewiev 
                DescriptionPlans = 'The Executive Rich Maze Bank office provides a prestigious setting for conducting business in the heart of the city. Featuring modern architecture and panoramic views of the skyline, this office is designed to impress clients and inspire productivity. With state-of-the-art facilities and personalized services, it offers a seamless work experience for discerning professionals. Whether closing deals or strategizing for the future, the Executive Rich Maze Bank office sets the stage for success.',
                ItemsCard = 'gold' -- if password enabled required item
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
