const pay = () => {
  // PAY.JPの初期化と公開鍵の設定
  const publicKey = gon.public_key
  const payjp = Payjp(publicKey) 
  // Elements APIの使用
  const elements = payjp.elements();
  // カード情報入力フィールドの作成
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  // 各フィールドを指定されたdivにマウント
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  // フォームのsubmitイベントを監視
  const form = document.getElementById('payment-form');
  form.addEventListener("submit", (e) => {
    
    // PAY.JPへカード情報を送信しトークンを生成
    payjp.createToken(numberElement).then(function(response){
      if(response.error){
    }else{
      const token = response.id;  // トークンの取得
      const renderDom = document.getElementById("payment-form");
      const tokenObj = `<input value=${token} name= 'token' type="hidden">`;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);
    }
    numberElement.clear();
    expiryElement.clear();
    cvcElement.clear();
    document.getElementById("payment-form").submit();
  });
  e.preventDefault();  // フォームの自動送信を防止
});
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);