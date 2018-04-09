
set containers to do shell script "curl --unix-sock /var/run/docker.sock http://localhost/containers/json | /usr/bin/python -c \"import sys, json; print(len(json.load(sys.stdin)))\""

if containers = "0" then
	return ""
end if

return containers

