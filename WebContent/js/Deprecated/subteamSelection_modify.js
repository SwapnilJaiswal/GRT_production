function SetSubTeam_modify(ArchTeam){
var dropdown = document.getElementById("SubTeam");
switch (ArchTeam){
case 'BN-AT':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('NMS','NMS');
dropdown.options[dropdown.options.length] = new Option('Security','Security');
dropdown.options[dropdown.options.length] = new Option('Wireless','Wireless');
break;
}
case 'Collab':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('BV','BV');
dropdown.options[dropdown.options.length] = new Option('CC','CC');
dropdown.options[dropdown.options.length] = new Option('UC-S','UC-S');
dropdown.options[dropdown.options.length] = new Option('UC-T','UC-T');
break;
}
case 'CPS':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('Assessment','Assessment');
dropdown.options[dropdown.options.length] = new Option('G&D','G&D');
dropdown.options[dropdown.options.length] = new Option('Infra','Infra');
dropdown.options[dropdown.options.length] = new Option('Install','Install');
break;
}
case 'DCV':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('Assessment','Assessment');
dropdown.options[dropdown.options.length] = new Option('G&D','G&D');
dropdown.options[dropdown.options.length] = new Option('Infra','Infra');
dropdown.options[dropdown.options.length] = new Option('Install','Install');
break;
}
case 'PM':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('PM','PM');
dropdown.options[dropdown.options.length] = new Option('PSO','PSO');
break;
}
case 'HTOM':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('HTOM','HTOM');
break;
}
case 'Mobility':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('Mobility','Mobility');
break;
}
default:{
alert(ArchTeam.value + ' is not yet supported');
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('Select Arch Team First','00');
break;
}
}
}