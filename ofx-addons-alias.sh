#!/bin/sh
cd `dirname $0`

dir_addons=$(cd ../addons; pwd) # {OFRoot}/addons
dir_aliases=$(cd $(dirname $0); pwd)  # {OFRoot}/addons-alias

num_ofx_addons=0
num_skipped_addons=0

cd $dir_addons

for ofx in $(cd $dir_addons; ls | grep -e '^ofx[A-Z0-9]')
do
	# $ofx is a directory name e.g. ofx3DModelLoader
	
	if [ ! -d $ofx ]
	then
	    continue # if it's not a directory
	fi
	
	the_name_without_ofx=`echo $ofx | sed -e s/^ofx//` # 3DModelLoader
	
	# check whether the alias already exists or not
	if [ -f $dir_aliases/$the_name_without_ofx ];
	then
		echo "---"
		echo "["$ofx"]"
		echo "file already exists, skipped creating an alias.\n"
		num_skipped_addons=`expr $num_skipped_addons + 1`
		continue
	fi
 
	
	# alias source
	path=$dir_addons/$ofx # {OFRoot}/addons/ofx3DModelLoader
	script='(POSIX file "'$path'") as string' # e.g. Macintosh HD:Users:motoishmz:Desktop:OF008:addons:ofx3DModelLoader
	src_HFS_path=`osascript -e "$script"` 
	
	# alias dest
	path=$dir_aliases # {OFRoot}/addons-alias (a directory which will contains aliases)
	script='(POSIX file "'$path'") as string'
	dst_HFS_path=`osascript -e "$script"` # e.g. Macintosh HD:Users:motoishmz:Desktop:OF008:addons-alias:
	
	# creating an alias
	echo "---"
	echo "["$ofx"]"
	script='tell application "Finder" to make alias file to alias "'$src_HFS_path'" at "'$dst_HFS_path'"'
	osascript -e "$script"
	
	# renaming the alias to without-ofx-prefix style
	before_abs_path=$dir_aliases/$ofx # {OFRoot}/addons-alias/3DModelLoader
	after_abs_path=$dir_aliases/$the_name_without_ofx
	
	`mv $before_abs_path $after_abs_path`
	echo "\nCreated '"$the_name_without_ofx"' as the alias of "$ofx"\n"
	
	num_ofx_addons=`expr $num_ofx_addons + 1`
done

echo "\n\n\n"
echo "･゜･*:.｡..:* created "$num_ofx_addons" aliases ･'｡. .｡.:*･゜･*"
echo "･゜･*:.｡..:* skipped "$num_skipped_addons" addons ･'｡. .｡.:*･゜･*"
echo "\n\n"
