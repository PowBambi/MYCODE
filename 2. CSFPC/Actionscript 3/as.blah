/* Custom Mouse Cursor
Replaces the default mouse cursor with the specified symbol
instance.
*/
 
stage.addChild(movieClip_3);
movieClip_3.mouseEnabled = false;
movieClip_3.addEventListener(Event.ENTER_FRAME,
fl_CustomMouseCursor);
 
function fl_CustomMouseCursor(event:Event)
{
      movieClip_3.x = stage.mouseX;
      movieClip_3.y = stage.mouseY;
}
Mouse.hide();
 
//To restore the default mouse pointer, uncomment the following lines:
//movieClip_3.removeEventListener(Event.ENTER_FRAME, fl_CustomMouseCursor);
//stage.removeChild(movieClip_3);
//Mouse.show(); 