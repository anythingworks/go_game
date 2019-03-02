extends KinematicBody2D

var motion = Vector2()
var direction_count = 0
var direction = 'left'


func _physics_process(delta):
	
	if motion.x == 0:
		pass
	else:
		$Sprite.play('walk')
	
	var collision = get_slide_collision(0)
	if collision != null:
		if collision.collider_id == 1138:
			$Sprite.play('attack')
	
	motion = move_and_slide(motion)
	
	direction_count += 1
	if (direction_count % 120 == 0):
		switch_direction()
	
	
			
func switch_direction():
	if (motion.x == 0):
		var sw = randi()%2
		match sw:
			0: direction = 'left'
			1: direction = 'right'

	if (direction == 'left'):
		motion.x = 100
		direction = 'right'
	else:
		motion.x = -100
		direction = 'left'
	if (direction == 'left'):
			$Sprite.flip_h = false
	
	if (direction == 'right'):
			$Sprite.flip_h = true
		