function ModalClick() {
  let js_form_posting_article = document.getElementById('js-form-posting-article');
  let js_form_modal = document.getElementById('js-form-modal');
  let js_modal_cancel = document.getElementById("js-modal-cancel");
  let js_modal_price_box = document.getElementById("js-modal-price");
  let js_form_modal_not_free = document.getElementById("js-not-free");
  let js_form_modal_free = document.getElementById("js-free");

  //有料無料のモーダル表示と非表示の切り替えのとこ
  js_form_posting_article.addEventListener("click", function(e) {
    e.preventDefault();
    if( js_form_modal.getAttribute("class") == "register-form-modal display_none") {
      js_form_modal.classList.remove("display_none");
    }
  });

  js_modal_cancel.addEventListener("click", function(e) {
    e.preventDefault();
    if( js_form_modal.getAttribute("class") == "register-form-modal") {
      js_form_modal.classList.add("display_none");
    }
  });

  //有料を選んだら、価格入力フォームのclassからhiddenしているdsplay_noneのclass名を外して表示させる
  js_form_modal_not_free.addEventListener("change", function() {
    if (js_form_modal_free.getAttribute("class") == "register-form-group__checkBox register-form-group__checkBox--free") {
      js_modal_price_box.classList.remove("display_none");
    }
  });

  //無料を選んだら、価格入力フォームのclassからhiddenしているdsplay_noneのclass名を追加して消す
  js_form_modal_free.addEventListener("change", function() {
    if (js_form_modal_not_free.getAttribute("class") == "register-form-group__checkBox register-form-group__checkBox--notFree") {
      js_modal_price_box.classList.add("display_none")
    }
  });
}

window.addEventListener("load", ModalClick);