const pay = () => {
  const form = document.getElementById('payment-form');
  const cardNumber = document.getElementById('card-number');
  const cardExpiry = document.getElementById('card-expiry');
  const cardCVC = document.getElementById('card-cvc');

  form.addEventListener("submit", (e) => {
    console.log("カード番号: ", cardNumber.value);  // カード番号
    console.log("有効期限: ", cardExpiry.value);  // 有効期限
    console.log("セキュリティコード: ", cardCVC.value);  // セキュリティコード
    console.log("フォーム送信時にイベント発火");
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);