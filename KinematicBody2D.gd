extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
var most_recent = 'none'
var animation_state = IDLE
var speed = 250

enum {
	JUMP
	RUN
	IDLE
}


func _physics_process(delta):
	motion.y +=  10
	
	var right = Input.is_action_pressed('ui_right')
	var left  = Input.is_action_pressed('ui_left')
	
	
	if Input.is_action_just_pressed('ui_right'):
		most_recent = 'right'
	if Input.is_action_just_pressed('ui_left'):
		most_recent = 'left'
		
	
	if left:
		go_left()
	if right:
		print('  right')
		go_right()
	if left && right:
		if most_recent == 'right':
			go_right()
		if most_recent == 'left':
			go_left()
	if !(left || right):
		idle()
	if is_on_floor():
		if Input.is_action_pressed('ui_up'):
			motion.y = -300
	else:
		animation_state = JUMP
	
	
	motion = move_and_slide(motion, UP)
	
	match animation_state:
		IDLE:
			$Sprite.play('Idle')
		RUN:
			$Sprite.play('Running')
		JUMP:
			$Sprite.play('Jumping')

func go_right():
	motion.x = speed
	$Sprite.flip_h = false
	animation_state = RUN

func go_left():
	motion.x = -speed
	$Sprite.flip_h = true
	animation_state = RUN
	
func idle():
	motion.x = 0
	animation_state = IDLE
	

	
	

