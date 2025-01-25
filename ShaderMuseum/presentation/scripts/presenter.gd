extends Node

@export var player: CharacterBody2D
@export var frame: Array[Node2D]

var current_frame: int = 0
var current_step: int = 0

var animation_ongoing = false

var steps_to_frame_dict: Dictionary = {
	0 : 0,
	1 : 1,
	2 : 1,
	3 : 1,
	4 : 1,
	5 : 1,
	6 : 2,
	7 : 2,
	8 : 2,
	9 : 2,
	10 : 2,
	11 : 2,
	12 : 2,
	13 : 2,
	14 : 2,
	15 : 2,
	16 : 2,
	17 : 3,
	18 : 3,
	19 : 3,
	20 : 3,
	21 : 3,
	22 : 4,
	23 : 4,
	24 : 4,
	25 : 4,
	26 : 4,
	27 : 4,
	28 : 5,
}

func _ready() -> void:
	print("Frame: ", current_frame, " - Step: ", current_step)

func next():
	if animation_ongoing:
		return
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
	if animation_ongoing:
		return
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
		2:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Was sind Shader?"
		3:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Was sind Shader?\n- Anwendungen für 2D Shader"
		4:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Was sind Shader?\n- Anwendungen für 2D Shader\n- Sprite Animationen"
		5:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Was sind Shader?\n- Anwendungen für 2D Shader\n- Sprite Animationen\n- Schatten"
		6:
			# frame 2
			frame[current_frame].get_node("Text").text = ""
			frame[current_frame].get_node("Code").text = ""
			frame[current_frame].get_node("Code").visible = false
		7:
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\""
		8:
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte"
		9:
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D"
		10:
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU"
		11:
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex"
			frame[current_frame].get_node("Code").visible = false
		12:
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:"
			frame[current_frame].get_node("Code").visible = true
		13:
			# code point
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:\n\n- Vertex Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n\n}"
			frame[current_frame].get_node("Shader").position.y = 0
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered", false)
			frame[current_frame].get_node("Shader").time_passed = 0.0
		14:
			# code point
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:\n\n- Vertex Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n	VERTEX.y += 50.0 * TIME;\n}"
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered", true)
		15:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:\n\n- Vertex Shader\n- Fragment Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n	VERTEX.y += 50.0 * TIME;\n\nvoid fragment() {\n\n}"
			frame[current_frame].get_node("Shader").position.y = 0
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered", false)
			frame[current_frame].get_node("Shader").time_passed = 0.0
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered_2", false)
		16:
			# code point
			frame[current_frame].get_node("Text").text = "- Englisch \"shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:\n\n- Vertex Shader\n- Fragment Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n	VERTEX.y += 50.0 * TIME;\n\nvoid fragment() {\n	COLOR = vec4(1.0, 0.0, 0.0, 1.0);\n}"
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered_2", true)
			frame[current_frame].get_node("Code").visible = true
		17:
			# frame 3
			frame[current_frame].get_node("Text").text = ""
			frame[current_frame].get_node("CPUvsGPU").visible = false
			frame[current_frame].get_node("BlackBox").visible = true
		18:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skript läuft auf CPU\n- Mächtiger\n- Serialisiert\n- Wenige Kerne"
			frame[current_frame].get_node("CPUvsGPU").visible = true
		19:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skript läuft auf CPU\n- Mächtiger\n- Serialisiert\n- Wenige Kerne\n\nShader läuft auf GPU\n- Limitiert\n- Parallelisiert\n- Viele Kerne"
			frame[current_frame].get_node("BlackBox").visible = false
		20:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skript läuft auf CPU\n- Mächtiger\n- Serialisiert\n- Wenige Kerne\n\nShader läuft auf GPU\n- Limitiert\n- Parallelisiert\n- Viele Kerne\n\nKein Gedächtnis zwischen Frames"
		21:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skript läuft auf CPU\n- Mächtiger\n- Serialisiert\n- Wenige Kerne\n\nShader läuft auf GPU\n- Limitiert\n- Parallelisiert\n- Viele Kerne\n\nKein Gedächtnis zwischen Frames\nInput nur limitiert über uniforms möglich"
		22:
			# frame 4
			frame[current_frame].get_node("Text").text = ""
			frame[current_frame].get_node("Godot1").visible = false
			frame[current_frame].get_node("Godot2").visible = false
			frame[current_frame].get_node("Godot3").visible = false
			frame[current_frame].get_node("Godot4").visible = false
			frame[current_frame].get_node("Godot5").visible = false
			frame[current_frame].get_node("Godot6").visible = false
			frame[current_frame].get_node("Godot7").visible = false
			frame[current_frame].get_node("Godot8").visible = false
			frame[current_frame].get_node("Godot9").visible = false
			frame[current_frame].get_node("Godot10").visible = false
			frame[current_frame].get_node("Godot11").visible = false
			frame[current_frame].get_node("Godot12").visible = false
			frame[current_frame].get_node("Godot13").visible = false
		23:
			# bullet point
			frame[current_frame].get_node("Text").text = "Transformationen:"
			frame[current_frame].get_node("Godot1").visible = false
			frame[current_frame].get_node("Godot2").visible = false
			frame[current_frame].get_node("Godot3").visible = false
			frame[current_frame].get_node("Godot4").visible = false
			frame[current_frame].get_node("Godot5").visible = false
		24:
			# bullet point
			frame[current_frame].get_node("Text").text = "Transformationen:\n- Position"
			animation_ongoing = true
			await get_tree().create_timer(0.5).timeout
			frame[current_frame].get_node("Godot1").visible = true
			await get_tree().create_timer(0.5).timeout
			frame[current_frame].get_node("Godot2").visible = true
			await get_tree().create_timer(0.5).timeout
			frame[current_frame].get_node("Godot3").visible = true
			await get_tree().create_timer(0.5).timeout
			frame[current_frame].get_node("Godot4").visible = true
			await get_tree().create_timer(0.5).timeout
			animation_ongoing = false
			frame[current_frame].get_node("Godot5").visible = true
			frame[current_frame].get_node("Godot6").visible = false
			frame[current_frame].get_node("Godot7").visible = false
			frame[current_frame].get_node("Godot8").visible = false
			frame[current_frame].get_node("Godot9").visible = false
		25:
			# bullet point
			frame[current_frame].get_node("Text").text = "Transformationen:\n- Position\n- Rotation"
			animation_ongoing = true
			frame[current_frame].get_node("Godot6").visible = true
			await get_tree().create_timer(0.5).timeout
			frame[current_frame].get_node("Godot7").visible = true
			await get_tree().create_timer(0.5).timeout
			frame[current_frame].get_node("Godot8").visible = true
			await get_tree().create_timer(0.5).timeout
			frame[current_frame].get_node("Godot9").visible = true
			animation_ongoing = false
		26:
			# bullet point
			frame[current_frame].get_node("Text").text = "Transformationen:\n- Position\n- Rotation\n- Skalierung"
			animation_ongoing = true
			frame[current_frame].get_node("Godot10").visible = true
			await get_tree().create_timer(0.5).timeout
			frame[current_frame].get_node("Godot11").visible = true
			await get_tree().create_timer(0.5).timeout
			animation_ongoing = false
		27:
			# bullet point
			frame[current_frame].get_node("Text").text ="Transformationen:\n- Position\n- Rotation\n- Skalierung\n- Andere"
			animation_ongoing = true
			frame[current_frame].get_node("Godot12").visible = true
			await get_tree().create_timer(0.5).timeout
			frame[current_frame].get_node("Godot13").visible = true
			await get_tree().create_timer(0.5).timeout
			animation_ongoing = false
		28:
			# frame 5
			pass
