extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
var most_recent = 'none'
var animation_state = IDLE
var jumping = false
var speed = 300
var audio_player = null
var have_jump_upgrade = false



enum {
	JUMP
	FALL
	RUN
	IDLE
}


#func _ready():
#	var plr = AudioStreamPlayer.new()
#
#	plr.connect("finished", KinematicBody2D, "_audio_finished")
#	self.add_child(plr)
#	plr.stream = load('res://untitled.ogg')
#	audio_player = plr

	
func sound_affect(affect):
	audio_player.play()

func _physics_process(delta):
	motion.y +=  24
		
		
	
	var right = Input.is_action_pressed('ui_right')
	var left  = Input.is_action_pressed('ui_left')


	if Input.is_action_just_pressed('ui_right'):
		most_recent = 'right'
	if Input.is_action_just_pressed('ui_left'):
		most_recent = 'left'


	if left:
		go_left()
	if right:
		go_right()
	if left && right:
		if most_recent == 'right':
			go_right()
		if most_recent == 'left':
			go_left()
	if !(left || right):
		idle()
	if is_on_floor():
#		audio_player.stop()
		jumping = false
		if Input.is_action_pressed('ui_up'):
			motion.y = player_data.jump_height
		#	audio_player.play()
			jumping = true
	else:
		if jumping:
			animation_state = JUMP
		else:
			animation_state = FALL


	motion = move_and_slide(motion, UP)

	match animation_state:
		IDLE:
			$Sprite.play('Idle')
		RUN:
			$Sprite.play('Running')
		JUMP:
			$Sprite.play('Jumping')
		FALL:
			$Sprite.play('Falling')
			

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
	

	
	

