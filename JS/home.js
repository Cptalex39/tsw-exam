document.querySelector('.menu-btn').addEventListener('click', () => document.querySelector('.main-menu').classList.toggle('show'));

function toggleMenu() {
    $("#hamburgerMenu").toggleClass("collapsed"); 
    $("#navBar").toggleClass("expanded");
}

function toggleMobile() {
    $("#hamburgerMobile").toggleClass("collapsed");
    $("#navBar").toggleClass("expanded-mobile");
}