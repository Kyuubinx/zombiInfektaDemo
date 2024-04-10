extends Node2D

# Array do mapa
# ["nome", tipo de mapa]
# 0 = mapa comum, 1 = spawnpoint, 2 = abrigo
# navegacao [front, back, left, right]

var current_map = 0
var map_data = []
var nav = []
var map_safezone = [1, 21, 23, 32, 34, 41, 44]
var map_spawnpoint = [6, 16, 17, 28, 35, 38]
var final_safezone = 0
var safe_zone = []
var turn = 0
var array_maps = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51]
var zombie_maps = []
var array_zombies = [0,0,0,0,0,0,1,1,1,1,1,2,2,2,2,3,3,3,4,4,5]
var zombies = []
var maps_to_draw = [1,5,7,8]

func _ready():
	final_safezone_definer()

func _process(delta):
	if current_map == final_safezone:
		print("You won!!")

func map_data_reader():
	match current_map:
		1:
			map_data = ["Gym Room", 2]
			nav = [[true, 2], [false, 0], [false, 0], [false, 0]]
		2:
			map_data = ["Gymnasium (Bottom Left)", 0]
			nav = [[true, 5], [true, 1], [false, 0], [true, 3]]
		3:
			map_data = ["Gymnasium (Bottom Center)", 0]
			nav = [[false, 0], [false, 0], [true, 2], [true, 4]]
		4:
			map_data = ["Gymnasium (Bottom Right)", 0]
			nav = [[true, 7], [false, 0], [true, 3], [false, 0]]
		5:
			map_data = ["Gymnasium (Center Left)", 0]
			nav = [[true, 8], [true, 2], [false, 0], [true, 6]]
		6:
			map_data = ["Gymnasium (Center)", 1]
			nav = [[true, 9], [false, 0], [true, 5], [true, 7]]
		7:
			map_data = ["Gymnasium (Center Right)", 0]
			nav = [[true, 10], [true, 4], [true, 6], [false, 0]]
		8:
			map_data = ["Gymnasium (Top Left)", 0]
			nav = [[true, 13], [true, 5], [false, 0], [true, 9]]
		9:
			map_data = ["Gymnasium (Top Center)", 0]
			nav = [[false, 0], [true, 6], [true, 8], [true, 10]]
		10:
			map_data = ["Gymnasium (Top Right)", 0]
			nav = [[true, 15], [true, 7], [true, 9], [false, 0]]
		11:
			map_data = ["Street 1", 0]
			nav = [[true, 16], [true, 12], [false, 0], [false, 0]]
		12:
			map_data = ["Street 2", 0]
			nav = [[true, 11], [false, 0], [false, 0], [true, 13]]
		13:
			map_data = ["Street 3", 0]
			nav = [[false, 0], [true, 8], [true, 12], [true, 14]]
		14:
			map_data = ["Street 4", 0]
			nav = [[true, 17], [false, 0], [true, 13], [true, 15]]
		15:
			map_data = ["Street 5", 0]
			nav = [[true, 22], [true, 10], [true, 14], [false, 0]]
		16:
			map_data = ["Parking Lot", 1]
			nav = [[false, 0], [true, 11], [false, 0], [false, 0]]
		17:
			map_data = ["Stairs", 1]
			nav = [[true, 18], [true, 14], [false, 0], [false, 0]]
		18:
			map_data = ["Alley (Bottom)", 0]
			nav = [[true, 19], [true, 17], [false, 0], [false, 0]]
		19:
			map_data = ["Alley (Top)", 0]
			nav = [[true, 31], [true, 18], [false, 0], [true, 20]]
		20:
			map_data = ["Restaurant (Main Entry)", 0]
			nav = [[false, 0], [true, 21], [true, 19], [false, 0]]
		21:
			map_data = ["Restaurant (Inside)", 2]
			nav = [[true, 20], [true, 22], [false, 0], [false, 0]]
		22:
			map_data = ["Restaurant (Back Entry)", 0]
			nav = [[true, 21], [true, 15], [false, 0], [false, 0]]
		23:
			map_data = ["Auditorium (Top)", 2]
			nav = [[true, 30], [true, 24], [false, 0], [false, 0]]
		24:
			map_data = ["Auditorium (Center)", 0]
			nav = [[true, 23], [true, 25], [false, 0], [false, 0]]
		25:
			map_data = ["Auditorium (Bottom)", 0]
			nav = [[true, 24], [false, 0], [false, 0], [false, 0]]
		26:
			map_data = ["Drugstore (Top)", 0]
			nav = [[false, 0], [true, 27], [false, 0], [true, 28]]
		27:
			map_data = ["Drugstore (Bottom)", 0]
			nav = [[true, 26], [false, 0], [false, 0], [false, 0]]
		28:
			map_data = ["Food Court (Top Left)", 1]
			nav = [[false, 0], [true, 30], [true, 26], [true, 29]]
		29:
			map_data = ["Food Court (Top Right)", 0]
			nav = [[true, 34], [true, 31], [true, 28], [false, 0]]
		30:
			map_data = ["Food Court (Bottom Left)", 0]
			nav = [[true, 28], [true, 23], [false, 0], [true, 31]]
		31:
			map_data = ["Food Court (Bottom Right)", 0]
			nav = [[true, 29], [true, 19], [true, 30], [true, 32]]
		32:
			map_data = ["Cash Machine Cabin", 2]
			nav = [[false, 0], [false, 0], [true, 31], [false, 0]]
		33:
			map_data = ["Middle School Block (Top)", 0]
			nav = [[true, 42], [true, 34], [true, 35], [true, 37]]
		34:
			map_data = ["Middle School Block (Bottom)", 2]
			nav = [[true, 33], [true, 29], [true, 36], [false, 0]]
		35:
			map_data = ["Highschool Block (Top)", 1]
			nav = [[false, 0], [true, 36], [false, 0], [true, 33]]
		36:
			map_data = ["Highschool Block (Bottom)", 0]
			nav = [[true, 35], [false, 0], [false, 0], [true, 34]]
		37:
			map_data = ["Corridor", 0]
			nav = [[false, 2], [false, 0], [true, 33], [true, 38]]
		38:
			map_data = ["Bus Stop (Bottom)", 1]
			nav = [[true, 39], [false, 0], [true, 37], [false, 0]]
		39:
			map_data = ["Bus Stop (Center)", 0]
			nav = [[true, 40], [true, 38], [false, 0], [false, 0]]
		40:
			map_data = ["Bus Stop (Top)", 0]
			nav = [[true, 41], [true, 39], [false, 0], [false, 0]]
		41:
			map_data = ["Bus (Inside)", 2]
			nav = [[false, 0], [true, 40], [false, 0], [false, 0]]
		42:
			map_data = ["Library (Entrance)", 0]
			nav = [[true, 44], [true, 33], [false, 0], [false, 0]]
		43:
			map_data = ["Library (Bottom Left)", 0]
			nav = [[true, 46], [false, 0], [false, 0], [true, 44]]
		44:
			map_data = ["Library (Bottom Center)", 2]
			nav = [[false, 0], [true, 42], [false, 43], [false, 45]]
		45:
			map_data = ["Library (Bottom Right)", 0]
			nav = [[true, 48], [false, 0], [true, 44], [false, 0]]
		46:
			map_data = ["Library (Center Left)", 0]
			nav = [[true, 49], [true, 43], [false, 0], [true, 47]]
		47:
			map_data = ["Library (Center)", 0]
			nav = [[true, 50], [false, 0], [true, 46], [true, 48]]
		48:
			map_data = ["Library (Center Right)", 0]
			nav = [[true, 51], [true, 45], [true, 47], [false, 0]]
		49:
			map_data = ["Library (Top Left)", 0]
			nav = [[false, 0], [true, 46], [false, 0], [true, 50]]
		50:
			map_data = ["Library (Top Center)", 0]
			nav = [[false, 0], [true, 47], [true, 49], [true, 51]]
		51:
			map_data = ["Library (Top Right)", 0]
			nav = [[false, 0], [true, 48], [true, 50], [false, 0]]

