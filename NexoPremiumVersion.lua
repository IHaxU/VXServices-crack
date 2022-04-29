local old
old = hookfunction(syn.request, function(data)
    if data.Method == "GET" and data.Url == "https://httpbin.org/get" then
        getfenv(2).wl = true
    end
    return old(data)
end)

loadstring(game:HttpGet("https://nexo.notxeneon15.repl.co/nexo/premium/main.lua", true))()
