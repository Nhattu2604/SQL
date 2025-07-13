CREATE PROCEDURE sp_ThemTreEm
    @HoTen NVARCHAR(100),
    @NgaySinh DATE,
    @GioiTinh NVARCHAR(3),
    @DiaChi NVARCHAR(200),
    @Ma_DocGia_NguoiLon NUMERIC
AS
BEGIN
    DECLARE @Ma_DocGia_TreEm NUMERIC

    -- [1] Xác định mã độc giả cho độc giả trẻ em
    SELECT @Ma_DocGia_TreEm = ISNULL(MAX(Ma_DocGia), 0) + 1 FROM DocGia

    -- [2] Thêm một bộ dữ liệu vào bảng độc giả
    INSERT INTO DocGia (Ma_DocGia, HoTen, NgaySinh, GioiTinh, DiaChi)
    VALUES (@Ma_DocGia_TreEm, @HoTen, @NgaySinh, @GioiTinh, @DiaChi)

    -- [3] Đếm số trẻ em của độc giả người lớn bảo lãnh trẻ em mới này
    DECLARE @SoTreEm INT
    SELECT @SoTreEm = COUNT(*) FROM TreEm WHERE Ma_DocGia_NguoiLon = @Ma_DocGia_NguoiLon

    -- [4] Kiểm tra thỏa quy định QĐ-3
    IF @SoTreEm >= 5
    BEGIN
        PRINT 'Độc giả người lớn đã đạt số lượng trẻ em tối đa.'
        RETURN
    END

    -- [5.1] Thêm một bộ dữ liệu vào bảng trẻ em
    INSERT INTO TreEm (Ma_DocGia, Ma_DocGia_NguoiLon)
    VALUES (@Ma_DocGia_TreEm, @Ma_DocGia_NguoiLon)
END
