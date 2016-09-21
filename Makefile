########################
### --- Makefile --- ###
########################

# Some Makefile variables
PREFIX_TAG 		  = testtag
PREFIX_VARIABLE1 = variable1_value
PREFIX_VARIABLE2 = variable2_value 
PREFIX_VARIABLE3 = variable3_value 
PREFIX_VARIABLE4 = variable4_value 

### This part extracts Makefile variables
### truncates the PREFIX and passes in <key>=<key value> format to EXPORT_PREFIX
VAR_PREFIX    = $(shell echo '$(.VARIABLES)' |  awk -v RS=' ' '/PREFIX_/' | sed 's/PREFIX_//g' )
EXPORT_PREFIX = $(foreach v,$(VAR_PREFIX),$(v)="$(PREFIX_$(v))")

run : build
	@$(EXPORT_PREFIX) ./scripts/createWD.sh
	@./bin/Binary $(PREFIX_VARIABLE1) $(PREFIX_VARIABLE2)

display_vars :
	@ echo "Test."
	@ echo -e "VAR_PREFIX:    \n$(VAR_PREFIX)"
	@ echo -e "EXPORT_PREFIX: \n$(EXPORT_PREFIX)"

###############################

build : 
	@ cd src; make all 

clean :
	rm -f ./lib/*
	rm -f ./src/.depend_cpp
	touch ./src/.depend_cpp
