
const inputs = document.querySelectorAll('.res');
const patterns = {
  phoneNumber: /^\d{10}$/,
  password: /^[\w@_-]{8,30}$/i
};

const validate = (field, regex) => {
  const valid = regex.test(field.value);
  if (valid) {
    field.className = 'valid';
    console.log("valid");
    document.getElementById("btn-submit").type = 'submit';
  } else {
    field.className = 'invalid';
    console.log("invalid");
    document.getElementById("btn-submit").type = 'button';
  }
};

inputs.forEach((input) => {
  input.addEventListener('keyup', (e) => {
    validate(e.target, patterns[e.target.attributes.name.value]);
  });
});


   