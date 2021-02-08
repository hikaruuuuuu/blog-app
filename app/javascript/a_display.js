function ShowADisplay() {
  let js_showPage_ellipse = document.getElementById("js-showPage-ellipse");
  let js_showPage_display = document.getElementById("js-showPage-display");

  js_showPage_ellipse.addEventListener("click", function(e){
    e.preventDefault()
    if( js_showPage_display.getAttribute("class") == "a-display a-display--arrow_top display_none") {
      js_showPage_display.classList.remove("display_none");
    } else {
      js_showPage_display.classList.add("display_none");
    }
  });
}

window.addEventListener("load", ShowADisplay);