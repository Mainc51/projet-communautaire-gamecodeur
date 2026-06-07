extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func lancer_jeu():
	var exe_path
	var pathGame = "Games/Musicat_Quest_v2.0/MusicatQuest_v2.0.exe"
	exe_path = ProjectSettings.globalize_path("res://") + pathGame
	print("EXE =", exe_path)
	print("Exists =", FileAccess.file_exists(exe_path))
	OS.create_process(exe_path, [])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_zone and Input.is_action_just_pressed("Interact"):
		lancer_jeu()

var player_in_zone = false


func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body)
	if body.name == "Player":
		player_in_zone = true


func _on_area_3d_body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player":
		player_in_zone = false
