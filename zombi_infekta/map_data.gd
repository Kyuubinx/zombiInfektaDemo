extends Node2D

# Array do mapa
# ["nome", tipo de mapa]
# 0 = mapa comum, 1 = spawnpoint, 2 = abrigo

var current_map = 0
var map_data = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func map_data_reader():
	match current_map:
		1:
			map_data = ["Gym Room", 0]
		2:
			map_data = ["Gymnasium (Bottom Left)", 0]
		3:
			map_data = []
		4:
			map_data = []
		5:
			map_data = []
		6:
			map_data = []
		7:
			map_data = []
		8:
			map_data = []
		9:
			map_data = []
		10:
			map_data = []
		11:
			map_data = []
		12:
			map_data = []
		13:
			map_data = []
		14:
			map_data = []
		15:
			map_data = []
		16:
			map_data = []
		17:
			map_data = []
		18:
			map_data = []
		19:
			map_data = []
		20:
			map_data = []
		21:
			map_data = []
		22:
			map_data = []
		23:
			map_data = []
		24:
			map_data = []
		25:
			map_data = []
		26:
			map_data = []
		27:
			map_data = []
		28:
			map_data = []
		29:
			map_data = []
		30:
			map_data = []
		31:
			map_data = []
		32:
			map_data = []
		33:
			map_data = []
		34:
			map_data = []
		35:
			map_data = []
		36:
			map_data = []
		37:
			map_data = []
		38:
			map_data = []
		39:
			map_data = []
		40:
			map_data = []
		41:
			map_data = []
		42:
			map_data = []
		43:
			map_data = []
		44:
			map_data = []
		45:
			map_data = []
		46:
			map_data = []
		47:
			map_data = []
		48:
			map_data = []
