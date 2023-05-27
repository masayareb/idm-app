document.addEventListener('DOMContentLoaded', () => {
  const itemForm = document.getElementById('item-form');
  const submitButton = document.getElementById('submit-button');


  itemForm.addEventListener('input', () => {
    validateForm();
  });

  function validateForm() {
    //社員番号
    const employeeNumberInput = document.getElementById('employee-number');
    let employeeNumberError = document.getElementById('employee-number-error');
    const numberRegex = /^[A-Za-z0-9]+$/;
    //商品名
    const itemInput = document.getElementById('item-name');
    let itemError = document.getElementById('item-error');
    //メーカー
    const manufacturerInput = document.getElementById('item-manufacturer');
    let manufacturerError = document.getElementById('manufacturer-error');
    //ip
    const ipInput = document.getElementById('item-ip');
    let ipError = document.getElementById('ip-error');
    const ipAddressRegex = /^([0-9]{1,3}\.){3}[0-9]{1,3}$/;
    //S/N
    const serialNumberInput = document.getElementById('item-serial-number');
    let serialNumberError = document.getElementById('serial-number-error');
    //購入年月
    const purchaseDateInput = document.getElementById('item-purchase-date');
    let purchaseDateError = document.getElementById('purchase-date-error');
    //利用予定年数
    const yearsOfUseInput = document.getElementById('item-years-of-use');
    let yearsOfUseError = document.getElementById('years-of-use-error');
    const twoDigitNumberRegex = /^\d{1,2}$/;
    
    
    employeeNumberError.textContent = '';
    itemError.textContent = '';
    manufacturerError.textContent = '';
    ipError.textContent = '';
    serialNumberError.textContent = '';
    purchaseDateError.textContent = '';
    yearsOfUseError.textContent = '';

    //社員番号    
    if (numberRegex.test(employeeNumberInput.value) ) {
      employeeNumberError = '';
    }else{
      employeeNumberError.textContent = '半角英数字入力';
    }
    //商品名
    if (itemInput.value === '') {
      itemError.textContent = '必須入力';
    }else{
      itemError = '';
    }
    //メーカー
    if (manufacturerInput.value === '') {
      manufacturerError.textContent = '必須入力';
    }else{
      manufacturerError = '';
    }
    //ip
    if (ipInput.value === "DHCP" || ipAddressRegex.test(ipInput.value) ) {
      ipError = '';
    }else{
      ipError.textContent = '無効な値';
    }
    //S/N
    if (numberRegex.test(serialNumberInput.value) ) {
      serialNumberError = '';
    }else{
      serialNumberError.textContent = '半角英数字入力';
    }
    //購入年月
    if (purchaseDateInput.value === '') {
      purchaseDateError.textContent = '必須入力';
    }else{
      purchaseDateError = '';
    }
    //利用予定年数
    if (twoDigitNumberRegex.test(yearsOfUseInput.value) ) {
      yearsOfUseError = '';
    }else{
      yearsOfUseError.textContent = '2桁以下半角数字';
    }
    


    if (employeeNumberError === '' && itemError === '' && manufacturerError ==='' && ipError ==='' && serialNumberError === '' && purchaseDateError === '' && yearsOfUseError === '') {
      submitButton.disabled = false;
      submitButton.setAttribute("style", "background-color: rgb(58, 210, 87);")
    } else {
      submitButton.disabled = true;
    }


  }
});