func _on_btn_front_button_up():
	if current_map == 0:
		var spawn = map_spawnpoint[randi() % map_spawnpoint.size()]
		current_map = spawn
		map_data_reader()
		print(current_map)
		print(nav)
	else:
		if nav[0][0] == true:
			current_map = nav[0][1]
			map_data_reader()
			print("mapa atual: ")
			print(map_data)
			print("ID atual: ")
			print(current_map)
			print("Navegacao atual:")
			print(nav)
		else :
			print('n pode se mover')
	
func _on_btn_back_button_up():
	if current_map == 0:
		var spawn = map_spawnpoint[randi() % map_spawnpoint.size()]
		current_map = spawn
		map_data_reader()
		print(current_map)
		print(nav)
	else:
		if nav[1][0] == true:
			current_map = nav[1][1]
			map_data_reader()
			print("mapa atual: ")
			print(map_data)
			print("ID atual: ")
			print(current_map)
			print("Navegacao atual:")
			print(nav)
		else :
			print('n pode se mover')

func _on_btn_left_button_up():
	if current_map == 0:
		var spawn = map_spawnpoint[randi() % map_spawnpoint.size()]
		current_map = spawn
		map_data_reader()
		print(current_map)
		print(nav)
	else:
		if nav[2][0] == true:
			current_map = nav[2][1]
			map_data_reader()
			print("mapa atual: ")
			print(map_data)
			print("ID atual: ")
			print(current_map)
			print("Navegacao atual:")
			print(nav)
		else :
			print('n pode se mover')

