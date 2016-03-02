package;

import luxe.Input;
import luxe.Color;
import luxe.Vector;

import mint.Control;
import mint.focus.Focus;
import mint.layout.margins.Margins;
import mint.render.luxe.*;
import mint.types.Types;

import AutoCanvas;

class DebugMenu extends luxe.Entity
{
	var focus : Focus;
    var layout : Margins;
    var canvas : AutoCanvas;
    var rendering : LuxeMintRender;

    var mainWindow : mint.Window;

	public override function new ()
	{
		super({name: "DebugMenu"});

		rendering = new LuxeMintRender();
		layout = new Margins();

		canvas = new AutoCanvas({
            name:'canvas',
            rendering: rendering,
            options: { color:new Color(1,1,1,0) },
            x: 0, y:0, w: Luxe.camera.size.x, h: Luxe.camera.size.y
        });

        focus = new Focus( canvas );
        canvas.auto_listen();

        mainWindow = new mint.Window({
            parent: canvas,
            name: 'debugMain',
            title: "Debug Options",
            x:Luxe.camera.size.x - 256, y:96,
            w:176, h: 256,
            resizable: false,
            visible: true,
        });
	}

	public function toggleVisible ()
	{
		canvas.visible = !canvas.visible;
		mainWindow.visible = canvas.visible;
	}
}