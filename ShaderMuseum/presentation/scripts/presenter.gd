extends Node

@export var player: CharacterBody2D
@export var frame: Array[Node2D]
@export var buttons: Array[Button]

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
	6 : 1,
	7 : 1,
	8 : 1,

	9 : 2,
	10 : 2,
	11 : 2,
	12 : 2,
	13 : 2,
	14 : 2,
	15 : 2,
	16 : 2,
	17 : 2,
	18 : 2,

	19 : 3,
	20 : 3,
	21 : 3,
	22 : 3,
	23 : 3,
	24 : 3,
	25 : 3,
	26 : 3,
	27 : 3,
	28 : 3,
	29 : 3,

	30 : 4,
	31 : 4,
	32 : 4,
	33 : 4,
	34 : 4,
	35 : 4,
	36 : 4,

	37 : 5,
	38 : 5,
	39 : 5,
	40 : 5,
	41 : 5,
	42 : 5,
	43 : 5,
	44 : 5,
	45 : 5,
	46 : 5,
	47 : 5,
	48 : 5,
	49 : 5,
	50 : 5,
	51 : 5,
	52 : 5,
	53 : 5,
	54 : 5,
	55 : 5,

	56 : 6,
	57 : 6,
	58 : 6,
	59 : 6,
	60 : 6,
	61 : 6,
	62 : 6,
	63 : 6,
	64 : 6,
	65 : 6,

	66 : 7,
	67 : 7,
	68 : 7,

	69 : 8,
	70 : 9,
	71 : 10,
}

var button_to_frame_dict: Dictionary =  {
	0 : 0,
	1 : 1,
	2 : 9,
	3 : 19,
	4 : 30,
	5 : 37,
	6 : 56,
	7 : 65,
	8 : 69,
	9 : 70,
	10 : 71,
}

func _ready() -> void:
	initiate_buttons()

func initiate_buttons():
	for i in range(len(buttons)):
		buttons[i].connect("pressed", func(): button_pressed(i))

