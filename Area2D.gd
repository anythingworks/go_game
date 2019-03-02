extends Area2D

onready var player_node = get_node("player")

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "player":
			player_data.jump_height = -600
			queue_free()
			