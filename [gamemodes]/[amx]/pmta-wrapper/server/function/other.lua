--Other functions
-- TickCount
function GetTickCount( amx )
	return getTickCount ();
end
-- Chat
function OutputChatBox( amx, player, text, r, g, b, colorCoded )
	return outputChatBox( text, player, r, g, b, colorCoded );
end

function OutputChatBoxToAll( amx, text, r, g, b, colorCoded )
	return outputChatBox( text, getRootElement(), r, g, b, colorCoded );
end

-- GUI
function ShowCursor( amx, player, show, toggleControls )
	return showCursor( player, show, toggleControls );
end

function IsCursorShowing( amx, player )
	return isCursorShowing(player);
end

-- Explosion
function CreateExplosion( amx, x, y, z, etype, creator )
	if creator == false then
		return createExplosion(x, y, z, etype, nil);
	else
		return createExplosion(x, y, z, etype, creator);
	end
end

-- Timers
function SetTimer(amx, fnName, interval, repeats, fmt, ...)
	local vals = { ... }
	for i,val in ipairs(vals) do
		if fmt:sub(i, i) == 's' then
			vals[i] = readMemString(amx, val)
		else
			vals[i] = amx.memDAT[val]
		end
	end
	
	if repeats == 0 then
		local timer = setTimer(procCallInternal, interval, 0, amx.name, fnName, unpack(vals))
		return addElem(g_Timers, timer);
	else
		local timer = setTimer(procCallInternal, interval, repeats, amx.name, fnName, unpack(vals))
		return -1;
	end
end

function KillTimer(amx, timer)
	killTimer(timer);
end

-- Screen size
function GetScreenSize( amx, player, refW, refH )
	writeMemInt( amx, refW, tonumber(getElementData(player, "screenWidth")));
	writeMemInt( amx, refH, tonumber(getElementData(player, "screenHeight")));
	return true;
end

-- Mathematics

function acos(amx, f)
	return float2cell(math.acos(f))
end


function asin(amx, f)
	return float2cell(math.asin(f))
end


function atan(amx, f)
	return float2cell(math.atan(f))
end

--DataBases

function atan2(amx, x, y)
	return float2cell(math.atan2(y, x))
end


function db_close(amx, db)
	sqlite3CloseDB(amx.cptr, db)
end


function db_free_result(amx, dbResultID)
	amx.dbresults[dbResultID] = nil
end


function db_field_name(amx, dbresult, fieldIndex, outbuf, maxlength)
	local colname = dbresult.columns[fieldIndex+1]
	if #colname < maxlength then
		writeMemString(amx, outbuf, colname)
		return true
    end
    return false
end


function db_get_field(amx, dbresult, fieldIndex, outbuf, maxlength)
	if dbresult[dbresult.row] then
        local data = dbresult[dbresult.row][fieldIndex+1]
        if #data < maxlength then
			writeMemString(amx, outbuf, data)
			return true
		end
	end
    return false
end


function db_get_field_assoc(amx, dbresult, fieldName, outbuf, maxlength)
	local fieldIndex = table.find(dbresult.columns, fieldName)
	return fieldIndex and db_get_field(amx, dbresult, fieldIndex-1, outbuf, maxlength)
end


function db_next_row(amx, dbresult)
	dbresult.row = dbresult.row + 1
end


function db_num_fields(amx, dbresult)
	return #dbresult.columns
end


function db_num_rows(amx, dbresult)
	return #dbresult
end


function db_open(amx, dbName)
	return sqlite3OpenDB(amx.cptr, dbName)
end


function db_query(amx, db, query)
	local dbresult = sqlite3Query(amx.cptr, db, query)
	if type(dbresult) == 'table' then
		dbresult.row = 1
		return table.insert(amx.dbresults, dbresult)
	end
	return 0
end


function floatstr(amx, str)
	return float2cell(tonumber(str) or 0)
end
-----------------------------------

function format(amx, outBuf, outBufSize, fmt, ...)
	local args = { ... }
	local i = 0
        
	fmt = fmt:gsub('[^%%]%%$', '%%%%'):gsub('%%i', '%%d')
	for c in fmt:gmatch('%%[%-%d%.]*(%*?%a)') do
		i = i + 1
		if c:match('^%*') then
			c = c:sub(2)
			table.remove(args, i)
		end
		if c == 'd' then
			args[i] = amx.memDAT[args[i]]
		elseif c == 'f' then
			args[i] = cell2float(amx.memDAT[args[i]])
		elseif c == 's' then
			args[i] = readMemString(amx, args[i])
		else
			i = i - 1
		end
    end
    fmt = fmt:gsub('(%%[%-%d%.]*)%*(%a)', '%1%2')
    local result = fmt:format(unpack(args))
    if #result+1 <= outBufSize then
		writeMemString(amx, outBuf, result)
	end
end

function DisplayInfo( amx, player, str )
	outputChatBox("client " .. tostring(player) .. " text " .. str); 
	local id = guiWrap(player, "guiCreateLabel", -1, 0.1, 0.1, 0.9, 0.9, str, true);
	return id;	
end

function ChangeInfo( amx, player, info, str )
	guiWrap(player, "guiSetText", info, "dsfasdfasdf");
end



--function DisplayInfo( amx, player, str, out )
--	setTimer(_DisplayInfo, 50, 1, amx, player, str, out);
--end


