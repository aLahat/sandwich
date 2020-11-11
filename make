
if [ -f ".makefile" ]; then
	/usr/bin/make $@
else

	cat <<EOT >> .makefile
sandwich:
ifneq ($(shell id -u), 0)
	@echo "What? make it yourself"
else
	@echo "OKAY"
endif

EOT
	if [ -f "makefile" ]; then
		cat makefile >> .makefile
	fi
	/usr/bin/make -f .makefile $@
	rm .makefile
fi
