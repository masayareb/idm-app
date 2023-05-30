document.addEventListener('DOMContentLoaded', () => {
  const userForm = document.getElementById('admin-edit-form');
  const submitButton = document.getElementById('admin-submit-button');


  userForm.addEventListener('input', () => {
    validateForm();
  });

  function validateForm() {
    //名前 ※漢字カタカナひらがなを許可し、苗字と名前の間に半角スペースを強要
    const nameInput = document.getElementById('admin-edit-name');
    let nameError = document.getElementById('admin-edit-name-error');
    const fullNameRegex = /^[\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFFa-zA-Z0-9]+ [\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFFa-zA-Z0-9]+$/;
    //社員番号
    const employeeNumberInput = document.getElementById('admin-edit-employee-number');
    let employeeNumberError = document.getElementById('admin-edit-employee-number-error');
    const numberRegex = /^[A-Za-z0-9]+$/;
    //所属
    const affiliationInput = document.getElementById('admin-edit-affiliation');
    let affiliationError = document.getElementById('admin-edit-affiliation-error');
    //メールアドレス
    const emailInput = document.getElementById('admin-edit-email');
    let emailError = document.getElementById('admin-edit-email-error');
    const emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
    
    nameError.textContent = '';
    employeeNumberError.textContent = '';
    affiliationError.textContent = '';
    emailError.textContent = '';

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

    if (nameError === '' && employeeNumberError === '' && affiliationError === '' && emailError === '' ) {
      submitButton.disabled = false;
      submitButton.setAttribute("style", "background-color: rgb(58, 210, 87);")
    } else {
      submitButton.disabled = true;
      submitButton.setAttribute("style", "background-color: rgba(58, 210, 87,0.5);")
    }


  }
});