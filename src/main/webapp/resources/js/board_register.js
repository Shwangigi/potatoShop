document.getElementById('InputFile').addEventListener('change', function(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();

        reader.onload = function(e) {
            const imgElement = document.getElementById('image-preview');
            imgElement.src = e.target.result;
        };

        reader.readAsDataURL(file);
    } else {
        document.getElementById('image-preview').src = '';
    }
});