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
	5 : 2,
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
	16 : 3,
	17 : 3,
	18 : 3,
	19 : 3,
	20 : 3,
	21 : 4,
	22 : 4,
	23 : 4,
	24 : 4,
	25 : 4,
	26 : 4,
	27 : 5,
	28 : 5,
	29 : 5,
	30 : 5,
	31 : 5,
	32 : 5,
	33 : 5,
	34 : 5,
	35 : 5,
	36 : 5,
	37 : 6,
	38 : 6,
	39 : 6,
	40 : 6,
	41 : 6,
	42 : 6,
	43 : 6,
	44 : 6,
	45 : 7,
	46 : 7,
	47 : 7,
	48 : 8,
	49 : 9,
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
			frame[current_frame].get_node("Text").text = "- Was sind Shader?\n- Sprite Animationen"
		4:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Was sind Shader?\n- Sprite Animationen\n- Schatten"
		5:
			# frame 2
			frame[current_frame].get_node("Text").text = ""
			frame[current_frame].get_node("Code").text = ""
			frame[current_frame].get_node("Code").visible = false
		6:
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\""
		7:
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte"
		8:
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D"
		9:
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU"
		10:
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex"
			frame[current_frame].get_node("Code").visible = false
		11:
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:"
			frame[current_frame].get_node("Code").visible = true
			frame[current_frame].get_node("Code").text = ""
		12:
			# code point
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:\n\n- Vertex Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n\n}"
			frame[current_frame].get_node("Shader").position.y = 0
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered", false)
			frame[current_frame].get_node("Shader").time_passed = 0.0
		13:
			# code point
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:\n\n- Vertex Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n	VERTEX.y += 50.0 * TIME;\n}"
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered", true)
		14:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Englisch \"to shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:\n\n- Vertex Shader\n- Fragment Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n	//VERTEX.y += 50.0 * TIME;\n}\n\nvoid fragment() {\n\n}"
			frame[current_frame].get_node("Shader").position.y = 0
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered", false)
			frame[current_frame].get_node("Shader").time_passed = 0.0
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered_2", false)
		15:
			# code point
			frame[current_frame].get_node("Text").text = "- Englisch \"shade\"\n- Rendering-Effekte\n- Häufig 3D, heute 2D\n- Parallelisiert auf GPU\n- Schnell komplex\n- Aufteilung in:\n\n- Vertex Shader\n- Fragment Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n	//VERTEX.y += 50.0 * TIME;\n}\n\nvoid fragment() {\n	COLOR = vec4(1.0, 0.0, 0.0, 1.0);\n}"
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered_2", true)
			frame[current_frame].get_node("Code").visible = true
		16:
			# frame 3
			frame[current_frame].get_node("Text").text = ""
			frame[current_frame].get_node("CPUvsGPU").visible = false
			frame[current_frame].get_node("BlackBox").visible = true
		17:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skript läuft auf CPU\n- Mächtiger\n- Serialisiert\n- Wenige Kerne"
			frame[current_frame].get_node("CPUvsGPU").visible = true
		18:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skript läuft auf CPU\n- Mächtiger\n- Serialisiert\n- Wenige Kerne\n\nShader läuft auf GPU\n- Limitiert\n- Parallelisiert\n- Viele Kerne"
			frame[current_frame].get_node("BlackBox").visible = false
		19:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skript läuft auf CPU\n- Mächtiger\n- Serialisiert\n- Wenige Kerne\n\nShader läuft auf GPU\n- Limitiert\n- Parallelisiert\n- Viele Kerne\n\nKein Gedächtnis zwischen Frames"
		20:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skript läuft auf CPU\n- Mächtiger\n- Serialisiert\n- Wenige Kerne\n\nShader läuft auf GPU\n- Limitiert\n- Parallelisiert\n- Viele Kerne\n\nKein Gedächtnis zwischen Frames\nInput nur über uniforms möglich"
		21:
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
		22:
			# bullet point
			frame[current_frame].get_node("Text").text = "Transformationen:"
			frame[current_frame].get_node("Godot1").visible = false
			frame[current_frame].get_node("Godot2").visible = false
			frame[current_frame].get_node("Godot3").visible = false
			frame[current_frame].get_node("Godot4").visible = false
			frame[current_frame].get_node("Godot5").visible = false
		23:
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
		24:
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
		25:
			# bullet point
			frame[current_frame].get_node("Text").text = "Transformationen:\n- Position\n- Rotation\n- Skalierung"
			animation_ongoing = true
			frame[current_frame].get_node("Godot10").visible = true
			await get_tree().create_timer(0.5).timeout
			frame[current_frame].get_node("Godot11").visible = true
			await get_tree().create_timer(0.5).timeout
			animation_ongoing = false
		26:
			# bullet point
			frame[current_frame].get_node("Text").text ="Transformationen:\n- Position\n- Rotation\n- Skalierung\n- Andere"
			animation_ongoing = true
			frame[current_frame].get_node("Godot12").visible = true
			await get_tree().create_timer(0.5).timeout
			frame[current_frame].get_node("Godot13").visible = true
			await get_tree().create_timer(0.5).timeout
			animation_ongoing = false
		27:
			# frame 5
			frame[current_frame].get_node("Text").text = ""
			frame[current_frame].get_node("Godot1").visible = false
			frame[current_frame].get_node("Godot2").visible = false
			frame[current_frame].get_node("Godot3").visible = false
			frame[current_frame].get_node("Effekt0").visible = false
			frame[current_frame].get_node("Effekt1").visible = false
			frame[current_frame].get_node("Effekt2").visible = false
			frame[current_frame].get_node("Effekt3").visible = false
		28:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Endlose Möglichkeiten"
		29:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Endlose Möglichkeiten\n- Künstlerische Freiheit"
		30:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Endlose Möglichkeiten\n- Künstlerische Freiheit\n- Oft komplizierte Mathematik"
		31:
			frame[current_frame].get_node("Godot1").visible = true
		32:
			frame[current_frame].get_node("Godot2").visible = true
		33:
			frame[current_frame].get_node("Godot3").visible = true
		34:
			frame[current_frame].get_node("Effekt0").visible = true
			frame[current_frame].get_node("Effekt1").visible = true
		35:
			frame[current_frame].get_node("Effekt2").visible = true
		36:
			frame[current_frame].get_node("Effekt3").visible = true
		37:
			# frame 6
			frame[current_frame].get_node("Text").text = ""
			frame[current_frame].get_node("Effekt0").material.set_shader_parameter("reveal_time", 0.0)
			frame[current_frame].get_node("Effekt0").material.set_shader_parameter("changing_over_time", false)
			frame[current_frame].get_node("Code").visible = false
			frame[current_frame].get_node("Legende").visible = false
			frame[current_frame].get_node("Link").visible = false
		38:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Funktionen um Formen zu beschreiben"
		39:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Funktionen um Formen zu beschreiben\n- Definiert Abstand zur Form"
		40:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Funktionen um Formen zu beschreiben\n- Definiert Abstand zur Form\n- Signed = Innen negative Werte"
		41:
			# bullet point
			frame[current_frame].get_node("Code").visible = false
			frame[current_frame].get_node("Effekt0").material.set_shader_parameter("reveal_time", 0.0)
			frame[current_frame].get_node("Text").text = "- Funktionen um Formen zu beschreiben\n- Definiert Abstand zur Form\n- Signed = Innen negative Werte\n- Beispiel Kreis:"
		42:
			# code
			frame[current_frame].get_node("Code").visible = true
			frame[current_frame].get_node("Legende").visible = false
			frame[current_frame].get_node("Effekt0").animate()
			await get_tree().create_timer(2.0).timeout
			animation_ongoing = false
			frame[current_frame].get_node("Effekt0").material.set_shader_parameter("changing_over_time", false)
		43:
			# animation
			frame[current_frame].get_node("Legende").visible = true
			frame[current_frame].get_node("Link").visible = false
		44:
			# link
			frame[current_frame].get_node("Link").visible = true
			frame[current_frame].get_node("Effekt0").material.set_shader_parameter("changing_over_time", true)
		45:
			# frame 7
			frame[current_frame].get_node("Text").visible = true
			frame[current_frame].get_node("Code").visible = false
			frame[current_frame].get_node("Effekt0").visible = false
		46:
			# code exercise
			frame[current_frame].get_node("Text").visible = false
			frame[current_frame].get_node("Code").visible = true
			frame[current_frame].get_node("Effekt0").visible = false
		47:
			# answer
			frame[current_frame].get_node("Text").visible = false
			frame[current_frame].get_node("Code").visible = false
			frame[current_frame].get_node("Effekt0").visible = true
		48:
			# frame 8
			pass
		49:
			# frame 9
			pass
