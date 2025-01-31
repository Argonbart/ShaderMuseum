extends ColorRect

@export var presenter: Node
@export var markerA: ColorRect
@export var markerB: ColorRect

var is_colliding = false
var is_last_bullet_point = false
var colliding_point = Vector2(-79.0, 436.0)
var normal_point = Vector2(482.0, 313.0)
var last_point = Vector2(131.0, 472.0)

func _process(_delta):
	material.set_shader_parameter("screen_size", get_viewport_rect().size)
	material.set_shader_parameter("mouse_position", get_viewport().get_mouse_position())
	material.set_shader_parameter("pointA", markerA.get_screen_position() + markerA.size / 1.35)
	material.set_shader_parameter("pointB", markerB.get_screen_position() + markerA.size / 1.35)
	
	if presenter.current_frame == 8 && Input.is_action_just_pressed("click"):
		material.set_shader_parameter("active_mouse", !material.get_shader_parameter("active_mouse"))
	
	if is_colliding:
		markerA.position = colliding_point
	if is_last_bullet_point:
		markerA.position = last_point
	if !is_colliding and !is_last_bullet_point:
		markerA.position = normal_point
