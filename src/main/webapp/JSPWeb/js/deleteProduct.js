const checkboxes = document.querySelectorAll('.select-product');
const cartActions = document.getElementById('cart-actions');

function updateButtons() {
    const selectedCount = document.querySelectorAll('.select-product:checked').length;
    cartActions.innerHTML = '';

    if (selectedCount === checkboxes.length) {
        cartActions.innerHTML = '<button id="delete-all">Xóa tất cả</button>';
    } else if (selectedCount >= 1) {
        cartActions.innerHTML = `<button id="delete-selected">Xóa ${selectedCount} sản phẩm</button>`;
    }
}

checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', updateButtons);
});