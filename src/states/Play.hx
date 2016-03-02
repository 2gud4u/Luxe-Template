package states;

import luxe.Color;
import luxe.Input;
import luxe.Sprite;
import luxe.States;
import luxe.Vector;

import Global;

//
// Main Gameplay State
//
class Play extends State
{
	var block : Sprite;

	override public function onenter<T> ( _ : T )
	{
		block = new Sprite({
			name: 'default testing sprite',
			pos: new Vector(Luxe.camera.size.x/2,Luxe.camera.size.y/2),
			color: new Color().rgb(0xf94b04),
			size: new Vector(128, 128)
		});
	}

	override public function update( dt : Float )
	{
		block.rotation_z += Global.rotate_speed * dt;
	}

	override public function onleave<T> ( _ : T )
	{
		block.destroy();
	}

	override function onmousemove( event : MouseEvent )
	{
		block.pos = Luxe.camera.screen_point_to_world(event.pos);
	}

	override function onkeyup( e : KeyEvent )
	{
		//escape from the game at any time, mostly for debugging purpose
		if ( e.keycode == Key.escape )
		{
			Luxe.shutdown();
		}
	}
}
