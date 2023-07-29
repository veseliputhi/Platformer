extends Area2D

export var speed : int = 100
export var moveDist : int = 100

onready var startX : float = position.x
onready var targetX : float = position.x + moveDist


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = move_to(position.x, targetX, speed * delta)
	
	# if we are at our target move in the other direction
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX

# move "current" toward "to" in a increment of "step"
func move_to(current, to, step):
	var new = current
	if new < to:
		new += step
		if new > to:
			new = to
	else:
		new -= step
		if new < to:
			new = to
	return new


func _on_Enemy_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "Player":
		body.die()
		
