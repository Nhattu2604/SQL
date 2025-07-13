CREATE TABLE LoaiSanPham (
    MaLSP NVARCHAR(10) PRIMARY KEY,
    TenLSP NVARCHAR(50) NOT NULL
);
GO
CREATE TABLE ChatLieu (
    MaCL NVARCHAR(10) PRIMARY KEY,
    TenCL NVARCHAR(50) NOT NULL
);
GO
CREATE TABLE NhaCungCap (
    MaNCC NVARCHAR(10) PRIMARY KEY,
    TenNCC NVARCHAR(50) NOT NULL
);
GO
CREATE TABLE KhachHang (
    MaKH NVARCHAR(10) PRIMARY KEY, -- Mã khách hàng
    TenKH NVARCHAR(100) NOT NULL, -- Tên khách hàng
    Email NVARCHAR(100), -- Email
    SoDienThoai NVARCHAR(20), -- Số điện thoại
    DiaChi NVARCHAR(200) -- Địa chỉ
);
GO
CREATE TABLE GioHang (
    MaGH NVARCHAR(10) PRIMARY KEY, -- Mã giỏ hàng
    MaKH NVARCHAR(10), -- Mã khách hàng (nếu có)
    NgayTao DATETIME DEFAULT GETDATE(), -- Ngày tạo giỏ hàng
    TrangThai NVARCHAR(20) DEFAULT N'Chờ thanh toán', -- Trạng thái giỏ hàng (ví dụ: 'Chờ thanh toán', 'Đã thanh toán')
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH) -- Khách hàng (nếu có bảng KhachHang)
);
Go
CREATE TABLE GioHangChiTiet (
    MaGH NVARCHAR(10), -- Mã giỏ hàng
    MaSP NVARCHAR(10), -- Mã sản phẩm
    SoLuong INT NOT NULL, -- Số lượng sản phẩm
    DonGia DECIMAL(10, 2) NOT NULL, -- Đơn giá sản phẩm
    ThanhTien AS (SoLuong * DonGia) PERSISTED, -- Thành tiền (số lượng x đơn giá)
    PRIMARY KEY (MaGH, MaSP), -- Khóa chính (giỏ hàng + sản phẩm)
    FOREIGN KEY (MaGH) REFERENCES GioHang(MaGH) ON DELETE CASCADE, -- Liên kết với bảng Giỏ hàng
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP) ON DELETE CASCADE -- Liên kết với bảng Sản phẩm
);
GO

