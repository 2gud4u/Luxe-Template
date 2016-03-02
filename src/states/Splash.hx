package states;

import luxe.Color;
import luxe.Input;
import luxe.Sprite;
import luxe.States;
import luxe.Vector;
import phoenix.Texture;

class Splash extends State
{
	var logo: Sprite;

	var delayStartTime: Float = 1;
	var fadeTime: Float = 1;
	var stayTime: Float = 2;
	var delaySwitchTime: Float = 1;

	// Optionally and quickly set the next state (with name:String) here
	var destinationState: String = 'Play';

	override function onenter<T> ( _ : T )
	{
		// Create the logo sprite
		logo = new Sprite ({
			// Change path to the texture of your logo/splash screen here
			texture: Luxe.resources.texture('assets/logo_box.png'),
			pos: new Vector( Luxe.camera.viewport.w/2, Luxe.camera.viewport.h/2 ),
			color: new Color(1, 1, 1, 0)
		});

		// Schedule fading in with a slight delay (looks better)
		Luxe.timer.schedule(delayStartTime, fadeIn);
	}

	function fadeIn ()
	{
		logo.color.tween(fadeTime, { a: 1 } );
		Luxe.timer.schedule(fadeTime + stayTime, fadeOut);
	}

	function fadeOut ()
	{
		logo.color.tween(fadeTime, { a: 0 } );
		Luxe.timer.schedule(fadeTime + delaySwitchTime, switchState);
	}

	// Switch to the designated state, set above
	function switchState ()
	{
		Main.changeState(destinationState);
	}

	// Optionally skip splash screen by pressing keyboard or mouse or touch
	override function onmouseup ( e : MouseEvent )
	{
		switchState();
	}

	override function onkeyup ( e : KeyEvent )
	{
		if ( e.keycode == Key.escape )
			switchState();
	}

	/*
	override function update(dt: Float) {
		
	}
	*/
	
	override function onleave<T> ( _ : T )
	{
		Luxe.timer.reset();
		logo.destroy();
	}
}