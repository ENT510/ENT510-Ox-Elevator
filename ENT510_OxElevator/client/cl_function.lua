function CamEnabled(ped)
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0, 2.0, 0)
    camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamActive(camera, true)
    RenderScriptCams(true, true, 1250, 1, 0)
    SetCamCoord(camera, coords.x, coords.y, coords.z + 0.65)
    SetCamFov(camera, 38.0)
    SetCamRot(camera, 0.0, 0.0, GetEntityHeading(pedBoss) + 180)
    PointCamAtPedBone(camera, ped, 31086, 0.0 - 0.3, 0.0, 0.03, 1)
    local camCoords = GetCamCoord(camera)
    TaskLookAtCoord(ped, camCoords.x, camCoords.y, camCoords.z, 5000, 1, 1)
    SetCamUseShallowDofMode(camera, true)
end


function CamDisbled()
    RenderScriptCams(false, true, 1250, 1, 0)
    DestroyCam(camera, false)
end
