
build : 
	chronicle --config=config.txt --verbose

	# because we would like to be able to wipe the output directory and do a
	# complete rebuild, static resources must be stored externally so they
	# aren't wiped
	[ -h output/img ] || ln -s -T ../img output/img
	[ -h output/attachments ] || ln -s -T ../attachments output/attachments

clean :
	rm -rf output

deploy :
	# rsync to host
	# --copy-links ensures we follow the sym links we create above and copy
	# the contents, not just recreating the symlink on the target host
	rsync \
	    --archive \
	    --verbose \
	    --copy-links \
	    --compress \
	    --delete \
	    output/* \
	    root@tianjara:/var/www/blog/
