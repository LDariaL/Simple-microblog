// Prevent uploading of big images.
document.addEventListener("turbo:load", function () {
    document.addEventListener("change", function (event) {
        let image_upload = document.querySelector('#post_image');
        const size_in_megabytes = image_upload.files[0].size / 1024 / 1024;
        if (size_in_megabytes > 100) {
            alert("Maximum file size is 100MB. Please choose a smaller file.");
            image_upload.value = "";
        }
    });
});