extends KinematicBody2D
class_name Actor

const UP_DIRECTION: = Vector2.UP

# sera limitado o speed
export var speed: = Vector2(300.0, 1000.0)

#Sera aplicada a gravidade no eixo y
export var gravity: = 4000.0

# variavel privada com _
var _velocity: = Vector2.ZERO
