package;

import luxe.Color;
import luxe.Input;
import luxe.Screen.WindowEvent;
import luxe.States;
import luxe.Vector;

import states.Play;
import states.Splash;

#if debug
import DebugMenu;
#end

class Main extends luxe.Game
{
	var initialState : String = 'Splash';
	var showCursor : Bool = true;

	#if debug
	var debugMenuKey : Int = Key.f1;
	var debugMenu : DebugMenu;
	#end

	//
	// Window size variables for when you use
	// SizeMode.fit on your Luxe.camera
	//
	public static var w : Int = 1280;
	public static var h : Int = 720;

	static var state : States;


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


	override function ready ()
	{
		//
		// Optional, set a consistent scale camera mode for the entire game
		// this is a luxe's wip feature
		//
		Luxe.camera.size = new Vector(Main.w, Main.h);
		// Luxe.camera.size_mode = SizeMode.fit;

		// Set background color
		Luxe.renderer.clear_color = new Color().rgb(0x333333);

		// Actual codes that hide/show the cursor
		Luxe.screen.cursor.grab = !showCursor;

		//
		// Create debug menu canvas
		//
		#if debug
			debugMenu = new DebugMenu();
			debugMenu.setVisible( false );
		#end

		// Create a state machine
		state = new States( { name: "StateMachine" } );

		// Add states to the state machine
		state.add (new Splash({name: 'Splash'}));
		state.add (new Play({name: 'Play'}));

		// Run the inital state upon running the game
		changeState( initialState );
	}


	//
	// If not setting the camera size above and you
	// want in-game resolution to match the window size
	//
	/*
	override function onwindowsized( e : WindowEvent )
	{
        Luxe.camera.viewport = new luxe.Rectangle( 0, 0, e.x, e.y );
    }
    */


	#if debug
	override function onkeydown ( e : KeyEvent )
	{
		if ( e.keycode == debugMenuKey )
		{
			debugMenu.toggleVisible();
		}
	}
	#end


	public static function changeState ( stateName : String )
	{
		state.set( stateName );
	}
}