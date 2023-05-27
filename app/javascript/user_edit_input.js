document.addEventListener('DOMContentLoaded', () => {
  const userEditForm = document.getElementById('user-edit-form');
  const submitButton = document.getElementById('user-submit-button');


  userEditForm.addEventListener('input', () => {
    validateForm();
  });

  function validateForm() {
    //名前 ※漢字カタカナひらがなを許可し、苗字と名前の間に半角スペースを強要
    const nameInput = document.getElementById('user-edit-name');
    let nameError = document.getElementById('user-edit-name-error');
    const fullNameRegex = /^[\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFFa-zA-Z0-9]+ [\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFFa-zA-Z0-9]+$/;
    //所属
    const affiliationInput = document.getElementById('user-edit-affiliation');
    let affiliationError = document.getElementById('user-edit-affiliation-error');
    //メールアドレス
    const emailInput = document.getElementById('user-edit-email');
    let emailError = document.getElementById('user-edit-email-error');
    const emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
    //パスワード
    const passwordInput = document.getElementById('user-edit-password');
    let passwordError = document.getElementById('user-edit-password-error');
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,12}$/;
    
    nameError.textContent = '';
    affiliationError.textContent = '';
    emailError.textContent = '';
    passwordError.textContent = '';

    //名前
    if (fullNameRegex.test(nameInput.value) ) {
      nameError = '';
    }else{
      nameError.textContent = '半角スペース必須';
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


    if (nameError === '' && affiliationError === '' && emailError === '' && passwordError === '' ) {
      submitButton.disabled = false;
      submitButton.setAttribute("style", "background-color: rgb(58, 210, 87);")
    } else {
      submitButton.disabled = true;
      submitButton.setAttribute("style", "background-color: rgba(58, 210, 87,0.5);")
    }


  }
});