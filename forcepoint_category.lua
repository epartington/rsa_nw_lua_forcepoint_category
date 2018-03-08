local lua_forcepoint_category = nw.createParser("lua_forcepoint_category", "forcepoint category mapper:2018.02.06")
--[[
    DESCRIPTION
        Map forcepoint_security and event.type to category
    AUTHOR
    	eric.partington@rsa.com 
    VERSION
		2018.02.06  -	start dev on forcepoint category mapping
    DEPENDENCIES
        None
--]]

local forcepointcategory = ({
	["1"] = "Adult Material",
	["2"] = "Business and Economy",
	["3"] = "Education",
	["4"] = "Government",
	["5"] = "News and Media",
	["6"] = "Religion",
	["7"] = "Society and Lifestyles",
	["8"] = "Special Events",
	["9"] = "Information Technology",
	["10"] = "Abortion",
	["11"] = "Advocacy Groups",
	["12"] = "Entertainment",
	["13"] = "Gambling",
	["14"] = "Games",
	["15"] = "Illegal or Questionable",
	["16"] = "Job Search",
	["17"] = "Shopping",
	["18"] = "Sports",
	["19"] = "Tasteless",
	["20"] = "Travel",
	["21"] = "Vehicles",
	["22"] = "Violence",
	["23"] = "Weapons",
	["24"] = "Drugs",
	["25"] = "Militancy and Extremist",
	["26"] = "Intolerance",
	["27"] = "Health",
	["28"] = "Information Technology",
	["29"] = "Productivity",
	["64"] = "User-Defined",
	["65"] = "Adult Material",
	["66"] = "Adult Material",
	["67"] = "Adult Material",
	["68"] = "Business and Economy",
	["69"] = "Education",
	["70"] = "Entertainment",
	["72"] = "Government",
	["73"] = "Government",
	["74"] = "Internet Communication",
	["75"] = "Information Technology",
	["76"] = "Information Technology",
	["78"] = "Information Technology",
	["79"] = "Internet Communication",
	["80"] = "Information Technology",
	["81"] = "News and Media",
	["82"] = "Religion",
	["83"] = "Religion",
	["84"] = "Society and Lifestyles",
	["85"] = "Society and Lifestyles",
	["86"] = "Society and Lifestyles",
	["87"] = "Society and Lifestyles",
	["88"] = "Drugs",
	["89"] = "Drugs",
	["90"] = "Drugs",
	["91"] = "Internet Communication",
	["92"] = "Abortion",
	["93"] = "Abortion",
	["94"] = "Adult Material",
	["95"] = "Adult Material",
	["96"] = "Productivity",
	["97"] = "Education",
	["98"] = "Productivity",
	["99"] = "Productivity",
	["100"] = "Productivity",
	["101"] = "Shopping",
	["102"] = "Shopping",
	["103"] = "Society and Lifestyles",
	["107"] = "Sports",
	["108"] = "Bandwidth",
	["109"] = "Bandwidth",
	["110"] = "Productivity",
	["111"] = "Drugs",
	["112"] = "Productivity",
	["113"] = "Bandwidth",
	["114"] = "Bandwidth",
	["115"] = "Bandwidth",
	["116"] = "Bandwidth",
	["117"] = "Society and Lifestyles",
	["118"] = "Education",
	["121"] = "Education",
	["122"] = "Social Organizations",
	["123"] = "Social Organizations",
	["124"] = "Social Organizations",
	["125"] = "Social Organizations",
	["126"] = "Security",
	["128"] = "Security",
	["138"] = "Information Technology",
	["146"] = "Miscellaneous",
	["147"] = "Miscellaneous",
	["148"] = "Miscellaneous",
	["149"] = "Miscellaneous",
	["150"] = "Miscellaneous",
	["151"] = "Miscellaneous",
	["152"] = "Miscellaneous",
	["153"] = "Miscellaneous",
	["154"] = "Security",
	["156"] = "Miscellaneous",
	["164"] = "Security",
	["166"] = "Security",
	["167"] = "Security",
	["172"] = "Security",
	["191"] = "Extended Protection",
	["192"] = "Extended Protection",
	["193"] = "Extended Protection",
	["194"] = "Extended Protection",
	["195"] = "Internet Communication",
	["196"] = "Internet Communication",
	["200"] = "Information Technology",
	["201"] = "Information Technology",
	["202"] = "Parked Domain",
	["203"] = "Business and Economy",
	["204"] = "Society and Lifestyles",
	["205"] = "Security",
	["206"] = "Security",
	["207"] = "Security",
	["208"] = "Bandwidth",
	["209"] = "Bandwidth",
	["210"] = "Bandwidth",
	["211"] = "Bandwidth",
	["212"] = "Extended Protection",
	["213"] = "Security",
	["214"] = "Security",
	["215"] = "Information Technology",
	["216"] = "Security",
	["217"] = "Security",
	["218"] = "Security",
	["219"] = "Security",
	["220"] = "Security",
	["221"] = "Extended Protection",
	["222"] = "Collaboration - Office",
	["223"] = "Collaboration - Office",
	["224"] = "Collaboration - Office",
	["225"] = "Collaboration - Office",
	["226"] = "Collaboration - Office",
	["227"] = "Information Technology",
	["228"] = "Information Technology",
	["1500"] = "Social Web - Facebook",
	["1501"] = "Social Web - LinkedIn",
	["1502"] = "Social Web - LinkedIn",
	["1503"] = "Social Web - LinkedIn",
	["1504"] = "Social Web - LinkedIn",
	["1505"] = "Social Web - Facebook",
	["1506"] = "Social Web - Facebook",
	["1507"] = "Social Web - Facebook",
	["1508"] = "Social Web - Facebook",
	["1509"] = "Social Web - Facebook",
	["1510"] = "Social Web - Facebook",
	["1511"] = "Social Web - YouTube",
	["1512"] = "Social Web - YouTube",
	["1513"] = "Social Web - Facebook",
	["1514"] = "Social Web - Facebook",
	["1516"] = "Social Web - Facebook",
	["1517"] = "Social Web - Facebook",
	["1518"] = "Social Web - Facebook",
	["1519"] = "Social Web - Twitter",
	["1520"] = "Social Web - Twitter",
	["1521"] = "Social Web - Twitter",
	["1523"] = "Social Web - YouTube",
	["1524"] = "Social Web - Facebook",
	["1525"] = "Social Web - YouTube",
	["1526"] = "Social Web - Twitter",
	["1527"] = "Social Web - LinkedIn",
	["1528"] = "Social Web - Various",
	["1529"] = "Social Web - Various",
	["1530"] = "Social Web - Various",
	["1531"] = "Social Web - Various",
	["1801"] = "Non-HTTP",
	["1899"] = "User-Defined",
	["1900"] = "User-Defined",
	["1901"] = "Productivity",
	["1902"] = "Collaboration - Office",
	["1903"] = "User-Defined",
	["1904"] = "User-Defined",
	["1905"] = "User-Defined",
	["1906"] = "User-Defined",
	["1907"] = "User-Defined",
	["1908"] = "User-Defined",
	["1909"] = "Productivity",
	["1910"] = "User-Defined",
	["1911"] = "User-Defined",
	["1912"] = "Collaboration - Office"

})
	
