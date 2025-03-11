document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault(); 

    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();
    const errorMessageElement = document.getElementById('errorMessage');

    if (!username || !password) {
        errorMessageElement.textContent = 'Username dan password tidak boleh kosong!';
        return;
    }

    errorMessageElement.textContent = '';

    fetch('login.jsp', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            username: username,
            password: password
        })
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Login gagal');
        }
        return response.json();
    })
    .then(data => {
        if (data.success) {
            alert('Login berhasil!');
        } else {
            errorMessageElement.textContent = data.message || 'Login gagal, cek username/password';
        }
    })
    .catch(error => {
        errorMessageElement.textContent = 'Terjadi kesalahan: ' + error.message;
    });
});