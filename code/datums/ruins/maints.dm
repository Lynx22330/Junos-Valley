//YOU MUST UPDATE MAINTS_RUINS.DM! Otherwise, your maps will NOT load! BE SURE you use the NAME variable!
// EXAMPLE:

// NAME = "Maint Oldstorage"

// In the list, you use the name VARIABLE Maint Oldstorage, NOT the datum path name, and NOT its ID.

///Base for all station ruins.
/datum/map_template/ruin/station/maint
	prefix = "maps/MaintsRuins/"
	allow_duplicates = TRUE

///Base for the 3x3 rooms.
/datum/map_template/ruin/station/maint/threexthree
	prefix = "maps/MaintsRuins/3x3/"

/datum/map_template/ruin/station/maint/threexthree/oldstorage
	id = "OldStorage"
	suffix = "3x3_OldStorage.dmm"
	name = "Maint OldStorage"

/datum/map_template/ruin/station/maint/threexthree/oldstorage1
	id = "OldStorage1"
	suffix = "3x3_OldStorage1.dmm"
	name = "Maint OldStorage1"

/datum/map_template/ruin/station/maint/threexthree/oldstorage2
	id = "OldStorage2"
	suffix = "3x3_OldStorage2.dmm"
	name = "Maint OldStorage2"

/datum/map_template/ruin/station/maint/threexthree/oldstorage3
	id = "OldStorage3"
	suffix = "3x3_OldStorage3.dmm"
	name = "Maint OldStorage3"

/datum/map_template/ruin/station/maint/threexthree/oldstorage4
	id = "OldStorage4"
	suffix = "3x3_OldStorage4.dmm"
	name = "Maint OldStorage4"

/datum/map_template/ruin/station/maint/threexthree/oldstorage5
	id = "OldStorage5"
	suffix = "3x3_OldStorage5.dmm"
	name = "Maint OldStorage5"

//Five by Five rooms base.
/datum/map_template/ruin/station/maint/fivexfive
	prefix = "maps/MaintsRuins/5x5/"

/datum/map_template/ruin/station/maint/threexthree/roachchamber
	id = "RoachChamber"
	suffix = "5x5_RoachChamber.dmm"
	name = "Maint RoachChamber"

/datum/map_template/ruin/station/maint/threexthree/bigshower
	id = "BigShower"
	suffix = "5x5_BigShower.dmm"
	name = "Maint BigShower"

/datum/map_template/ruin/station/maint/threexthree/smallworkshop
	id = "SmallWorkshop"
	suffix = "5x5_SmallWorkshop.dmm"
	name = "Maint SmallWorkshop"
