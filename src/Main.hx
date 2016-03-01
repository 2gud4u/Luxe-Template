package;

import luxe.Color;
import luxe.Screen.WindowEvent;
import luxe.States;
import luxe.Vector;

import states.Play;
import states.Splash;

class Main extends luxe.Game
{
	var initialState: String = 'Splash';
	var showCursor: Bool = true;

	//
	// Window size variables for when you use
	// SizeMode.fit on your Luxe.camera
	//
	public static var w: Int = 1280;
	public static var h: Int = 720;

	static var state: States;


	override function config (config:luxe.AppConfig) : luxe.AppConfig
	{
		//
		// Define resources to preload
		//
		config.preload.textures = [
			{id: 'assets/logo_box.png'}
		];

		return config;
	}

	//
	// Scale camera's viewport accordingly when game is scaled, common and suitable for most games
	//
	/*
	override function onwindowsized ( e : WindowEvent )
	{
        Luxe.camera.viewport = new luxe.Rectangle( 0, 0, e.x, e.y);
	}
	*/

	override function ready ()
	{
		// Optional, set a consistent scale camera mode for the entire game
		// this is a luxe's wip feature
		Luxe.camera.size = new Vector(Main.w, Main.h);
		// Luxe.camera.size_mode = SizeMode.fit;

		// Set background color
		Luxe.renderer.clear_color = new Color().rgb(0x4D4D4D);

		// Actual codes that hide/show the cursor
		Luxe.screen.cursor.grab = !showCursor;

		// Create a state machine
		state = new States( { name: "StateMachine" } );

		// Add states to the state machine
		state.add (new Play({name: 'Play'}));
		state.add (new Splash({name: 'Splash'}));

		// Run the inital state upon running the game
		changeState( initialState );
	}


	public static function changeState ( stateName : String )
	{
		state.set( stateName );
	}
}