$(document).ready(function() {

	$('body').append('<div id="controlContainer"></div>')
	$('#controlContainer').append($('<button id="reset">Reset Grid</button>'));
	$('#controlContainer').append($('<input id="randomColor" type="checkbox">Random Color</input>'));
	$('body').append('<div id="gridContainer"></div>');
	createGrid(4);

	//prompt user for new grid specification when 'Reset Grid' button is clicked
	$('button').on('click', function() {
		var gridSize = prompt('How many squares per side would you like?');

		//replace existing grid with new grid
		$('#gridContainer').empty();
		createGrid(gridSize);

	});
});

//checks if Random Color checkbox is checked or not
function isRandomColor() {
	return $('#randomColor:checkbox:checked').length > 0;
}

function randomColor() {
	var red = Math.floor(Math.random()*257);
	var green = Math.floor(Math.random()*257);
	var blue = Math.floor(Math.random()*257);
	return [red, green, blue];
}


function highlightGrid() {
	$('.square').on('mouseenter',function() {
		if(isRandomColor()) {
			var colors = randomColor();
			$(this).css({"background-color":"rgb("+colors[0]+","+colors[1]+","+colors[2]+")"});
		}
		else {
			$(this).addClass("highlight");
		}
	});
}


function createGrid(size) {
	var row;
	var square;
	var sideLen = 960/size;
	for(var i = 0; i < size; i++) {
		//generate the next row in the new grid
		row = $('<div class="row"></div>').css({"height":sideLen});
		$('#gridContainer').append(row);
		for (var j = 0; j < size; j++) {
			//generate squares across row i
			square = $('<div class="square"></div>').css({"width":sideLen, "height":sideLen});
			$('.row').last().append(square);
		}
	}
	highlightGrid();
}