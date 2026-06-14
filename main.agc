
// Project: web_image_downloader 
// Created: 2026-05-29

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "web_image_downloader" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

CreateEditBox(1)
SetEditBoxSize(1,600,100)
SetEditBoxPosition(1,400,100)

addvirtualbutton(1,200,600,200)
addvirtualbutton(2,400,600,200)

dim pole_tokenu[ ] as string

do

		
		
	//~ if getvirtualbuttonpressed(1)	
		SetEditBoxText(1,"https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Minecraft_Logo-en.svg/250px-Minecraft_Logo-en.svg.png")
		url$=geteditboxtext(1)
		//~ endif
		
		url$="https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Minecraft_Logo-en.svg/250px-Minecraft_Logo-en.svg.png"

	if GetVirtualButtonPressed(2)	
		pocet_tokenu=CountStringTokens(url$,"/")
		for i=1 to pocet_tokenu
			token$=GetStringToken(url$,"/",i)
			pole_tokenu.insert(token$)
		next i 
		
		
		
		http = CreateHTTPConnection()
		SetHTTPHost(http, pole_tokenu[1], 1)
		//~ zbytek_url$="/wikipedia/commons/thumb/c/cb/Minecraft_Logo-en.svg/250px-Minecraft_Logo-en.svg.png"
		zbytek_url$="/"+pole_tokenu[2]+"/"+pole_tokenu[3]+"/"+pole_tokenu[4]+"/"+pole_tokenu[5]+"/"+pole_tokenu[6]+"/"+pole_tokenu[7]+"/"+pole_tokenu[8]
		GetHTTPFile( http,zbytek_url$ , "raw:C:\pavel_m\agk\AGK Projects\http\media\minecraft_logo.png" )

		repeat
			PRINT(GetHTTPFileProgress(http))
			Sync()
		until GetHTTPFileComplete(http) = 1

		img = LoadImage("raw:C:\pavel_m\agk\AGK Projects\http\media\minecraft_logo.png")

		sprite = CreateSprite(img)
		SetSpritePosition(sprite, 100, 100)
	endif
	
	Sync()
loop

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	function zapis()
		OpenToWrite(1,"raw:C:\pavel_m\agk\AGK Projects\http\media\url.txt")
	
		closefile(1)
	endfunction
	function cteni()
		OpenToRead(1,"raw:C:\pavel_m\agk\AGK Projects\http\media\url.txt")
	
		closefile(1)	
	endfunction