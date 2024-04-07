

function NotifyClient(title, msg, type, icon)
    lib.notify({
        title = title,
        description = msg,
        type = type,
        icon = icon,
        position = 'top-left',
    })
end
