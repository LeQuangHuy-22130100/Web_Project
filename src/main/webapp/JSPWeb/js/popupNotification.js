/**
 *
 */
document.getElementById("contactForm").addEventListener("submit", function (e) {
    e.preventDefault(); // Ngăn chặn việc gửi form thông thường

    const formData = new FormData(this);
    fetch("ContactServlet", {
        method: "POST",
        body: formData,
    })
        .then((response) => {
            if (!response.ok) {
                return response.json().then((data) => {
                    throw new Error(data.error || "Có lỗi xảy ra!");
                });
            }
            return response.json();
        })
        .then((data) => {
            // Hiển thị thông báo thành công
            document.getElementById("popupMessage").innerText =
                "Cảm ơn " + data.name + "! Chúng tôi đã nhận phản hồi của bạn.";
            openPopup();
        })
        .catch((error) => {
            // Hiển thị lỗi
            document.getElementById("popupMessage").innerText = error.message;
            openPopup();
        });
});

function openPopup() {
    document.getElementById("popup").style.display = "block";
}

function closePopup() {
    document.getElementById("popup").style.display = "none";
}