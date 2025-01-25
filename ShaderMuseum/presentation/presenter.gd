extends Node

@export var player: CharacterBody2D
@export var frame: Array[Node2D]

var current_frame: int = 0
var current_step: int = 0

var steps_to_frame_dict: Dictionary = {
	0 : 0,
	1 : 1,
	2 : 1,
	3 : 1,
	4 : 1,
	5 : 1,
	6 : 1,
	7 : 1,
	8 : 1,
	9 : 1,
	10 : 1,
	11 : 1,
	12 : 2,
}

func _ready() -> void:
	print("Frame: ", current_frame, " - Step: ", current_step)

func next():
	current_step += 1
	if current_step > steps_to_frame_dict.size() - 1:
		var max_index = 0
		current_step = steps_to_frame_dict.keys()[max_index]
		current_frame = steps_to_frame_dict.values()[max_index]
		player.move_to_frame(current_frame)
	if steps_to_frame_dict[current_step] != current_frame:
		current_frame += 1
		player.move_frame_to_the_right()
	execute_step()
	print("Frame: ", current_frame, " - Step: ", current_step)

func previous():
	current_step -= 1
	if current_step < 0:
		var max_index = steps_to_frame_dict.size() - 1
		current_step = steps_to_frame_dict.keys()[max_index]
		current_frame = steps_to_frame_dict.values()[max_index]
		player.move_to_frame(current_frame)
	if steps_to_frame_dict[current_step] != current_frame:
		current_frame -= 1
		player.move_frame_to_the_left()
	execute_step()
	print("Frame: ", current_frame, " - Step: ", current_step)

func execute_step():
	match current_step:
		0:
			pass	# title
		1:
			# frame 1
			frame[current_frame].get_node("Text").text = ""
			frame[current_frame].get_node("Code").text = ""
			frame[current_frame].get_node("Code").visible = false
		2:
			frame[current_frame].get_node("Text").text = "- Englisch \"shade\""
		3:
			frame[current_frame].get_node("Text").text = "- Englisch \"shade\"\n- Rendering-Effekte"
		4:
			frame[current_frame].get_node("Text").text = "- Englisch \"shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D"
		5:
			frame[current_frame].get_node("Text").text = "- Englisch \"shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU"
		6:
			frame[current_frame].get_node("Text").text = "- Englisch \"shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex"
			frame[current_frame].get_node("Code").visible = false
		7:
			frame[current_frame].get_node("Text").text = "- Englisch \"shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:"
			frame[current_frame].get_node("Code").visible = true
		8:
			# code point
			frame[current_frame].get_node("Text").text = "- Englisch \"shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:\n\n- Vertex Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n\n}"
			frame[current_frame].get_node("Shader").position.y = -300
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered", false)
			frame[current_frame].get_node("Shader").time_passed = 0.0
		9:
			# code point
			frame[current_frame].get_node("Text").text = "- Englisch \"shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:\n\n- Vertex Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n	VERTEX.y += 50.0 * TIME;\n}"
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered", true)
		10:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Englisch \"shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:\n\n- Vertex Shader\n- Fragment Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n	VERTEX.y += 50.0 * TIME;\n\nvoid fragment() {\n\n}"
			frame[current_frame].get_node("Shader").position.y = -300
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered", false)
			frame[current_frame].get_node("Shader").time_passed = 0.0
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered_2", false)
		11:
			# code point
			frame[current_frame].get_node("Text").text = "- Englisch \"shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:\n\n- Vertex Shader\n- Fragment Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n	VERTEX.y += 50.0 * TIME;\n\nvoid fragment() {\n	COLOR = vec4(1.0, 0.0, 0.0, 1.0);\n}"
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered_2", true)
			frame[current_frame].get_node("Code").visible = true
		12:
			# frame 2
			pass
