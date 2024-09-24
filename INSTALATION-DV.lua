 -------------------------------------------------------------------------------------------------------------------- 
----------------------------------------------QBCORE-----------------------------------------------------
 -------------------------------------------------------------------------------------------------------------------- 

 ---  qb-core/client/function   ---  Somewhere around line 80, you will find the function that needs to be replaced. ---

    ------->>>> function QBCore.Functions.Notify(text, textype, length)  <<<---------------  this need to be replaced  ---------<<<<
    
    function QBCore.Functions.Notify(text, texttype, length)
        if type(text) == "table" then
            local ttext = text.text or 'Placeholder'
            local caption = text.caption or 'Placeholder'
            texttype = texttype or 'primary'
            length = length or 5000
    
            local color
            if texttype == 'error' then
                color = 2 -- Error
            elseif texttype == 'warning' then
                color = 3 -- Warning
            else
                color = 1 -- Normal / Primary
            end
    
            exports['dv-notify']:sendnotify(text, color, length, caption)
        else
            texttype = texttype or 'primary'
            length = length or 5000
    
            local color
            if texttype == 'error' then
                color = 2 -- Error
            elseif texttype == 'warning' then
                color = 3 -- Warning
            else
                color = 1 -- Normal / Primary
            end
    
            exports['dv-notify']:sendnotify(text, color, length)
        end
    end


 -------------------------------------------------------------------------------------------------------------------- 
    ---------------------------------------------------------   LATEST QB-CORE   ----------------------------------------------
 -------------------------------------------------------------------------------------------------------------------- 

    -- Notify
---@param source any
---@param text string | table
---@param type string
---@param length number
function QBCore.Functions.Notify(source, text, texttype, length)
    texttype = texttype or 'primary'
    length = length or 5000

    if type(text) == "table" then
        local message = text.text or 'Placeholder'
        local caption = text.caption or 'Placeholder'

        local color
        if texttype == 'error' then
            color = 2 -- Error
        elseif texttype == 'warning' then
            color = 3 -- Warning
        else
            color = 1 -- Normal / Primary
        end

        exports['dv-notify']:sendnotify(message, color, length, caption)
    else
        -- Handle string input
        local color
        if texttype == 'error' then
            color = 2 -- Error
        elseif texttype == 'warning' then
            color = 3 -- Warning
        else
            color = 1 -- Normal / Primary
        end

        exports['dv-notify']:sendnotify(text, color, length)
    end

    TriggerClientEvent('QBCore:Notify', source, text, texttype, length)
end
 -------------------------------------------------------------------------------------------------------------------- 
------------------------------------    OX_LIB Notifications replacement     -----------------------------------------
----------------------------------------------------------------------------------------------------------------------
lib.notify = function(data)
    local QBCore = exports['qb-core']:GetCoreObject()

    if not QBCore then
        print("QBCore is not initialized!")
        return
    end

    local text = data.description or data.message or data.text or data.title or "Notification"
    local caption = data.caption or ""  
    local texttype = data.type or "primary"  
    local length = data.duration or 5000  

    QBCore.Functions.Notify({
        text = text,
        caption = caption
    }, texttype, length)
end

-------------------------------------------------------------------------------------------------------------------------


    ---------------------------------------------------------EXPORT------------------------------------------------------
    
    exports['dv-notify']:sendnotify('De-V-aLtu!', 2, 5000)
    
    