func _on_btn_right_button_up():
	if current_map == 0:
		var spawn = map_spawnpoint[randi() % map_spawnpoint.size()]
		current_map = spawn
		map_data_reader()
		print(current_map)
		print(nav)
	else:
		if nav[3][0] == true:
			current_map = nav[3][1]
			map_data_reader()
			print("mapa atual: ")
			print(map_data)
			print("ID atual: ")
			print(current_map)
			print("Navegacao atual:")
			print(nav)
		else :
			print('n pode se mover')

func final_safezone_definer():
	final_safezone = map_safezone[randi() % map_safezone.size()]
<<<<<<< HEAD:zombi_infekta/world_script.gd

func turn_reader():
	safe_zone = map_safezone.pick_random()
	array_maps.erase(safe_zone)
	if turn % 5 == 0 && turn >= 5 && turn < 20:
		zombie_maps.clear()
		for i in range(5):
			var random_map = array_maps.pick_random()
			zombie_maps.append(random_map)
	elif turn % 5 == 0 && turn >= 20 && turn < 40:
		zombie_maps.clear()
		for i in range(10):
			var random_map = array_maps.pick_random()
			zombie_maps.append(random_map)
	elif turn % 5 == 0 && turn >= 40 && turn < 80:
		zombie_maps.clear()
		for i in range(20):
			var random_map = array_maps.pick_random()
			zombie_maps.append(random_map)
	elif turn % 5 == 0 && turn >= 80 && turn < 150:
		zombie_maps.clear()
		for i in range(35):
			var random_map = array_maps.pick_random()
			zombie_maps.append(random_map)
	elif turn % 5 == 0 && turn >= 150:
		zombie_maps.clear()
		for i in range(50):
			var random_map = array_maps.pick_random()
			zombie_maps.append(random_map)

func draw():
	for i in maps_to_draw:
		var zombie = array_zombies.pick_random()
		zombies.append([i, zombie])
=======
	
	#vamo ver se da commit
>>>>>>> 7f23cfe5813d57aa70a228ec1ef077d6ccb51661:zombi_infekta/map_data.gd
