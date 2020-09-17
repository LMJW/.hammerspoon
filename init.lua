caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    time = hs.timer.localTime()
    hour = time // 3600 --SYD
    minutes = (time % 3600) // 60
    caffeine:setTitle(
        string.format(
            "UTC %02d:%02d | SYD %02d:%02d | SEA %02d:%02d | NY %02d:%02d | DUB %02d:%02d ",
            (hour+14)%24, minutes, hour, minutes, (hour+7)%24, minutes,
            (hour+10)%24, minutes, (hour+15)%24, minutes))
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
    hs.timer.doEvery(60, caffeineClicked)
end
