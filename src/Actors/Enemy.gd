extends Actor

func _ready() -> void:
	# stop a func para deixar o inimigo se mover quando estiver no campo de visibilidade da camera do player
	set_physics_process(false)
	_velocity.x = -speed.x
	
func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	# para manter o inimigo ancorado no chao em inclinacoes
	var snap: = Vector2.DOWN * 80.0
	_velocity.y = move_and_slide_with_snap(_velocity, snap, UP_DIRECTION).y

func _on_StompDetector_body_entered(body: Node) -> void:
	print("body: ", body.global_position.y, " stomp: ", get_node("StompDetector").global_position.y)
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
#	# para diminuir o delay. disabilita a colisao primeiro
	call_deferred("set", get_node("CollisionShape2D").disabled, true)
	queue_free()
