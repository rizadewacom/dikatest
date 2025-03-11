document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Mencegah reload halaman saat submit

    // Ambil nilai input
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();
    const errorMessageElement = document.getElementById('errorMessage');

    // Validasi input di sisi klien
    if (!username || !password) {
        errorMessageElement.textContent = 'Username dan password tidak boleh kosong!';
        return;
    }

    // Reset pesan error sebelum request
    errorMessageElement.textContent = '';

    // Simulasi request ke backend menggunakan Fetch API
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
            // Redirect atau tindakan setelah login berhasil
            alert('Login berhasil!');
        } else {
            // Tampilkan pesan error dari server dengan aman
            errorMessageElement.textContent = data.message || 'Login gagal, cek username/password';
        }
    })
    .catch(error => {
        // Tangani error jaringan atau lainnya
        errorMessageElement.textContent = 'Terjadi kesalahan: ' + error.message;
    });
});