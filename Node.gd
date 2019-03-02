extends Area2D

onready var player_node = get_node("player")

func _physics_process(delta):

	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "enemy":
			$Sprite.play('attack')