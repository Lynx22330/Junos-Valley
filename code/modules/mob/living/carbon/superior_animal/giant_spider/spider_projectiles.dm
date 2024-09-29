/obj/item/projectile/spider_webbing
	name = "Spewed Spider Web"
	icon = 'icons/obj/seeds.dmi'
	icon_state = "alien2"
	hitscan = TRUE

/obj/item/projectile/spider_webbing/on_hit(atom/target)
	. = ..()
	if(isliving(target))
		if (!testing)
			var/mob/living/L = target
			L.AdjustWeakened(3)
			new /obj/effect/spider
			visible_message("<span class='warning'>\The [src] wraps around [L.name], pinning them to the ground!</span>")
