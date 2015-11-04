function SetDeliveryTeam(Theatre){
var dropdown = document.getElementById("DeliveryTeam");
switch (Theatre.value){
case 'GET':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('Automotive & Manufacturing','Automotive & Manufacturing');
dropdown.options[dropdown.options.length] = new Option('U.S. Financials','U.S. Financials');
dropdown.options[dropdown.options.length] = new Option('Non US Financials','Non US Financials');
dropdown.options[dropdown.options.length] = new Option('Oil & Gas,Retail & Logistics','Oil & Gas,Retail & Logistics');
break;
}
case 'Americas ENT':{
	dropdown.options.length = 0;
	dropdown.options[dropdown.options.length] = new Option('US West','US West');
	dropdown.options[dropdown.options.length] = new Option('US East','US East');
	dropdown.options[dropdown.options.length] = new Option('US South','US South');
	dropdown.options[dropdown.options.length] = new Option('US Central','US Central');
	dropdown.options[dropdown.options.length] = new Option('LATAM','LATAM');
	dropdown.options[dropdown.options.length] = new Option('Canada','Canada');
	break;
}
case 'Americas SP':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('SDE','SDE');
dropdown.options[dropdown.options.length] = new Option('Non SDE','Non SDE');
dropdown.options[dropdown.options.length] = new Option('Canada SP','Canada SP');
dropdown.options[dropdown.options.length] = new Option('LATAM SP','LATAM SP');
break;
}
case 'APJC':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('India','India');
dropdown.options[dropdown.options.length] = new Option('China','China');
dropdown.options[dropdown.options.length] = new Option('Korea','Korea');
dropdown.options[dropdown.options.length] = new Option('Japan','Japan');
dropdown.options[dropdown.options.length] = new Option('Asia','Asia');
dropdown.options[dropdown.options.length] = new Option('ANZ','ANZ');
break;
}
case 'EMEAR ENT':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('Ent Central','Ent Central');
dropdown.options[dropdown.options.length] = new Option('Ent Emerging','Ent Emerging');
dropdown.options[dropdown.options.length] = new Option('Ent North','Ent North');
dropdown.options[dropdown.options.length] = new Option('Ent South','Ent South');
dropdown.options[dropdown.options.length] = new Option('Ent UKI','Ent UKI');
break;
}
case 'EMEAR SP':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('SP Central','SP Central');
dropdown.options[dropdown.options.length] = new Option('SP Emerging','SP Emerging');
dropdown.options[dropdown.options.length] = new Option('SP North','SP North');
dropdown.options[dropdown.options.length] = new Option('SP South','SP South');
dropdown.options[dropdown.options.length] = new Option('SP UKI','SP UKI');
dropdown.options[dropdown.options.length] = new Option('SP Vodafone','SP Vodafone');
break;
}
case 'Public':{
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('Federal','Federal');
dropdown.options[dropdown.options.length] = new Option('SLED','SLED');
break;
}
default:{
alert(Theatre.value + ' is not yet supported');
dropdown.options.length = 0;
dropdown.options[dropdown.options.length] = new Option('Select a Theatre First','00');
break;
}
}
}