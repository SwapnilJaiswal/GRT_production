

//trap key events using the standard model
if(typeof document.addEventListener != 'undefined')
{
	document.addEventListener('keypress', function(e)
	{
		//get key code
		var code = e.keyCode;

		//if it's the F12 key
		if(code == 123)
		{
			//look for the parent key handling function
			//and pass the event to it, if it exists
			if(typeof parent.um != 'undefined' && typeof parent.um.kbm != 'undefined' && typeof parent.um.kbm.kha == 'function')
			{
				parent.um.kbm.kha(e);
			}
		}

	}, false);
}

//trap key events for IE
else if(typeof document.attachEvent != 'undefined')
{
	document.attachEvent('onkeydown', function()
	{
		//get key code
		var code = window.event.keyCode;

		//if it's the F12 key
		if(code == 123)
		{
			//look for the parent key handling function
			//and pass the event to it, if it exists
			if(typeof parent.um != 'undefined' && typeof parent.um.kbm != 'undefined' && typeof parent.um.kbm.kha == 'function')
			{
				parent.um.kbm.kha(event);
			}
		}

	});
}
