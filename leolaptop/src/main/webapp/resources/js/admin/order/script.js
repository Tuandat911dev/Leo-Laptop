function showOrderDetail(orderId) {
    $('#offcanvasOverlay').fadeIn(200);
    $('#offcanvasUserDetails').addClass('active');
    $('#loadingSpinner').removeClass('d-none');
    $('#orderDetailContent').addClass('d-none');

    fetch('/admin/orders/' + orderId)
        .then(res => res.json())
        .then(data => {
            $('#off-order-id').text('#' + data.id);
            $('#off-receiver-name').text(data.receiverName);
            $('#off-receiver-phone').text(data.receiverPhone);
            $('#off-receiver-address').text(data.receiverAddress);
            $('#off-notes').text(data.orderNotes || "Không có ghi chú");
            $('#off-total-price').text(new Intl.NumberFormat('vi-VN', {
                style: 'currency', currency: 'VND'
            }).format(data.totalPrice));

            let itemsHtml = '';
            data.orderDetails.forEach(item => {
                let formatPrice = new Intl.NumberFormat('vi-VN').format(item.product.price);
                let formatTotalPrice = new Intl.NumberFormat('vi-VN').format(item.quantity * item.product.price)
                itemsHtml += `
                    <div class="d-flex align-items-center order-item-row">
                        <img src="/images/product/${item.product.image}" class="order-item-img mr-3">
                        <div style="flex: 1">
                            <div class="font-weight-bold small">${item.product.name}</div>
                            <div class="text-muted small">SL: ${item.quantity} x ${formatPrice}đ</div>
                        </div>
                        <div class="font-weight-bold small">
                            ${formatTotalPrice}đ
                        </div>
                    </div>
                `;
            });
            $('#off-order-items').html(itemsHtml);

            $('#off-edit-order').attr('href', '/admin/orders/update/' + data.id);
            $('#loadingSpinner').addClass('d-none');
            $('#orderDetailContent').removeClass('d-none');
        })
        .catch(err => {
            console.error(err);
            alert("Lỗi khi tải chi tiết đơn hàng!");
            closeOffcanvas();
        });
}

function closeOffcanvas() {
    $('#offcanvasOverlay').fadeOut(200);
    $('#offcanvasUserDetails').removeClass('active');
}
