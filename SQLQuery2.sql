CREATE TABLE LoaiNoiThat (
    MaLNT NVARCHAR(10) PRIMARY KEY,
    TenLNT NVARCHAR(50) NOT NULL
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

CREATE TABLE SanPham (
    MaSP NVARCHAR(10) PRIMARY KEY,
    TenSP NVARCHAR(100) NOT NULL,
    MauSac NVARCHAR(20) NOT NULL,
    DonGia DECIMAL(10, 2) NOT NULL,
    KichThuoc NVARCHAR(50) NOT NULL,
    MaCL NVARCHAR(10),
    MaLNT NVARCHAR(10),
    MaNCC NVARCHAR(10),
    Loai BIT DEFAULT(1),
    HinhAnh NVARCHAR(100),
	MoTa NVARCHAR(500),  -- Thuộc tính mô tả mới
    FOREIGN KEY (MaCL) REFERENCES ChatLieu(MaCL)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (MaLNT) REFERENCES LoaiNoiThat(MaLNT)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
GO
INSERT INTO LoaiNoiThat (MaLNT, TenLNT)
VALUES 
    ('LNT001', N'Bàn ghế'),
    ('LNT002', N'Tủ kệ'),
    ('LNT003', N'Giường'),
    ('LNT004', N'Sofa'),
    ('LNT005', N'Trang trí');
GO

INSERT INTO ChatLieu (MaCL, TenCL)
VALUES 
    ('CL001', N'Gỗ tự nhiên'),
    ('CL002', N'Gỗ công nghiệp'),
    ('CL003', N'Kim loại'),
    ('CL004', N'Nhựa'),
    ('CL005', N'Kính');
GO

INSERT INTO NhaCungCap (MaNCC, TenNCC)
VALUES 
    ('NCC001', N'Nội Thất Hoàng Anh'),
    ('NCC002', N'Nội Thất Phố Xinh'),
    ('NCC003', N'Nội Thất Hòa Phát'),
    ('NCC004', N'Nội Thất Minh Đức'),
    ('NCC005', N'Nội Thất Gia Hưng');
GO

INSERT INTO SanPham (MaSP, TenSP, MauSac, DonGia, KichThuoc, MaCL, MaLNT, MaNCC, Loai, HinhAnh, MoTa)
VALUES 
    ('SP001', N'Bàn ăn gỗ sồi', N'Nâu', 5000.00, N'120x80x75cm', 'CL001', 'LNT001', 'NCC001', 1, 'ban-an-go-soi.jpg', N'Bàn ăn gỗ sồi kiểu dáng hiện đại, chất liệu gỗ tự nhiên, màu nâu sang trọng.'),
    ('SP002', N'Tủ quần áo 3 cánh', N'Tráng', 7000.00, N'180x60x200cm', 'CL002', 'LNT002', 'NCC002', 0, 'tu-quan-ao-3-canh.jpg', N'Tủ quần áo 3 cánh thiết kế tinh tế, chất liệu gỗ công nghiệp cao cấp, màu trắng sáng.'),
    ('SP003', N'Giường ngủ hiện đại', N'Xám', 8000.00, N'200x180x40cm', 'CL002', 'LNT003', 'NCC003', 1, 'giuong-ngu-hien-dai.jpg', N'Giường ngủ hiện đại, màu xám trung tính, kích thước phù hợp với mọi không gian phòng ngủ.'),
    ('SP004', N'Sofa da cao cấp', N'Đen', 15000.00, N'250x90x80cm', 'CL003', 'LNT004', 'NCC004', 0, 'sofa-da-cao-cap.jpg', N'Sofa da cao cấp, màu đen sang trọng, chất liệu da êm ái, phù hợp với phòng khách hiện đại.'),
    ('SP005', N'Trang trí đèn chùm', N'Vàng', 3000.00, N'50x50x50cm', 'CL005', 'LNT005', 'NCC005', 1, 'den-chum-trang-tri.jpg', N'Đèn chùm trang trí, màu vàng ấm áp, thiết kế tinh tế giúp không gian thêm phần sang trọng.');
GO

CREATE PROCEDURE SanPham_TimKiem
    @MaSP NVARCHAR(10) = NULL,
    @TenSP NVARCHAR(100) = NULL,
    @MauSac NVARCHAR(20) = NULL,
    @DonGiaMin DECIMAL(10, 2) = NULL,
    @DonGiaMax DECIMAL(10, 2) = NULL,
    @MaCL NVARCHAR(10) = NULL,
    @MaNCC NVARCHAR(10) = NULL,
    @MaLNT NVARCHAR(10) = NULL,
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

    IF @MaLNT IS NOT NULL
        SET @SqlStr = @SqlStr + ' AND MaLNT = @MaLNT';

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
        @MaLNT NVARCHAR(10),
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
        @MaLNT = @MaLNT,
        @MoTa = @MoTa;
END;
GO


