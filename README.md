# Luxe Engine Template
A state-centric template for the [Luxe Engine](http://luxeengine.com/), heavily influenced by [HaxeFlixel](http://haxeflixel.com/) template, in attempt to assist for a smoother transitition from newcomers from other frameworks/engines. This template was originally created by [Juno Nguyen](https://github.com/JunoNgx) and maintained/modified by [Brody Brooks](http://brodybrooks.com).

**Luxe Engine** is far from final, and so is this template. This template is a work-in-progress and will be updated as **Luxe** being developed towards a final status.

# Content
~~* Basic window size and resizability configurations in ```Main.hx```~~
* Quick window settings in ```project.flow```
* Minimal and simple splash screen
* A basic hello world gameplay state
* ```project.flow``` guide comments
* Optional ```DebugMenu.hx``` debug tool framework for creating debug menus (requires [mint](https://github.com/snowkit/mint))
* Optional ```custom_index.html``` for fullscreen HTML5.

# Camera scale mode

Luxe provides a work-in-progress ```camera_scale``` feature, which is useful to handling multiple resolution ratio. In this template, this is defined in ```ready()``` callback in ```Main.hx``` (currently commented):

```
Luxe.camera.size = new Vector(Main.w, Main.h);
Luxe.camera.size_mode = SizeMode.fit;
```

The process is demonstrated in [```tests/wip/camera_scale```](https://github.com/underscorediscovery/luxe/tree/master/tests/wip/camera_scale)

# App icon

```project.app.icon``` designate the path to icon files (please refer to each respective platform for further details) in format ```folder_name => file_mame_in_platform_folders```.


# Feedback

If you have any suggestions for how to make this template more helpful, or if you spot a problem, please let me know! Create an issue or shoot me an email!