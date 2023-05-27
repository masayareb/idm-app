document.addEventListener('DOMContentLoaded', () => {
  const userForm = document.getElementById('user-form');
  const submitButton = document.getElementById('user-submit-button');


  userForm.addEventListener('input', () => {
    validateForm();
  });

  function validateForm() {
    //名前 ※漢字カタカナひらがなを許可し、苗字と名前の間に半角スペースを強要
    const nameInput = document.getElementById('user-name');
    let nameError = document.getElementById('user-name-error');
    const fullNameRegex = /^[\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFFa-zA-Z0-9]+ [\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFFa-zA-Z0-9]+$/;
    //社員番号
    const employeeNumberInput = document.getElementById('user-employee-number');
    let employeeNumberError = document.getElementById('user-employee-number-error');
    const numberRegex = /^[A-Za-z0-9]+$/;
    //所属
    const affiliationInput = document.getElementById('user-affiliation');
    let affiliationError = document.getElementById('user-affiliation-error');
    //メールアドレス
    const emailInput = document.getElementById('user-email');
    let emailError = document.getElementById('user-email-error');
    const emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
    //パスワード
    const passwordInput = document.getElementById('user-password');
    let passwordError = document.getElementById('user-password-error');
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,12}$/;
    //パスワード確認
    const passwordConfirmationInput = document.getElementById('user-password-confirmation');
    let passwordConfirmationError = document.getElementById('user-password-confirmation-error');
    
    nameError.textContent = '';
    employeeNumberError.textContent = '';
    affiliationError.textContent = '';
    emailError.textContent = '';
    passwordError.textContent = '';
    passwordConfirmationError.textContent = '';

    //名前
    if (fullNameRegex.test(nameInput.value) ) {
      nameError = '';
    }else{
      nameError.textContent = '半角スペース必須';
    }
    //社員番号    
    if (numberRegex.test(employeeNumberInput.value) ) {
      employeeNumberError = '';
    }else{
      employeeNumberError.textContent = '半角英数字入力';
    }
    //所属
    if (affiliationInput.value === '') {
      affiliationError.textContent = '必須入力';
    }else{
      affiliationError = '';
    }
    //email
    if (emailRegex.test(emailInput.value) ) {
      emailError = '';
    }else{
      emailError.textContent = '無効な値';
    }
    //password
    if (passwordRegex.test(passwordInput.value) ) {
      passwordError = '';
    }else{
      passwordError.textContent = '無効な値';
    }
    //パスワード確認
    if (passwordConfirmationInput.value === passwordInput.value) {
      passwordConfirmationError = '';
    }else{
      passwordConfirmationError.textContent = 'PWが一致してません';
    }


    if (nameError === '' && employeeNumberError === '' && affiliationError === '' && emailError === '' && passwordError === '' && passwordConfirmationError === '') {
      submitButton.disabled = false;
      submitButton.setAttribute("style", "background-color: rgb(58, 210, 87);")
    } else {
      submitButton.disabled = true;
      submitButton.setAttribute("style", "background-color: rgba(58, 210, 87,0.5);")
    }


  }
});