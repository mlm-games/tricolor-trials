class_name C extends Node # Constants

enum BusNames { # Use get string from enum fn
	Master,
	Music,
	Sfx,
}

const PATHS = {
	CREDITS_SCENE = "uid://bq0gelfcjnqvg",
	SETTINGS_SCENE = "uid://dp42fom7cc3n0",
	MENU_SCENE = "uid://ddl5roo03rvdl",
	END_SCREEN = "uid://o7bist5hmyv6",
	LEVEL_SELECT_SCREEN = "uid://bd2uvvgj5debp",
	LEVEL_SELECT_BUTTON = "uid://cugrjkc77arvj"
}

const Levels : Dictionary[StringName, StringName] = {
	Level0 = "uid://camikithdj24n",
	Level1 = "uid://86j0xclomlw0",
	Level2 = "uid://ddxowna1b0104",
	Level3 = "uid://b8hk5q1vxawdn",
	Level4 = "uid://cfhf5jqh2uod2",
	Level5 = "uid://c5wfxsc0cqbg7",
	Level6 = "uid://6nppn4w5u04p",
	Level7 = "uid://cs8luqu3wkfkb",
	Level8 = "uid://b845lbsie6i4p",
	Level9 = "uid://b6bdvnik3h0hn",
	Level10 = "uid://p7uh2srpr45e",
	Level11 = "uid://coy32asy12ugm",
	#Level12
	#Level13
	#Level14
}


const BlockerButtonSound = preload("uid://csoikfbixp04q")
