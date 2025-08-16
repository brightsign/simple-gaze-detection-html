function main()
	mp = CreateObject("roMessagePort")

	enableSSH()

	while true
		msg = wait(0,mp)
		print "msg received - type=";type(msg)
        if type(msg) = "roControlDown" and stri(msg.GetSourceIdentity()) = stri(m.svcPort.GetIdentity()) then
          if msg.GetInt() = 12 then
            stop
          end if
        end if
    	if type(msg) = "roHtmlWidgetEvent" then
			print "msg: ";msg
		end if
	end while
end function


function enableSSH()
	regSSH = CreateObject("roRegistrySection", "networking")

	if type(regSSH) = "roRegistrySection" then
		regSSH.Write("ssh","22")
	endif

	n = CreateObject("roNetworkConfiguration", 0)
	n.SetLoginPassword("none")
	n.Apply()

	regSSH.Flush()
end function
