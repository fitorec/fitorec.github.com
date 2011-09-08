FCalRegisters = [];
//contructor
FCalendar = function( id_element, options ){
	this.date = null;
	this.days = [];
	this.defualtEvent = null;
	//default option
	this.style = 'fCalendarJS'
	if(options.style )
		this.style += '_'+options.style;
	//white option
	//this.style = 'fCalendarJS_white';
	//Regester the calendar into a array
	FCalRegisters[FCalRegisters.length] = { 'name': id_element, 'FCalendar' : this };
	this.element = document.getElementById(id_element);
	this.setClass(this.element, this.style);
	this.defualtMsg = "";
	this.setDate(options.year, options.month);
}
//set a default event to all days
FCalendar.prototype.defaultEventForDay = function(usserFuncion, defualtMsg){
	this.defualtEvent = usserFuncion;
	if(defualtMsg)
		this.defualtMsg = defualtMsg;
	this.setDate( this.date.getFullYear(), this.date.getMonth() );
}
//append events to year range
FCalendar.prototype.appendEventsDays = function( object ){
	this.days.push( object );
}
//set className to the element 'e'
FCalendar.prototype.setClass = function(e, className){
	if(e.className)
		e.setAttribute("className", className);//setClass for IE
	else
		e.setAttribute("class", className);//setClass for others Browsers
}
//apend the title and top controls
FCalendar.prototype.appendTitle = function(){
	title = document.createElement('div');
	this.setClass(title, this.style+'Title');
	spanTitle = document.createElement('span');
	spanTitle.innerHTML = fcal_months[this.date.getMonth()] + ' ' + this.date.getFullYear();
	title.appendChild(spanTitle);
	title.appendChild(this.getBotton('YearPrev'));
	title.appendChild(this.getBotton('MonthPrev'));
	title.appendChild(this.getBotton('YearNext'));
	title.appendChild(this.getBotton('MonthNext'));
	this.element.appendChild( title );
}
//create and return a botton for the top controls
FCalendar.prototype.getBotton = function(type){
	var botton = null;
	botton = document.createElement('a');
	this.setClass(botton, 'fCalendar'+type);
	if( type.indexOf('Month') == 0){
		var inc = (type == 'MonthPrev') ? -1 : 1;
		botton.innerHTML = (type == 'MonthPrev') ? '&lt;	' : '&gt;';
		FCalendar.prototype.addEvent(botton, 'click', function(e){FCalendar.moveMonth(this.parentNode.parentNode.id, inc)});
	}
	if( type.indexOf('Year') == 0){
		var inc = (type == 'YearPrev') ? -1 : 1;
		botton.innerHTML = (type == 'YearPrev') ? '&laquo;' : '&raquo;';
		FCalendar.prototype.addEvent(botton, 'click', function(e){FCalendar.moveYear(this.parentNode.parentNode.id, inc)});
	}
	return botton;
}

FCalendar.prototype.addEvent = function(e, ev3nt, fhandler){	
	if (e.attachEvent)
			e.attachEvent('on'+ev3nt,fhandler);
		else
			e.addEventListener(ev3nt, fhandler, false);
}

FCalendar.prototype.range = function(num, ini, end){
	if(num<ini)
		return end;
	else if(num>end)
		return ini;
	return num;
}

FCalendar.moveMonth = function(parentNode_id, inc){
	fCal = null;
	for(k in FCalRegisters)
		if( FCalRegisters[k].name  == parentNode_id){
			fCal = FCalRegisters[k].FCalendar;
			break;
		}
	if(fCal !== null){
		var year = fCal.date.getFullYear();
		if( (fCal.date.getMonth() + inc) > 11)
			year ++;
		else if( (fCal.date.getMonth() + inc) < 0 )
			year --;
		fCal.setDate(year, fCal.range( fCal.date.getMonth() + inc, 0, 11) );
	}
}

FCalendar.ancestor = function(e, level){
	aux = e;
	i = 0;
	while(aux && i<level){
		aux = aux.parentNode;
		i++;
	}
	return aux;
}

FCalendar.moveYear = function(parentNode_id, inc){
	fCal = null;
	for(k in FCalRegisters)
		if( FCalRegisters[k].name  == parentNode_id)
			fCal = FCalRegisters[k].FCalendar;
	if(fCal){
		fCal.setDate(parseInt(fCal.date.getFullYear()) + inc, fCal.date.getMonth() );
	}
}

FCalendar.addHandler = function(element, handlerFunction ){
	day = element.innerHTML;
	parentNode_id = FCalendar.ancestor(element,3).id;
	fCal = null;
	for(k in FCalRegisters)
		if( FCalRegisters[k].name  == parentNode_id)
			fCal = FCalRegisters[k].FCalendar;
	if(fCal){
		if( handlerFunction ){
		for(i in fCal.days)
			if( fCal.days[i].year == fCal.date.getFullYear())
				for(j in fCal.days[i].days){
					if( typeof( fCal.days[i].days[j]) != 'string' )
						continue;
					ds = fCal.days[i].days[j].split( '/' );
					if( ds[0] == fCal.date.getMonth() && parseInt(ds[1])==parseInt(day) ){
						if( fCal.days[i].event )
							eval( fCal.days[i].event +'('+ fCal.date.getFullYear()+', '+fCal.date.getMonth()+', '+day+', '+parentNode_id +')' );
						break;
					}
				}
		}else
			fCal.defualtEvent(fCal.date.getFullYear(), fCal.date.getMonth(), day, parentNode_id );
	}
}

