const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("purchase-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formInfo = document.getElementById("purchase-form")
    const formData = new FormData(formInfo);
    const card = {
      number: formData.get("order[number]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
      cvc: formData.get("order[cvc]")      
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const tokenAddForm = document.getElementById("purchase-form");
        const tokenHtml = `<input value=${token} name='token' type='hidden'>`
        tokenAddForm.insertAdjacentHTML("beforeend", tokenHtml);
      } else {
        alert(
          `
          カード登録に失敗しました。
          エラー：${response.error.message}
          カード情報：
          {number: ${card.number} cvc: ${card.cvc} month: ${card.exp_month} year: ${card.exp_year}}
          `
        );
      };
      document.getElementById("order_number").removeAttribute("name");
      document.getElementById("order_cvc").removeAttribute("name");
      document.getElementById("order_exp_month").removeAttribute("name");
      document.getElementById("order_exp_year").removeAttribute("name");

      document.getElementById("purchase-form").submit();
    });
  });

};

window.addEventListener("load", pay);