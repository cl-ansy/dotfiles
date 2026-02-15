for dir in $(realpath ./home/.config/*);
do
	echo "Linking ${dir} to ~/.config";
	ln -s $dir ~/.config;
done

