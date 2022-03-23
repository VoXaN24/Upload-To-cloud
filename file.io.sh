#/bin/bash/
echo 'Enter THE FULL PATH of the file'
read path
url=$(curl -F "file=@$path" https://file.io| jq -r '.link')
filename=$(printf '%b' "${path//%/\\x}")
myfilesize=$(wc -c "$path" | awk '{print $1}')
echo "filename : $filename"
echo "size in byte : $myfilesize"
echo "Link : $url"
