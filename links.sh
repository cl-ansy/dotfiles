for dir in $(realpath ./.config/*);
do
	echo "Linking ${dir} to ~/.config";
	ln -s $dir ~/.config;
done

