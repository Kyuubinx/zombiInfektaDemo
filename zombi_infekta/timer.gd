extends Node2D

var turn = 0
var array_maps = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51]
var map_safezone = [1, 21, 23, 32, 34, 41, 44]
var zombie_maps = []

func turn_reader():
	var safe_zone = map_safezone.pick_random()
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
