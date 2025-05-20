function main()
	' This interface is the preferred way for JavaScript content to communicate with its parent application.
	' https://brightsign.atlassian.net/wiki/x/-gAeG
	mp = CreateObject("roMessagePort")

	' Create HTML Widget which is defined below in its own function
	widget = CreateHTMLWidget(mp)
'	widget.SetTransform("rot90") ' Put the widget in portrait mode
	widget.Show()

	' Enable SSH
	enableSSH()

	' Event Loop to view the events that are being sent from the HTML content.
	' The roHtmlWidgetEvent object is sent to the message port when an event occurs in the HTML content.
	while true
		msg = wait(0,mp)
		print "msg received - type=";type(msg)
		if type(msg) = "roHtmlWidgetEvent" then
			print "msg: ";msg
		end if
	end while
end function

function CreateHTMLWidget(mp as object) as object
	' Get Screen Resolution
	' https://brightsign.atlassian.net/wiki/x/SQUYFg
	vidmode = CreateObject("roVideoMode")
	width = vidmode.GetResX()
	height = vidmode.GetResY()

	sm=vidmode.GetScreenModes()
	sm[0].transform = "90"
'	sm[0].video_mode="1080x1920x30p"
	sm[0].video_mode="2160x3840x30p" ' needed to make video look good
	vidmode.SetScreenModes(sm)

	' https://brightsign.atlassian.net/wiki/x/HwUYFg
	r = CreateObject("roRectangle",0,0,1080,1920)

	' Create HTML Widget config
	' https://brightsign.atlassian.net/wiki/spaces/DOC/pages/370672896/roHtmlWidget#Initialization-Parameters
	config = {
		nodejs_enabled: true
		url: "file:///sd:/dist/index.html"
		inspector_server: {
			port: 2999
		}
		port: mp
	}

	' Create HTML Widget
	' https://brightsign.atlassian.net/wiki/x/AAUYFg
	h = CreateObject("roHtmlWidget",r,config)
	return h
end function

function enableSSH()
	regSSH = CreateObject("roRegistrySection", "networking")
	
	if type(regSSH) = "roRegistrySection" then
		regSSH.Write("ssh","22")
	endif

	n = CreateObject("roNetworkConfiguration", 0)
	n.SetLoginPassword("password")
	n.Apply()

	regSSH.Flush()
end function