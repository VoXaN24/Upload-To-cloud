#/bin/bash/
#Anonfiles.com
echo 'Enter THE FULL PATH of the file'
read path
url=$(curl -F "file=@$path" https://api.anonfiles.com/upload | jq -r '.data.file.url.short')
filename=$(printf '%b' "${path//%/\\x}")
myfilesize=$(wc -c "$path" | awk '{print $1}')
echo "filename : $filename"
echo "size in byte : $myfilesize"
echo "Short Link : $url"
echo "Long Link: $url/$filename"