CREATE TABLE SanPham (
    MaSP NVARCHAR(10) PRIMARY KEY,
    TenSP NVARCHAR(100) NOT NULL,
    MauSac NVARCHAR(20) NOT NULL,
    DonGia DECIMAL(10, 2) NOT NULL,
    KichThuoc NVARCHAR(50) NOT NULL,
	SoLuonng int NOT NULL DEFAULT 0,
    MaCL NVARCHAR(10),
    MaLSP NVARCHAR(10),
    MaNCC NVARCHAR(10),
    HinhAnh NVARCHAR(100),
    MoTa NVARCHAR(500), -- Mô tả sản phẩm
    rangThai BIT,       
    FOREIGN KEY (MaCL) REFERENCES ChatLieu(MaCL)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (MaLSP) REFERENCES LoaiSanPham(MaLSP)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO
INSERT INTO LoaiSanPham (MaLSP, TenLSP)
VALUES 
    ('LSP001', N'Tivi'),
    ('LSP002', N'Tủ lạnh'),
    ('LSP003', N'Máy giặt'),
    ('LSP004', N'Máy lạnh'),
    ('LSP005', N'Lò vi sóng'),
    ('LSP006', N'Điện máy tổng hợp');
GO
INSERT INTO ChatLieu (MaCL, TenCL)
VALUES 
    ('CL001', N'Nhựa cao cấp'),
    ('CL002', N'Thép không gỉ'),
    ('CL003', N'Kính chịu lực'),
    ('CL004', N'Hợp kim nhôm'),
    ('CL005', N'Nhựa ABS');
GO
INSERT INTO NhaCungCap (MaNCC, TenNCC)
VALUES 
    ('NCC001', N'Điện Máy Xanh'),
    ('NCC002', N'Nguyễn Kim'),
    ('NCC003', N'Pico'),
    ('NCC004', N'MediaMart'),
    ('NCC005', N'Điện Máy Chợ Lớn');
GO
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


CREATE PROCEDURE SanPham_TimKiem
    @MaSP NVARCHAR(10) = NULL,
    @TenSP NVARCHAR(100) = NULL,
    @MauSac NVARCHAR(20) = NULL,
    @DonGiaMin DECIMAL(10, 2) = NULL,
    @DonGiaMax DECIMAL(10, 2) = NULL,
    @MaCL NVARCHAR(10) = NULL,
    @MaNCC NVARCHAR(10) = NULL,
    @MaLSP NVARCHAR(10) = NULL,
    @TrangThai NVARCHAR(20) = NULL,
    @MoTa NVARCHAR(500) = NULL
AS
BEGIN
    DECLARE @SqlStr NVARCHAR(MAX);
    DECLARE @ParamList NVARCHAR(MAX);

    SET @SqlStr = 'SELECT * FROM SanPham WHERE 1=1';

    -- Điều kiện lọc dữ liệu
    IF @MaSP IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND MaSP = @MaSP';

    IF @TenSP IS NOT NULL
    BEGIN
        SET @TenSP = '%' + @TenSP + '%';
        SET @SqlStr = @SqlStr + ' AND TenSP LIKE @TenSP';
    END

    IF @MauSac IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND MauSac = @MauSac';

    IF @DonGiaMin IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND DonGia >= @DonGiaMin';

    IF @DonGiaMax IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND DonGia <= @DonGiaMax';

    IF @MaCL IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND MaCL = @MaCL';

    IF @MaNCC IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND MaNCC = @MaNCC';

    IF @MaLSP IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND MaLSP = @MaLSP';

    IF @TrangThai IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND TrangThai = @TrangThai';

    IF @MoTa IS NOT NULL
    BEGIN
        SET @MoTa = '%' + @MoTa + '%';
        SET @SqlStr = @SqlStr + ' AND MoTa LIKE @MoTa';
    END

    -- Danh sách tham số
    SET @ParamList = '
        @MaSP NVARCHAR(10),
        @TenSP NVARCHAR(100),
        @MauSac NVARCHAR(20),
        @DonGiaMin DECIMAL(10, 2),
        @DonGiaMax DECIMAL(10, 2),
        @MaCL NVARCHAR(10),
        @MaNCC NVARCHAR(10),
        @MaLSP NVARCHAR(10),
        @TrangThai NVARCHAR(20),
        @MoTa NVARCHAR(500)';

    -- Thực thi câu lệnh SQL động an toàn
    EXEC sp_executesql 
        @SqlStr,
        @ParamList,
        @MaSP = @MaSP,
        @TenSP = @TenSP,
        @MauSac = @MauSac,
        @DonGiaMin = @DonGiaMin,
        @DonGiaMax = @DonGiaMax,
        @MaCL = @MaCL,
        @MaNCC = @MaNCC,
        @MaLSP = @MaLSP,
        @TrangThai = @TrangThai,
        @MoTa = @MoTa;
END;
GO
-- Tạo bảng DonHang
CREATE TABLE DonHang (
    MaDH INT PRIMARY KEY,        -- Mã đơn hàng
    MaKH NVARCHAR(10),           -- Mã khách hàng
    NgayDatHang DATETIME,        -- Ngày đặt hàng
    TongTien DECIMAL(18, 2),     -- Tổng tiền
    -- Các cột khác nếu có
    CONSTRAINT FK_DonHang_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);
GO
-- Tạo bảng ChiTietDonHang
CREATE TABLE ChiTietDonHang (
    MaDH INT,                    -- Mã đơn hàng (tham chiếu đến bảng DonHang)
    MaSP NVARCHAR(50),           -- Mã sản phẩm
    SoLuong INT,                 -- Số lượng sản phẩm
    DonGia DECIMAL(18, 2),       -- Đơn giá
    PRIMARY KEY (MaDH, MaSP),    -- Khóa chính (kết hợp MaDH và MaSP)
    FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH) -- Ràng buộc khóa ngoại
);
GO
-- Tạo thủ tục DonHang_TimKiem
CREATE PROCEDURE DonHang_TimKiem
    @MaDH NVARCHAR(10) = NULL,
    @MaKH NVARCHAR(10) = NULL,
    @TrangThai NVARCHAR(20) = NULL,
    @NgayDatMin DATETIME = NULL,
    @NgayDatMax DATETIME = NULL,
    @TongTienMin DECIMAL(10, 2) = NULL,
    @TongTienMax DECIMAL(10, 2) = NULL
AS
BEGIN
    DECLARE @SqlStr NVARCHAR(MAX);
    DECLARE @ParamList NVARCHAR(MAX);

    SET @SqlStr = 'SELECT * FROM DonHang WHERE 1=1';

    -- Điều kiện lọc dữ liệu
    IF @MaDH IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND MaDH = @MaDH';

    IF @MaKH IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND MaKH = @MaKH';

    IF @TrangThai IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND TrangThai = @TrangThai';

    IF @NgayDatMin IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND NgayDatHang >= @NgayDatMin';

    IF @NgayDatMax IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND NgayDatHang <= @NgayDatMax';

    IF @TongTienMin IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND TongTien >= @TongTienMin';

    IF @TongTienMax IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND TongTien <= @TongTienMax';

    -- Thực thi câu lệnh SQL động
    EXEC sp_executesql @SqlStr, 
        N'@MaDH NVARCHAR(10), @MaKH NVARCHAR(10), @TrangThai NVARCHAR(20), 
          @NgayDatMin DATETIME, @NgayDatMax DATETIME, 
          @TongTienMin DECIMAL(10, 2), @TongTienMax DECIMAL(10, 2)', 
        @MaDH, @MaKH, @TrangThai, @NgayDatMin, @NgayDatMax, @TongTienMin, @TongTienMax;
END;
GO


DROP TABLE IF EXISTS SanPham;
GO




