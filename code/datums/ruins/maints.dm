//YOU MUST UPDATE MAINTS_RUINS.DM! Otherwise, your maps will NOT load! BE SURE you use the NAME variable!
// EXAMPLE:

// NAME = "Maint Oldstorage"

// In the list, you use the name VARIABLE Maint 3x3Oldstorage, NOT the datum path name, and NOT its ID.
// For random rooms without any set theme, call it [size]OldStorage. (3x3OldStorage for example)
// Make sure to NOT have the same names, otherwise you will break template and map loading.
// If you do have a theme for your room, please name it appropriately.

///Base for all station ruins.
/datum/map_template/ruin/station/maint
	prefix = "maps/MaintsRuins/"
	allow_duplicates = TRUE

///Base for the 3x3 rooms.
/datum/map_template/ruin/station/maint/threexthree
	prefix = "maps/MaintsRuins/3x3/"

/datum/map_template/ruin/station/maint/threexthree/oldstorage
	id = "3x3OldStorage"
	suffix = "3x3_OldStorage.dmm"
	name = "Maint 3x3OldStorage"

/datum/map_template/ruin/station/maint/threexthree/oldstorage1
	id = "3x3OldStorage1"
	suffix = "3x3_OldStorage1.dmm"
	name = "Maint 3x3OldStorage1"

/datum/map_template/ruin/station/maint/threexthree/oldstorage2
	id = "3x3OldStorage2"
	suffix = "3x3_OldStorage2.dmm"
	name = "Maint 3x3OldStorage2"

/datum/map_template/ruin/station/maint/threexthree/oldstorage3
	id = "3x3OldStorage3"
	suffix = "3x3_OldStorage3.dmm"
	name = "Maint 3x3OldStorage3"

/datum/map_template/ruin/station/maint/threexthree/oldstorage4
	id = "3x3OldStorage4"
	suffix = "3x3_OldStorage4.dmm"
	name = "Maint 3x3OldStorage4"

/datum/map_template/ruin/station/maint/threexthree/oldstorage5
	id = "3x3OldStorage5"
	suffix = "3x3_OldStorage5.dmm"
	name = "Maint 3x3OldStorage5"

//Five by Five rooms base.
/datum/map_template/ruin/station/maint/fivexfive
	prefix = "maps/MaintsRuins/5x5/"

/datum/map_template/ruin/station/maint/fivexfive/roachchamber
	id = "RoachChamber"
	suffix = "5x5_RoachChamber.dmm"
	name = "Maint RoachChamber"

/datum/map_template/ruin/station/maint/fivexfive/bigshower
	id = "BigShower"
	suffix = "5x5_BigShower.dmm"
	name = "Maint BigShower"

/datum/map_template/ruin/station/maint/fivexfive/smallworkshop
	id = "SmallWorkshop"
	suffix = "5x5_SmallWorkshop.dmm"
	name = "Maint SmallWorkshop"

/datum/map_template/ruin/station/maint/fivexfive/randomclown
	id = "RandomClown"
	suffix = "5x5_RandomClown.dmm"
	name = "Maint RandomClown"

/datum/map_template/ruin/station/maint/fivexfive/singulartree
	id = "SingularTree"
	suffix = "5x5_SingularTree.dmm"
	name = "Maint SingularTree"

/datum/map_template/ruin/station/maint/fivexfive/smallarcade
	id = "SmallArcade"
	suffix = "5x5_SmallArcade.dmm"
	name = "Maint SmallArcade"

/datum/map_template/ruin/station/maint/fivexfive/teadollroom
	id = "TeaDollRoom"
	suffix = "5x5_TeaDollRoom.dmm"
	name = "Maint TeaDollRoom"

/datum/map_template/ruin/station/maint/fivexfive/giantbathroom
	id = "GiantBathroom"
	suffix = "5x5_GiantBathroom.dmm"
	name = "Maint GiantBathroom"

/datum/map_template/ruin/station/maint/fivexfive/oldstorage
	id = "5x5OldStorage"
	suffix = "5x5_OldStorage.dmm"
	name = "Maint 5x5OldStorage"

/datum/map_template/ruin/station/maint/fivexfive/oldstorage1
	id = "5x5OldStorage1"
	suffix = "5x5_OldStorage1.dmm"
	name = "Maint 5x5OldStorage1"

