package com.shop.leolaptop.constant;

public class ErrorMessage {
    // Common
    public final static String FIELD_EMPTY = "Điền đủ thông tin";

    // User
    public final static String EMAIL_INVALID = "Định dạng email không hợp lệ";
    public final static String PASSWORD_INVALID = "Mật khẩu tối thiểu 8 ký tự";
    public final static String PHONE_INVALID = "Số điện thoại không hợp lệ";
    public final static String EMAIL_EXISTED = "Email đã tồn tại trong hệ thống";
    public final static String EMAIL_NOT_EXISTED = "Email không tồn tại trong hệ thống";
    public final static String RE_PASSWORD_NOT_MATCH = "Mật khẩu nhập lại không đúng";
    public final static String OLD_PASSWORD_NOT_MATCH = "Mật khẩu cũ không đúng";

    // Product
    public final static String NAME_NOT_EMPTY = "Tên sản phẩm không được để trống";
    public final static String DESC_NOT_EMPTY = "Mô tả sản phẩm không được để trống";
    public final static String FACTORY_NOT_EMPTY = "Nhà sản xuất không được để trống";
    public final static String TARGET_NOT_EMPTY = "Mục đích sử dụng không được để trống";
    public final static String PRICE_INVALID = "Giá tiền không hợp lệ";
    public final static String QUANTITY_INVALID = "Số lượng không hợp lệ";

    // Checkout
    public final static String CHECKOUT_RECEIVER_NAME_NOT_BLANK = "Tên người nhận không được để trống";
    public final static String CHECKOUT_RECEIVER_ADDRESS_NOT_BLANK = "Địa chỉ nhận hàng không được để trống";
    public final static String CHECKOUT_RECEIVER_PHONE_NOT_BLANK = "Số điện thoại không được để trống";
    public final static String CHECKOUT_PAYMENT_METHOD_NOT_BLANK = "Vui lòng chọn phương thức thanh toán";

    // ORDER
    public final static String ORDER_ACCESS_DENIED = "Bạn không có quyền chỉnh sửa đơn hàng này";
}
