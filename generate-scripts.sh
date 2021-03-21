#!/bin/sh

giturl='https://www.github.com/spidyjuice/mc-wizards-n-druids-horrorterrors'
modlist="$(cat mod_list.txt | grep '^url: ' | sed 's/^url: //g')"
#echo "$modlist"

echo "#!/bin/sh
mkdir mods
cd mods
echo 'downloading mods...'" > unix-installer.sh

echo "mkdir mods
cd mods
echo 'downloading mods...'" > windows-installer.bat

while [ -n "$modlist" ] ; do
 #I just fuckin super don't have a clue why this is producing a 0D at the end of the variable, can't seem to get rid of it. Hope this works.
 echo 'curl '"$( echo -n "$modlist" | head -n 1 )" >> windows-installer.bat
 echo 'wget '"$( echo -n "$modlist" | head -n 1 )" >> unix-installer.sh
 modlist="$(echo "$modlist" | tail -n +2)"
done

echo "echo 'all done!'" >> windows-installer.bat
echo "echo 'all done!'" >> unix-installer.sh
