//evento click
document.getElementById("btn_open").addEventListener("click", opne_close_menu);
//variables
var side_menu = document.getElementById("menu__side");
var btn_open = document.getElementById("btn_open");
var body = document.getElementById("body");

//mostrar y ocultar menu
function opne_close_menu(){
    body.classList.toggle("body_move");
    side_menu.classList.toggle("menu__side_move");
}
