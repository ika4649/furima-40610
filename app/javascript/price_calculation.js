document.addEventListener('turbo:load', priceCalculation);
document.addEventListener('turbo:render', priceCalculation);

function priceCalculation() {
  // 価格入力フィールドの要素を取得
  const priceInput = document.getElementById('item-price');

  if (!priceInput) {
    return; // priceInputが存在しない場合はここで処理を終了
  }

  // 手数料と利益を表示する要素を取得
  const addTaxDom = document.getElementById('add-tax-price');
  const profitDom = document.getElementById('profit');

  // 価格入力フィールドに入力があるたびに実行されるイベントを設定
  priceInput.addEventListener('input', () => {
    // 入力された価格の値を取得
    const price = priceInput.value;

    // 販売手数料の計算 (10%と仮定)
    const tax = Math.floor(price * 0.1);

    // 利益の計算
    const profit = Math.floor(price - tax);

    // 手数料と利益の表示を更新
    addTaxDom.innerHTML = tax;
    profitDom.innerHTML = profit;
  });
}