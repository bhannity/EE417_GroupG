const form = document.getElementById('form');
const fname = document.getElementById('fname');
const uname = document.getElementById('uname');
const email = document.getElementById('email');
const psw = document.getElementById('psw');
const psw2 = document.getElementById('psw2');

form.addEventListener('submit', e => {
    e.preventDefault();
    validateInputs();
});

const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');

    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('success')
}

const setSuccess = element => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');

    errorDisplay.innerText = '';
    inputControl.classList.add('success');
    inputControl.classList.remove('error');
};

//Regular expression used to validate email

const isValidEmail = email => {
    const regEx = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return regEx.test(String(email).toLowerCase());
}

//cvaidate inputs of the form

const validateInputs = () => {

    //trim to get rid of white space
    const fnameValue = fname.value.trim();
    const unameValue = uname.value.trim();
    const emailValue = email.value.trim();
    const pswValue = psw.value.trim();
    const psw2Value = psw2.value.trim();

    if(fnameValue === '') {
        setError(fname, 'Name is required');
    } else {
        setSuccess(fname);
    }

    if(unameValue === '') {
        setError(uname, 'Username is required');
    } else {
        setSuccess(uname);
    }

    if(emailValue === '') {
        setError(email, 'Email is required');
    } else if (!isValidEmail(emailValue)) {
        setError(email, 'Provide a valid email address e.g. joe.bloggs@gmail.com');
    } else {
        setSuccess(email);
    }

    if(pswValue === '') {
        setError(psw, 'Password is required');
    } else if (pswValue.length < 8 ) {
        setError(psw, 'Password must be at least 8 character.');
    } else {
        setSuccess(psw);
    }

    if(psw2Value === '') {
        setError(psw2, 'Please confirm your password');
    } else if (psw2Value !== pswValue) {
        setError(psw2, "Passwords don't match");
    } else {
        setSuccess(psw2);
    }
};

function check(){
    var result = confirm('Please check to ensure your submitted values are correct');
    if(result == false){
        event.preventDefault();
    }
}