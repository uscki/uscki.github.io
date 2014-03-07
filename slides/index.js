items = 0;
volgendePagina = "#";
vorigePagina = "#";
document.onkeyup = toets;
window.onresize = resize;

function volgendItem() {
	items += 1;
	element = document.getElementById("elem" + items);
	if(element) {
		element.style.visibility = "visible";
	} else {
		window.location.href = volgendePagina;
	}
}

function resize() {
	document.body.style.fontSize = (window.innerWidth / 40) + "px";
}

function init(volgende,vorige) {
	resize();
	volgendePagina = volgende;
	vorigePagina = vorige;
	volgendItem();
}

function toets(e) {
	var id = (window.event) ? event.keyCode : e.keyCode;
	switch(id) {
		case 32: //Spatie.
			volgendItem();
			break;
		case 37: //Pijl naar links.
			window.location.href = vorigePagina;
			break;
		case 39: //Pijl naar rechts.
			window.location.href = volgendePagina;
			break;
	}
}