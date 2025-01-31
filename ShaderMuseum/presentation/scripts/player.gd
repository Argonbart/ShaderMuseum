extends CharacterBody2D

@export var presenter: Node

const SPEED = 1000.0
const JUMP_VELOCITY = -400.0

var frame_swapping_speed: float = 4.0
var target_position_x: float = 0.0
var is_moving = false
var is_moving_left = false
var is_moving_right = false

var is_fullscreen = false

func _process(delta):
	
	# adjust movement
	if is_moving_left:
		position.x = floor(lerp(position.x, target_position_x, delta * frame_swapping_speed))
	if is_moving_right:
		position.x = ceil(lerp(position.x, target_position_x, delta * frame_swapping_speed))
	if position.x == target_position_x:
		is_moving = false
		is_moving_left = false
		is_moving_right = false
	
	# manuell movement
	#var direction = Input.get_axis("move_left", "move_right")
	#if direction:
		#position.x += direction * SPEED * delta
	
	# frame movement
	if !is_moving:
		if Input.is_action_just_pressed("left_frame"):
			is_moving = true
			if presenter.current_step == 0:
				is_moving_right = true
			else:
				is_moving_left = true
			presenter.previous()
		if Input.is_action_just_pressed("right_frame"):
			is_moving = true
			if presenter.current_step == presenter.steps_to_frame_dict.size() - 1:
				is_moving_left = true
			else:
				is_moving_right = true
			presenter.next()
	
	if Input.is_action_just_pressed("toggle_fullscreen"):
		toggle_fullscreen()

func toggle_fullscreen():
	is_fullscreen = !is_fullscreen
	if is_fullscreen == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if is_fullscreen == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func move_frame_to_the_left():
	target_position_x = position.x - 2000.0

func move_frame_to_the_right():
	target_position_x = position.x + 2000.0

func move_to_frame(index):
	target_position_x = index * 2000.0

func move_to_frame_via_button(current_frame, new_frame):
	is_moving = true
	if new_frame == current_frame:
		return
	if new_frame < current_frame:
		is_moving_left = true
	if new_frame > current_frame:
		is_moving_right = true
	target_position_x = new_frame * 2000.0
