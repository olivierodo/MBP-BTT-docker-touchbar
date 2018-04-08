set docker_tcp to "_________YOUR_DOCKER_TCP_ENDPOINT_________"

-- in my case it's look like :
-- ex : set docker_tcp to "192.168.56.103:4243"

on is_running(appName)
	tell application "System Events" to (name of processes) contains appName
end is_running

set safRunning to is_running("VirtualBoxVM")
if safRunning then
	set containers to do shell script "curl -s " & docker_tcp & "/containers/json | /usr/local/bin/node -e \"var data = '', x = process.openStdin().on('data', chunk => { data += chunk }).on('end', () => { try { console.log(JSON.parse(data).length) } catch (e) { console.log(0) } });\""
	
	if containers = "0" then
		return ""
	end if
	return containers
else
	return "Not running"
end if

