#!/bin/bash
WEB_DIR=/var/www/html
Server_Name=$(hostname |cut -f1 -d".")

echo "<HTML>
<HEAD>
<style>
.titulo{font-size: 1em; color: white; background:#0863CE; padding: 0.1em 0.2em;}
table
{
border-collapse:collapse;
}
table, td, th
{
border:1px solid black;
}
</style>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
</HEAD>
<BODY>"

HOST=$(hostname)
echo "Filesystem usage for host <strong>$HOST</strong><br>
Last updated: <strong>$(date)</strong><br><br>
<table border='1'>
<tr><th class='titulo'>Filesystem</td>
<th class='titulo'>Size</td>
<th class='titulo'>Use %</td>
</tr>" 

# Read the output of df -h line by line
#while read line; do
#echo "<tr><td align='center'>"  
#echo $line | awk '{print $1}' 
#echo "</td><td align='center'>"  
#echo $line | awk '{print $2}'  
#echo "</td><td align='center'>"  
#echo $line | awk '{print $5}'  
#echo "</td></tr>" >> $WEB_DIR/Fnal
#done  < < $(df -h | grep -vi filesystem)
#echo "</table></BODY></HTML>" 



echo "Hardware details for host <strong>$HOST</strong><br>
<table border='1'>
<tr>
<th class='titulo'>UPTIME</td>

<th class='titulo'>RAM</td>
<th class='titulo'>SWAP</td>
<th class='titulo'>CPU</td>
<th class='titulo'>Total disks</td>
</tr>
<tr>
<td>`uptime |awk '{print $3$4$5$6}'`</td>
<td>`free -g |head -2 |awk '{print $2}' |tail -1` </td>
<td>`free -g |tail -1 |awk '{print $2}'`</td>
<td>`cat /proc/cpuinfo |grep -i processor |wc -l` </td>
<td>`fdisk -l |grep -i disk |grep -i sd[a-z] |awk '{print $1$2$3}'`</td>

</tr> "
 
echo "<tr><td>" 
echo `uptime |awk '{print $3$4$5$6}'` 
echo "<tr><td >" 
echo `free -g |head -2 |awk '{print $2}' |tail -1` 
echo "<tr><td >" 
echo `free -g |tail -1 |awk '{print $2}'` 
echo "<tr><td align='center'>" 
echo `cat /proc/cpuinfo |grep -i processor |wc -l` 
echo "<tr><td align='center'>" 
echo `cat /etc/profile.d/timeout.sh` 
echo "</td><td align='center'>" 
echo `cat /etc/profile.d/timeout.csh` 
echo "</td><td align='center'>" 
echo `fdisk -l |grep -i disk |grep -i sd[a-z] |awk '{print $1$2$3}'` 
echo "</td><td align='center'>" 
echo `cat /etc/sssd/sssd.conf |grep -i -o $Server_Name` 
echo "</td></tr>" 

