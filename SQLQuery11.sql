-- Nhập dữ liệu cho bảng ACCOUNT
INSERT INTO ACCOUNT (TenDangNhap, TenHienThi, MatKhau, LoaitaiKhoan) 
VALUES ('user1', 'Người dùng 1', 'password123', 'user'),
       ('admin1', 'Quản trị viên 1', 'adminpassword', 'admin'),
       ('user2', 'Người dùng 2', 'password456', 'user');

-- Nhập dữ liệu cho bảng NHANVIEN
INSERT INTO NHANVIEN (MaTaiKhoan, TenNV, GioiTinh, SoDienThoai, DiaChi, Email, MaKV)
VALUES (1, 'Nguyễn Nhật Trung', 'Nam', '0329324042', '10 Đường Nguyễn Văn Cừ, Quận 4, TP. Hồ Chí Minh', 'nnt@gmail.com', 1),
       (2, 'Lê Thị Mai', 'Nữ', '09876543212', '23 Đường Vạn Kiếp, Quận 2, TP. Hồ Chí Minh', 'ltm@gmai.com', 2),
       (3, 'Ngô Văn Hùng', 'Nam', '03356789013', '02 Đường Lạc Long Quân, Quận 8, TP. Hồ Chí Minh', 'nvh@gmail.com', 3);

-- Nhập dữ liệu cho bảng KHACHHANG
-- Thêm 6 số điện thoại ngẫu nhiên vào bảng KHACHHANG
INSERT INTO KHACHHANG (MaTaiKhoan, TenKH, SoDienThoai, DiaChi, Email)
VALUES (9, 'Nguyễn Thị Hồng', '0123456789', '78 Đường Đại lộ Mai Chí Thọ, Quận 3, TP. Hồ Chí Minh', 'nth@gmail.com'),
       (10, 'Trần Văn An', '0845678901', '101 Đường Tăng Nhơn Phú, Quận 4, TP. Hồ Chí Minh', 'tva@gmail.com'),
       (11, 'Phạm Minh Tuấn', '0456789012', '12 Đường Nguyễn Trãi, Quận 5, TP. Hồ Chí Minh', 'pmt@gmail.com'),
       (12, 'Hoàng Thị Lan', '0567890123', '45 Đường Lê Đại Hành, Quận 6, TP. Hồ Chí Minh', 'htl@gmail.com'),
       (13, 'Lý Thị Thu', '0678901234', '78 Đường Vạn Kiếp, Quận 7, TP. Hồ Chí Minh', 'ltt@gmail.com'),
       (14, 'Vũ Minh Hải', '0789012345', '101 Đường Phạm Văn Chí, Quận 8, TP. Hồ Chí Minh', 'vmh@gmail.com');