FCalendar.prototype.newDay = function(corrent_day, optionsDays, eventsDays){
	cell = this.cellElement( this.twoDigit( corrent_day ) );
	if(( j = eventsDays.indexOf(corrent_day) ) >= 0 ){
				FCalendar.prototype.addEvent(cell, 'click', function(e){FCalendar.addHandler(this,true)});
				this.setClass(cell, optionsDays[j].class );
				cell.title = optionsDays[j].msg;
			}else if( this.defualtEvent ){
				cell.title = this.defualtMsg;
				FCalendar.prototype.addEvent(cell, 'click', function(e){FCalendar.addHandler(this)});
	}
	cell.title = cell.title.replace('%day%',corrent_day);
	cell.title = cell.title.replace('%month%', fcal_months[this.date.getMonth()] );
	cell.title = cell.title.replace('%year%',this.date.getFullYear());
	return cell;
}
FCalendar.prototype.disabledDay = function(){
	cell = this.cellElement('&nbsp;&nbsp;');
	this.setClass(cell, this.style+'_disabled');
	return cell;
}
FCalendar.prototype.appendDaysTitle = function(){
	var tblBody = document.createElement("tbody");
	var row = document.createElement("tr");
	// For day in fcal_days Create a <th> element and a text node
	for(var i = 0; i<7; i++){
		var cell = this.cellElement(fcal_days[i], true);
		if( (i+1)%7 == this.date.getDay())
			this.setClass(cell,this.style+'_corrent_day');
		row.appendChild(cell);
	}
	// put the <tr> in the <tbody>
	tblBody.appendChild( row );
	// put the <tbody> in the <table>
	this.table.appendChild(tblBody);
	// appends <table> into <div id="">
	optionsDays = [];
	eventsDays = [];
	if( this.days.length > 0 ){
		for(i in this.days)
			if( this.days[i].year == this.date.getFullYear())
				for(j in this.days[i].days){
					if( typeof( this.days[i].days[j]) != 'string' )
						continue;
					ds = this.days[i].days[j].split( '/' );
					if( ds[0] == this.date.getMonth() ){
						optionsDays.push( {'class': this.days[i].class,'event' : this.days[i].event, 'msg' : this.days[i].msg} );
						eventsDays.push( parseInt( ds[1] ) );
					}
				}
	}
	
	dif_days = new Date(this.date.getFullYear(), this.date.getMonth(), 00).getDay();
	var row = document.createElement("tr");
	var corrent_day = 0;
	for(i=0; i<7; i++){
		var cell = null;
		if(i<dif_days)
			cell = this.disabledDay();
		else
			cell = this.newDay(++corrent_day, optionsDays, eventsDays);
		row.appendChild(cell);
	}
	this.table.appendChild(row);
	//
	row = document.createElement("tr");
	for(corrent_day++; corrent_day <= this.daysInMonth(); corrent_day++){
		cell = this.newDay(corrent_day, optionsDays, eventsDays);
		row.appendChild(cell);
		if( ( (corrent_day + dif_days )%7 )==0){
			this.table.appendChild(row);
			row = document.createElement("tr");
		}
	}
	
	if( row.getElementsByTagName('td').length > 0 ){
		while( row.getElementsByTagName('td').length != 7 )
			row.appendChild( this.disabledDay() );
		this.table.appendChild(row);
	}
}
//convert num to 2 digit format
FCalendar.prototype.twoDigit = function(num){
	if(num<10)
		return "0"+num;
	else
		return num;
}

FCalendar.prototype.cellElement = function (label, isTH){
	var cell = null;
	if( isTH == null )
		cell = document.createElement("td");
	else
		cell = document.createElement("th");
	cell.innerHTML = label;
	return cell;
}

FCalendar.prototype.daysInMonth = function (Year, Month){
	if( Month == null ||  Year == null)
		return ( 32 - new Date(this.date.getFullYear(), this.date.getMonth(), 32).getDate() );
	return ( 32 - new Date(Year, Month, 32).getDate() );
}

FCalendar.prototype.difIndays = function (Year, Month){
	if( Month == null ||  Year == null)
		return ( new Date(this.date.getFullYear(), this.date.getMonth(), 00).getDay() );
	return ( new Date(Year, Month, 00).getDay() );
}

FCalendar.prototype.setDate = function(year, month){
	if( isNaN(parseInt(year)) == false && isNaN(parseInt(month)) == false)
		this.date = new Date(parseInt(year), this.range(parseInt(month),0,11));
	else
		this.date = new Date();
	while( this.element.hasChildNodes() )
		this.element.removeChild( this.element.firstChild);
	this.appendTitle();
	this.table = document.createElement( "table" );
	this.element.appendChild( this.table );
	this.appendDaysTitle();
}
