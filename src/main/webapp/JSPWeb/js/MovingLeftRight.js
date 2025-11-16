const leftBtn = document.querySelector('.left-btn');
const rightBtn = document.querySelector('.right-btn');
const carouselContainer = document.querySelector('.carousel-container');

// Khi nhấn nút trái
leftBtn.addEventListener('click', () => {
    carouselContainer.scrollLeft -= 300; // Cuộn trái 300px
});

// Khi nhấn nút phải
rightBtn.addEventListener('click', () => {
    carouselContainer.scrollLeft += 300; // Cuộn phải 300px
});
