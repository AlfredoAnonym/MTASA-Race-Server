local r = getResourceRootElement(getThisResource())

addEventHandler( "onClientResourceStart", r,
function()
	setWorldSpecialPropertyEnabled("randomfoliage", false)
end )

addEventHandler( "onClientResourceStop", r,
function()
	setWorldSpecialPropertyEnabled("randomfoliage", true)
end )

addEvent ( "onClientMapStarting", true )
addEventHandler("onClientMapStarting", getRootElement(),
function()
	setWorldSpecialPropertyEnabled("randomfoliage", false)
end )
