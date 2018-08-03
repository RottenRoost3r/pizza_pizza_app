function adress_dis() {
    if (document.getElementById("no_dining_room").checked) {
        document.getElementById("adress_bar").style.display = 'block';
    } else {
        document.getElementById("adress_bar").style.display = 'none';
    }
}

function valthis() {
    var checkBoxes = document.getElementsByClassName( 'topping_choices' );
    var isChecked = false;
        for (var i = 0; i < checkBoxes.length; i++) {
            if ( checkBoxes[i].checked ) {
                isChecked = true;
            }
        }
        if ( isChecked ) {
            
            } else {
                alert( 'Please check at least one checkbox!' );
            }   
    }