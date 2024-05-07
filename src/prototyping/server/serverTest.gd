extends Node

@export var player_instance: PackedScene

const port = 7272
var ip = "127.0.0.1"
var peer


func _unhandled_input(event):
	if Input.is_action_just_pressed("terminate"):
		terminate_server()

func terminate_server():
	multiplayer.multiplayer_peer = null
	print("terminated server")

func _on_host_button_pressed():
	peer = ENetMultiplayerPeer.new()
	var err = peer.create_server(port, 3)
	
	if err != OK:
		print("error starting server: %s" % err)
		return
	
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(remove_player)
	add_player()
	

	
	#upnp_setup()
	print("sucessfully created server")

func _on_join_button_pressed():
	peer = ENetMultiplayerPeer.new()
	
	peer.create_client("127.0.0.1", port)
	multiplayer.multiplayer_peer = peer



func add_player(id = 1):
	var player = player_instance.instantiate()
	player.name = str(id)
	print("player connected: %s" % id)
	call_deferred("add_child", player)

func exit_game(id):
	multiplayer.peer_disconnected.connect(del_player)
	del_player(id)

func remove_player(id):
	rpc("del_player", id)

@rpc("any_peer", "call_local")
func del_player(id):
	get_node(str(id)).queue_free()


func upnp_setup():
	var upnp = UPNP.new()
	
	var discover_result = upnp.discover()
	assert(discover_result == UPNP.UPNP_RESULT_SUCCESS, \
		"UPNP Discover Failed! Error %s" % discover_result)

	assert(upnp.get_gateway() and upnp.get_gateway().is_valid_gateway(), \
		"UPNP Invalid Gateway!")

	var map_result = upnp.add_port_mapping(port)
	assert(map_result == UPNP.UPNP_RESULT_SUCCESS, \
		"UPNP Port Mapping Failed! Error %s" % map_result)
	
	print("Success! Join Address: %s" % upnp.query_external_address())
