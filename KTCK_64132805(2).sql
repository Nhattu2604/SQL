ALTER TABLE SanPham
ADD SoLuong INT DEFAULT 0;
EXEC sp_help 'SanPham';
DELETE FROM SanPham
WHERE MaSP IN ('SP001', 'SP002', 'SP003', 'SP004', 'SP005', 'SP006', 'SP007', 'SP008', 'SP009', 'SP010', 'SP011');
INSERT INTO SanPham (MaSP, TenSP, MauSac, DonGia, KichThuoc, MaCL, MaLSP, MaNCC, HinhAnh, MoTa, TrangThai, SoLuong)
VALUES
    ('SP001', N'Tivi LG OLED 55 Inch', N'Đen', 15000, N'55 Inch', 'CL003', 'LSP001', 'NCC001', 'tivi-lg-oled-55.jpg', N'Tivi LG OLED 55 inch, màn hình sắc nét, âm thanh sống động.', N'Còn hàng', 20),
    ('SP002', N'Tủ lạnh Samsung Inverter 300L', N'Xám', 12000, N'300L', 'CL002', 'LSP002', 'NCC002', 'tu-lanh-samsung-300l.jpg', N'Tủ lạnh Samsung, công nghệ Inverter tiết kiệm điện.', N'Còn hàng', 10),
    ('SP003', N'Máy giặt Electrolux 8kg', N'Tráng', 8000, N'8kg', 'CL002', 'LSP003', 'NCC003', 'may-giat-electrolux-8kg.jpg', N'Máy giặt Electrolux, khối lượng giặt 8kg, tiết kiệm nước.', N'Còn hàng', 15),
    ('SP004', N'Máy lạnh Panasonic 1.5HP', N'Trắng', 10000, N'1.5HP', 'CL005', 'LSP004', 'NCC004', 'may-lanh-panasonic-1.5hp.jpg', N'Máy lạnh Panasonic, làm lạnh nhanh, tiết kiệm điện.', N'Còn hàng', 5),
    ('SP005', N'Lò vi sóng Sharp 25L', N'Bạc', 3000, N'25L', 'CL001', 'LSP005', 'NCC005', 'lo-vi-song-sharp-25l.jpg', N'Lò vi sóng Sharp, dung tích 25L, nhiều chức năng nấu.', N'Còn hàng', 25),
    ('SP006', N'Điện máy tổng hợp Samsung 4 trong 1', N'Bạc', 45000, N'Đa năng', 'CL003', 'LSP006', 'NCC002', 'dien-may-4-trong-1.jpg', N'Sản phẩm tích hợp nhiều công năng trong một thiết bị.', N'Còn hàng', 30),
    ('SP007', N'Tivi Sony 65 Inch', N'Đen', 25000, N'65 Inch', 'CL003', 'LSP001', 'NCC001', 'tivi-sony-65.jpg', N'Tivi Sony 65 inch, hình ảnh sắc nét, âm thanh sống động.', N'Còn hàng', 40),
    ('SP008', N'Tủ lạnh LG Inverter 500L', N'Xám', 18000, N'500L', 'CL002', 'LSP002', 'NCC002', 'tu-lanh-lg-500l.jpg', N'Tủ lạnh LG với công nghệ Inverter tiết kiệm năng lượng.', N'Còn hàng', 15),
    ('SP009', N'Máy giặt Samsung 9kg', N'Trắng', 9000, N'9kg', 'CL002', 'LSP003', 'NCC003', 'may-giat-samsung-9kg.jpg', N'Máy giặt Samsung, khối lượng giặt 9kg, tiết kiệm điện.', N'Còn hàng', 10),
    ('SP010', N'Máy lạnh Daikin 1HP', N'Trắng', 11000, N'1HP', 'CL005', 'LSP004', 'NCC004', 'may-lanh-daikin-1hp.jpg', N'Máy lạnh Daikin, làm lạnh nhanh, tiết kiệm điện.', N'Còn hàng', 20),
    ('SP011', N'Lò vi sóng Samsung 20L', N'Bạc', 3500, N'20L', 'CL001', 'LSP005', 'NCC005', 'lo-vi-song-samsung-20l.jpg', N'Lò vi sóng Samsung, dung tích 20L, nhiều chức năng tiện lợi.', N'Còn hàng', 50);
GO
ALTER TABLE DonHang
ADD TrangThai NVARCHAR(20) DEFAULT 'Chờ xử lý';
