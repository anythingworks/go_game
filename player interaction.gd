extends Area2D

onready var sprite_node = get_node("/root/World/enemy/Sprite")

func _physics_process(delta):
#	var bodies = get_overlapping_bodies()
#	for body in bodies:
#		if body.name == "player":
#			sprite_node.play_sprite()
	