func button_pressed(button_idx: int):
	if animation_ongoing:
		return
	var frame_idx = button_to_frame_dict[button_idx]
	player.move_to_frame_via_button(current_frame, button_idx)
	current_frame = button_idx
	current_step = frame_idx
	print("Frame: ", current_frame, " - Step: ", current_step)
	execute_step()

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

		## ---------------------------------- STRUCTURE ----------------------------------------------##

		0:
			# title
			pass

		## ---------------------------------- FRAME 1 ----------------------------------------------##

		1:
			# frame 1
			frame[current_frame].get_node("Text").text = ""
		2:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Was sind Shader?"
		3:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Was sind Shader?\n- Sprite Animationen (Vertex Shader)"
		4:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Was sind Shader?\n- Sprite Animationen (Vertex Shader)\n- Visuelle Effekte (Fragment Shader)"
		5:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Was sind Shader?\n- Sprite Animationen (Vertex Shader)\n- Visuelle Effekte (Fragment Shader)\n- Signed Distance Fields / Functions"
		6:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Was sind Shader?\n- Sprite Animationen (Vertex Shader)\n- Visuelle Effekte (Fragment Shader)\n- Signed Distance Fields / Functions\n- Ray Marching"
		7:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Was sind Shader?\n- Sprite Animationen (Vertex Shader)\n- Visuelle Effekte (Fragment Shader)\n- Signed Distance Fields / Functions\n- Ray Marching\n- Schatten"
		8:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Was sind Shader?\n- Sprite Animationen (Vertex Shader)\n- Visuelle Effekte (Fragment Shader)\n- Signed Distance Fields / Functions\n- Ray Marching\n- Schatten\n- Abschluss"

		## ---------------------------------- FRAME 2 ----------------------------------------------##

		9:
			# frame 2
			frame[current_frame].get_node("Text").text = ""
			frame[current_frame].get_node("Code").text = ""
			frame[current_frame].get_node("Code").visible = false
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered", false)
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered_2", false)
		10:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Rendering-Effekte"
		11:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Rendering-Effekte\n- Typisch in 3D, hier 2D"
		12:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Rendering-Effekte\n- Typisch in 3D, hier 2D\n- Programme auf GPU"
		13:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Rendering-Effekte\n- Typisch in 3D, hier 2D\n- Programme auf GPU\n- Teils komplex"
			frame[current_frame].get_node("Code").visible = false
		14:
			# show code block
			frame[current_frame].get_node("Text").text = "- Rendering-Effekte\n- Typisch in 3D, hier 2D\n- Programme auf GPU\n- Teils komplex\n\nAufteilung in:"
			frame[current_frame].get_node("Code").visible = true
			frame[current_frame].get_node("Code").text = ""
		15:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Rendering-Effekte\n- Typisch in 3D, hier 2D\n- Programme auf GPU\n- Teils komplex\n\nAufteilung in:\n- Vertex Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n\n}"
			frame[current_frame].get_node("Shader").position.y = 0
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered", false)
			frame[current_frame].get_node("Shader").time_passed = 0.0
		16:
			# vertex animation
			frame[current_frame].get_node("Text").text = "- Rendering-Effekte\n- Typisch in 3D, hier 2D\n- Programme auf GPU\n- Teils komplex\n\nAufteilung in:\n- Vertex Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n	VERTEX.y += 50.0 * TIME;\n}"
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered", true)
		17:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Rendering-Effekte\n- Typisch in 3D, hier 2D\n- Programme auf GPU\n- Teils komplex\n\nAufteilung in:\n- Vertex Shader\n- Fragment Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n	//VERTEX.y += 50.0 * TIME;\n}\n\nvoid fragment() {\n\n}"
			frame[current_frame].get_node("Shader").position.y = 0
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered", false)
			frame[current_frame].get_node("Shader").time_passed = 0.0
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered_2", false)
		18:
			# fragment animation
			frame[current_frame].get_node("Text").text = "- Rendering-Effekte\n- Typisch in 3D, hier 2D\n- Programme auf GPU\n- Teils komplex\n\nAufteilung in:\n- Vertex Shader\n- Fragment Shader"
			frame[current_frame].get_node("Code").text = "shader_type canvas_item;\n\nvoid vertex() {\n	//VERTEX.y += 50.0 * TIME;\n}\n\nvoid fragment() {\n	COLOR = vec4(1.0, 0.0, 0.0, 1.0);\n}"
			frame[current_frame].get_node("Shader").material.set_shader_parameter("is_triggered_2", true)
			frame[current_frame].get_node("Code").visible = true

		## ---------------------------------- FRAME 3 ----------------------------------------------##

		19:
			# frame 3
			frame[current_frame].get_node("Text").text = ""
			frame[current_frame].get_node("CPUvsGPU").visible = false
			frame[current_frame].get_node("BlackBox").visible = true
		20:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skripte laufen auf CPU"
			frame[current_frame].get_node("CPUvsGPU").visible = true
		21:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skripte laufen auf CPU\n- Wenige mächtige Kerne"
		22:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skripte laufen auf CPU\n- Wenige mächtige Kerne\n- Serialisiert / Sequenziell"
		23:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skripte laufen auf CPU\n- Wenige mächtige Kerne\n- Serialisiert / Sequenziell\n- Viel Speicher"
		24:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skripte laufen auf CPU\n- Wenige mächtige Kerne\n- Serialisiert / Sequenziell\n- Viel Speicher\n\nShader laufen auf GPU"
			frame[current_frame].get_node("BlackBox").visible = false
		25:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skripte laufen auf CPU\n- Wenige mächtige Kerne\n- Serialisiert / Sequenziell\n- Viel Speicher\n\nShader laufen auf GPU\n- Viele kleinere Kerne"
		26:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skripte laufen auf CPU\n- Wenige mächtige Kerne\n- Serialisiert / Sequenziell\n- Viel Speicher\n\nShader laufen auf GPU\n- Viele kleinere Kerne\n- Paralellisiert"
		27:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skripte laufen auf CPU\n- Wenige mächtige Kerne\n- Serialisiert / Sequenziell\n- Viel Speicher\n\nShader laufen auf GPU\n- Viele kleinere Kerne\n- Paralellisiert\n- Limitierter Speicher"
		28:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skripte laufen auf CPU\n- Wenige mächtige Kerne\n- Serialisiert / Sequenziell\n- Viel Speicher\n\nShader laufen auf GPU\n- Viele kleinere Kerne\n- Paralellisiert\n- Limitierter Speicher\n\nKein Gedächtnis zwischen Frames"
		29:
			# bullet point
			frame[current_frame].get_node("Text").text = "Skripte laufen auf CPU\n- Wenige mächtige Kerne\n- Serialisiert / Sequenziell\n- Viel Speicher\n\nShader laufen auf GPU\n- Viele kleinere Kerne\n- Paralellisiert\n- Limitierter Speicher\n\nKein Gedächtnis zwischen Frames\nInput nur limitiert über uniforms möglich"

		## ---------------------------------- FRAME 4 ----------------------------------------------##

		30:
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
		31:
			# bullet point
			frame[current_frame].get_node("Text").text = "Transformationen:"
			frame[current_frame].get_node("Godot1").visible = false
			frame[current_frame].get_node("Godot2").visible = false
			frame[current_frame].get_node("Godot3").visible = false
			frame[current_frame].get_node("Godot4").visible = false
			frame[current_frame].get_node("Godot5").visible = false
		32:
			# godots animations
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
		33:
			# godots animations
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
		34:
			# godots animations
			frame[current_frame].get_node("Text").text = "Transformationen:\n- Position\n- Rotation\n- Skalierung"
			animation_ongoing = true
			frame[current_frame].get_node("Godot10").visible = true
			await get_tree().create_timer(0.5).timeout
			frame[current_frame].get_node("Godot11").visible = true
			await get_tree().create_timer(0.5).timeout
			animation_ongoing = false
		35:
			# godots animations
			frame[current_frame].get_node("Text").text ="Transformationen:\n- Position\n- Rotation\n- Skalierung\n- Andere"
			animation_ongoing = true
			frame[current_frame].get_node("Godot12").visible = true
			await get_tree().create_timer(0.5).timeout
			frame[current_frame].get_node("Godot13").visible = true
			await get_tree().create_timer(0.5).timeout
			animation_ongoing = false
		36:
			# bullet point
			frame[current_frame].get_node("Text").text ="Transformationen:\n- Position\n- Rotation\n- Skalierung\n- Andere\n\n\n\n\n\nTransformation rein visuell!\nSpielzustand verändert sich nicht."

		## ---------------------------------- FRAME 5 ----------------------------------------------##

		37:
			# frame 5
			frame[current_frame].get_node("Text").text = ""
			frame[current_frame].get_node("Effekt0").visible = false
			frame[current_frame].get_node("Effekt1").visible = false
			frame[current_frame].get_node("Effekt2").visible = false
			frame[current_frame].get_node("Effekt3").visible = false
			frame[current_frame].get_node("Godot1").visible = false
			frame[current_frame].get_node("Godot2").visible = false
			frame[current_frame].get_node("Godot3").visible = false
			frame[current_frame].get_node("Godot4").visible = false
			frame[current_frame].get_node("Godot5").visible = false
			frame[current_frame].get_node("Godot6").visible = false
			frame[current_frame].get_node("Godot1").material.set_shader_parameter("green_active", false)
			frame[current_frame].get_node("Godot1").material.set_shader_parameter("half_red_active", false)
			frame[current_frame].get_node("Godot2").material.set_shader_parameter("godot_is_blured", false)
			frame[current_frame].get_node("Godot3").material.set_shader_parameter("is_active", false)
		38:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Filter"
			frame[current_frame].get_node("Godot1").visible = true
			frame[current_frame].get_node("Godot1").material.set_shader_parameter("green_active", false)
		39:
			# turn godot 1 green
			frame[current_frame].get_node("Godot1").material.set_shader_parameter("green_active", true)
			frame[current_frame].get_node("Godot1").material.set_shader_parameter("half_red_active", false)
		40:
			# turn godot 1 half-half
			frame[current_frame].get_node("Godot1").material.set_shader_parameter("half_red_active", true)
		41:
			# turn godot 2 on
			frame[current_frame].get_node("Godot2").visible = true
			frame[current_frame].get_node("Godot2").material.set_shader_parameter("godot_is_red", false)
		42:
			# turn godot 2 red
			frame[current_frame].get_node("Godot2").material.set_shader_parameter("godot_is_red", true)
		43:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Filter\n- Verzerrungseffekte"
			frame[current_frame].get_node("Godot2").material.set_shader_parameter("godot_is_red", false)
			frame[current_frame].get_node("Godot2").material.set_shader_parameter("godot_is_blured", false)
		44:
			# turn godot 2 blurry
			frame[current_frame].get_node("Godot2").material.set_shader_parameter("godot_is_blured", true)
		45:
			# turn godot 3 on
			frame[current_frame].get_node("Godot3").visible = true
			frame[current_frame].get_node("Godot3").material.set_shader_parameter("is_active", false)
		46:
			# turn godot 3 wobbly
			frame[current_frame].get_node("Godot3").material.set_shader_parameter("is_active", true)
		47:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Filter\n- Verzerrungseffekte\n- Effekte zum Hervorheben"
		48:
			# turn godot 4 on
			frame[current_frame].get_node("Godot4").visible = true
		49:
			# turn godot 5 on
			frame[current_frame].get_node("Godot5").visible = true
		50:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Filter\n- Verzerrungseffekte\n- Effekte zum Hervorheben\n- Animationseffekte"
		51:
			# turn godot 6 on
			frame[current_frame].get_node("Godot6").visible = true
		52:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Filter\n- Verzerrungseffekte\n- Effekte zum Hervorheben\n- Animationseffekte\n- Und vieles mehr ..."
		53:
			# turn on big effect
			frame[current_frame].get_node("Effekt0").visible = true
			frame[current_frame].get_node("Effekt1").visible = true
		54:
			# turn on big effect
			frame[current_frame].get_node("Effekt2").visible = true
		55:
			# turn on big effect
			frame[current_frame].get_node("Effekt3").visible = true

		## ---------------------------------- FRAME 6 ----------------------------------------------##

		56:
			# frame 6
			frame[current_frame].get_node("Text").text = ""
			frame[current_frame].get_node("Effekt0").material.set_shader_parameter("reveal_time", 0.0)
			frame[current_frame].get_node("Effekt0").material.set_shader_parameter("changing_over_time", false)
			frame[current_frame].get_node("Code").visible = false
			frame[current_frame].get_node("Legende").visible = false
			frame[current_frame].get_node("Link").visible = false
			frame[current_frame].get_node("SDF_List").visible = false
			frame[current_frame].get_node("Gif").visible = false
		57:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Funktionen um Formen zu beschreiben"
		58:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Funktionen um Formen zu beschreiben\n- Definiert Abstand zur Form"
		59:
			# bullet point
			frame[current_frame].get_node("Text").text = "- Funktionen um Formen zu beschreiben\n- Definiert Abstand zur Form\n- Signed = Innen negative Werte"
		60:
			# bullet point
			frame[current_frame].get_node("Code").visible = false
			frame[current_frame].get_node("Effekt0").material.set_shader_parameter("reveal_time", 0.0)
			frame[current_frame].get_node("Text").text = "- Funktionen um Formen zu beschreiben\n- Definiert Abstand zur Form\n- Signed = Innen negative Werte\n- Beispiel Kreis:"
			frame[current_frame].get_node("Effekt0").animate()
			await get_tree().create_timer(2.0).timeout
			animation_ongoing = false
		61:
			# code
			frame[current_frame].get_node("Code").visible = true
			frame[current_frame].get_node("Legende").visible = false
			frame[current_frame].get_node("Gif").visible = false
		62:
			# gif
			frame[current_frame].get_node("Gif").visible = true
		63:
			# animation
			frame[current_frame].get_node("Legende").visible = true
			frame[current_frame].get_node("Link").visible = false
			frame[current_frame].get_node("SDF_List").visible = false
			frame[current_frame].get_node("Gif").visible = false
			frame[current_frame].get_node("Effekt0").material.set_shader_parameter("changing_over_time", false)
		64:
			# sinus animation
			frame[current_frame].get_node("Effekt0").material.set_shader_parameter("changing_over_time", true)
			
		65:
			# link
			frame[current_frame].get_node("Effekt0").material.set_shader_parameter("changing_over_time", false)
			frame[current_frame].get_node("Link").visible = true
			frame[current_frame].get_node("SDF_List").visible = true
			frame[current_frame].get_node("Gif").visible = false

		## ---------------------------------- FRAME 7 ----------------------------------------------##

		66:
			# frame 7
			frame[current_frame].get_node("Text").visible = true
			frame[current_frame].get_node("Code").visible = false
			frame[current_frame].get_node("Effekt0").visible = false
		67:
			# code exercise
			frame[current_frame].get_node("Text").visible = false
			frame[current_frame].get_node("Code").visible = true
			frame[current_frame].get_node("Effekt0").visible = false
		68:
			# answer
			frame[current_frame].get_node("Text").visible = false
			frame[current_frame].get_node("Code").visible = false
			frame[current_frame].get_node("Effekt0").visible = true

		## ---------------------------------- FRAME 8 ----------------------------------------------##

		69:
			# frame 8
			pass

		## ---------------------------------- FRAME 9 ----------------------------------------------##

		70:
			# frame 9
			pass

		## ---------------------------------- FRAME 10 ----------------------------------------------##

		71:
			# frame 10
			pass
