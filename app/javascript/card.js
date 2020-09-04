const pay = () => {
  Payjp.setPublicKey("pk_test_568b083ecf239634b3a730a3");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();              //Railsのフォーム送信処理をキャンセル

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    console.log(formResult)
    console.log(formData)
    const card = {
      number: formData.get("order[number]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
      cvc: formData.get("order[cvc]"),
    };
    console.log(card)
  
    Payjp.createToken(card, (status, response) => {
      console.log(status)
      console.log(response)
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;  //隠し要素としてトークンの値が入っているHTMLを生成する
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
      }
    });
  });
};
window.addEventListener("load", pay);