local devices_types = {
	"forcepoint_security"
}

-- Write meta into the following meta key(s)
lua_forcepoint_category:setKeys({
	nwlanguagekey.create("category",nwtypes.Text),
})

function lua_forcepoint_category.onBegin()
    deviceType = nil
    eventType = nil
end

function check_meta(eventType)
	local category = nil
	
	if forcepointcategory[eventType] then
		category = forcepointcategory[eventType]
	end
	
	return category
end

function lua_forcepoint_category:doCheck()
	local forcepointCategory = nil
	
	if deviceType and eventType then
		for i, dtype in ipairs(devices_types) do
			if dtype == deviceType then
				--comment
				--if deviceType then  nw.logInfo("forcepoint - deviceType: " .. deviceType) end
				
				-- check for matching category
				forcepointCategory = check_meta(eventType)
					
				-- if this is not nil then we have something matched
				if forcepointCategory then
					--comment
					--if forcepointCategory then  nw.logInfo("forcepoint - category: " .. forcepointCategory) end
					nw.createMeta(self.keys["category"], forcepointCategory)
				end
			end
		end
	end	
end

function lua_forcepoint_category:onDeviceType(idx, vlu)
    deviceType = vlu
    self:doCheck()
end

function lua_forcepoint_category:onEventType(idx, vlu)
    eventType = vlu
    self:doCheck()
end

-- declare what tokens and events we want to match
lua_forcepoint_category:setCallbacks({
    [nwevents.OnSessionBegin] = lua_forcepoint_category.onBegin,
    [nwlanguagekey.create("device.type", nwtypes.Text)] = lua_forcepoint_category.onDeviceType, 
    [nwlanguagekey.create("event.type", nwtypes.Text)] = lua_forcepoint_category.onEventType      
})