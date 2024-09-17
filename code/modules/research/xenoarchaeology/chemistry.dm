
//chemistry stuff here so that it can be easily viewed/modified

/obj/item/reagent_containers/glass/solution_tray
	name = "solution tray"
	desc = "A small, open-topped glass container for delicate research samples. It sports a re-usable strip for labelling with a pen."
	icon = 'icons/obj/device.dmi'
	icon_state = "solution_tray"
	matter = list(MATERIAL_GLASS = 1)
	w_class = ITEM_SIZE_SMALL
	amount_per_transfer_from_this = 1
	possible_transfer_amounts = list(1, 2)
	volume = 2
	base_name = "solution tray"

/obj/item/storage/box/solution_trays
	name = "solution tray box"
	icon_state = "box"
	illustration = "solution_trays"

/obj/item/storage/box/solution_trays/populate_contents()
	new /obj/item/reagent_containers/glass/solution_tray(src)
	new /obj/item/reagent_containers/glass/solution_tray(src)
	new /obj/item/reagent_containers/glass/solution_tray(src)
	new /obj/item/reagent_containers/glass/solution_tray(src)
	new /obj/item/reagent_containers/glass/solution_tray(src)
	new /obj/item/reagent_containers/glass/solution_tray(src)
	new /obj/item/reagent_containers/glass/solution_tray(src)

/obj/item/reagent_containers/glass/beaker/tungsten
	name = "beaker (tungsten)"
	preloaded_reagents = list("tungsten" = 60)

/obj/item/reagent_containers/glass/beaker/oxygen
	name = "beaker (oxygen)"
	preloaded_reagents = list("oxygen" = 60)

/obj/item/reagent_containers/glass/beaker/sodium
	name = "beaker (sodium)"
	preloaded_reagents = list("sodium" = 60)

/obj/item/reagent_containers/glass/beaker/lithium
	name = "beaker (lithium)"
	preloaded_reagents = list("lithium" = 60)

/obj/item/reagent_containers/glass/beaker/water
	name = "beaker (water)"
	preloaded_reagents = list("water" = 60)

/obj/item/reagent_containers/glass/beaker/fuel
	name = "beaker (fuel)"
	preloaded_reagents = list("fuel" = 60)

/obj/item/reagent_containers/glass/beaker/silicon
	preloaded_reagents = list("silicon" = 60)
