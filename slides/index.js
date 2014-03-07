items = 0;
volgendePagina = "#";
vorigePagina = "#";

function volgendItem() {
	items += 1;
	element = document.getElementById("elem" + items);
	if(element) {
		element.style.visibility = "visible";
	} else {
		window.location.href = volgendePagina;
	}
}

function init(volgende,vorige) {
	volgendePagina = volgende;
	vorigePagian = vorige;
	volgendItem();
}