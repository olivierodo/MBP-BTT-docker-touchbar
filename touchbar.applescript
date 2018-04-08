-- Script in progress need to be tested on a mac with docker installed

set docker_tcp to "_________YOUR_DOCKER_TCP_ENDPOINT_________"

-- in my case it's look like :
-- ex : set docker_tcp to "localhost:4243"


set containers to do shell script "curl -s " & docker_tcp & "/containers/json | /usr/local/bin/node -e \"var data = '', x = process.openStdin().on('data', chunk => { data += chunk }).on('end', () => { try { console.log(JSON.parse(data).length) } catch (e) { console.log(0) } });\""

if containers = "0" then
	return ""
end if

return containers

