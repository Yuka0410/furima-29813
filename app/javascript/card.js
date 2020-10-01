const pay = () => {
 Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
 const form = document.getElementById("charge-form");
 form.addEventListener("submit", (e) => {
   e.preventDefault(); //通常のRuby on Railsにおけるフォーム送信処理をキャンセル
   const formResult = document.getElementById("charge-form");//idでフォームの情報を取得し、それをFormDataオブジェクトとして生成
   const formData = new FormData(formResult); //FormData別カリキュラム参照
   const card = {
     number: formData.get("purchase_address[number]"),//上記のメソッドで入力した値を取得,変数cardに代入。
     cvc: formData.get("purchase_address[cvc]"), //formDataの引数にはname =""をいれる決まり。よってform_with変えたらをnameも変える
     exp_month: formData.get("purchase_address[exp_month]"),
     exp_year: `20${formData.get("purchase_address[exp_year]")}`, 
   };
   Payjp.createToken(card, (status, response) => { 
     
     if (status == 200) {
       const token = response.id;
       const renderDom = document.getElementById("charge-form");
       const tokenObj = `<input value=${token} name='token' type="hidden"> `; //テキストボックスというフォーム要素
       renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
                            //byIdと書いてるのでid から値とる
      document.getElementById("card-number").removeAttribute("name"); //Attributeは「属性」という意味なのでname属性でOK
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset(); //あってもなくてもいい
     });
   });
 };

window.addEventListener("load", pay);