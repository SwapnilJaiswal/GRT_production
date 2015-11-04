function SetSubTeam_modify(ArchTeam){
var dropdown = document.getElementById("SubTeam");
switch (ArchTeam){
case 'Collab':{
	dropdown.options.length = 0;
	dropdown.options[dropdown.options.length] = new Option('BV','BV');
	dropdown.options[dropdown.options.length] = new Option('CC','CC');
	dropdown.options[dropdown.options.length] = new Option('UC','UC');

	break;
	}
	case 'Competency':{
		dropdown.options.length = 0;
		dropdown.options[dropdown.options.length] = new Option('Competency','Competency');
		break;
	}
	case 'BDM':{
		dropdown.options.length = 0;
		dropdown.options[dropdown.options.length] = new Option('BDM','BDM');
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
	case 'DCC':{
		dropdown.options.length = 0;
		dropdown.options[dropdown.options.length] = new Option('Infra','Infra');
		dropdown.options[dropdown.options.length] = new Option('Migration','Migration');
		dropdown.options[dropdown.options.length] = new Option('M&O','M&O');
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
		dropdown.options[dropdown.options.length] = new Option('Wireless','Wireless');
		break;
		}
	case 'Security':{
		dropdown.options.length = 0;
		dropdown.options[dropdown.options.length] = new Option('Security','Security');
		break;
		}
	case 'Software':{
		dropdown.options.length = 0;
		dropdown.options[dropdown.options.length] = new Option('Software','Software');
		break;
		}
	case 'NMS':{
		dropdown.options.length = 0;
		dropdown.options[dropdown.options.length] = new Option('NMS-Design','NMS-Design');
		dropdown.options[dropdown.options.length] = new Option('NMS-Deploy','NMS-Deploy');
		dropdown.options[dropdown.options.length] = new Option('NMS-Cust','NMS-Cust');
		dropdown.options[dropdown.options.length] = new Option('NMS-Sub_Mgmt','NMS-Sub_Mgmt');
		dropdown.options[dropdown.options.length] = new Option('Operate','Operate');
		break;
		}
	
	case 'SVS':{
		dropdown.options.length = 0;
		dropdown.options[dropdown.options.length] = new Option('Lab Val','Lab Val');
		dropdown.options[dropdown.options.length] = new Option('Test Consl Srvs','Test Consl Srvs');
		dropdown.options[dropdown.options.length] = new Option('Prod N/w Support','Prod N/w Support');
		dropdown.options[dropdown.options.length] = new Option('SR Support','SR Support');
		dropdown.options[dropdown.options.length] = new Option('POC Testing','POC Testing');
		dropdown.options[dropdown.options.length] = new Option('KT Sessions','KT Sessions');
		break;
		}

	case 'Migration':{
		dropdown.options.length = 0;
		dropdown.options[dropdown.options.length] = new Option('AD','AD');
		dropdown.options[dropdown.options.length] = new Option('CC','CC');
		dropdown.options[dropdown.options.length] = new Option('CM','CM');
		break;
		}

	case 'Wireless':{
		dropdown.options.length = 0;
		dropdown.options[dropdown.options.length] = new Option('Wireless','Wireless');
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