-- Cập nhật kiểu dữ liệu cho MaDanhMuc thành VARCHAR trong bảng DanhMuc
CREATE TABLE DanhMuc (
    MaDanhMuc VARCHAR(50) PRIMARY KEY,  -- Đổi kiểu dữ liệu thành VARCHAR
    TenDanhMuc VARCHAR(255) NOT NULL
);
-- Cập nhật kiểu dữ liệu cho MaChatLieu thành VARCHAR trong bảng ChatLieu
CREATE TABLE ChatLieu (
    MaChatLieu VARCHAR(50) PRIMARY KEY,  -- Đổi kiểu dữ liệu thành VARCHAR
    TenChatLieu VARCHAR(255) NOT NULL
);
-- Cập nhật kiểu dữ liệu cho MaNhaCungCap thành VARCHAR trong bảng NhaCungCap
CREATE TABLE NhaCungCap (
    MaNhaCungCap VARCHAR(50) PRIMARY KEY, -- Đổi kiểu dữ liệu thành VARCHAR
    TenNhaCungCap VARCHAR(255) NOT NULL,
    NguoiLienHe VARCHAR(255),
    SoDienThoai VARCHAR(15),
    Email VARCHAR(255),
    DiaChi TEXT
);
-- Cập nhật bảng SanPham với kiểu dữ liệu VARCHAR cho MaDanhMuc, MaChatLieu, MaNhaCungCap
-- Sửa kiểu dữ liệu cho MaSanPham thành VARCHAR
CREATE TABLE SanPham (
    MaSanPham VARCHAR(50) PRIMARY KEY,         -- Đổi kiểu dữ liệu thành VARCHAR
    TenSanPham VARCHAR(255) NOT NULL,          -- Tên sản phẩm
    MaDanhMuc VARCHAR(50),                     -- Mã danh mục (VARCHAR)
    MaChatLieu VARCHAR(50),                    -- Mã chất liệu (VARCHAR)
    Gia DECIMAL(10, 2) NOT NULL,               -- Giá sản phẩm
    KichThuoc VARCHAR(255),                    -- Kích thước sản phẩm
    TrongLuong DECIMAL(5, 2),                  -- Trọng lượng sản phẩm
    SoLuongTon INT,                            -- Số lượng tồn
    MoTa TEXT,                                 -- Mô tả sản phẩm
    AnhSanPham VARCHAR(255),                   -- Ảnh sản phẩm
    MaNhaCungCap VARCHAR(50) NOT NULL,         -- Mã nhà cung cấp (VARCHAR)
    FOREIGN KEY (MaDanhMuc) REFERENCES DanhMuc(MaDanhMuc) ON DELETE SET NULL, -- Khóa ngoại danh mục
    FOREIGN KEY (MaChatLieu) REFERENCES ChatLieu(MaChatLieu) ON DELETE SET NULL, -- Khóa ngoại chất liệu
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap) ON DELETE CASCADE -- Khóa ngoại nhà cung cấp
);

-- Chèn dữ liệu vào bảng DanhMuc
INSERT INTO DanhMuc (MaDanhMuc, TenDanhMuc)
VALUES 
('BG11', 'Bàn làm việc'),
('BG12', 'Ghế văn phòng'),
('TQ13', 'Tủ hồ sơ'),
('SF14', 'Sofa phòng khách');


-- Chèn dữ liệu vào bảng NhaCungCap
INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap, NguoiLienHe, SoDienThoai, Email, DiaChi)
VALUES 
('XC11', 'Nội Thất Xuân Cường', 'Nguyễn Xuân Cường', '0397651209', 'xuancuong@gmail.com', '123 Đường Hai Bà Trưng, TP.HCM'),
('TV12', 'Nội Thất Minh Huy', 'Trần Minh Huy', '0987654321', 'minhhuy@gmail.com', '46/2 Đường Lý Tự Trọng, Hà Nội'),
('TV13', 'Công Ty Nội Thất Việt', 'Lê Văn Thất Việt', '0912345678', 'noithatviet@gmail.com', '21 Đường Quang Trung, Đà Nẵng'),
('MH14', 'Minh Huy', 'Trần Minh Huy', '0987654321', 'minhhuy2@gmail.com', '46/2 Đường Lý Tự Trọng, Hà Nội');



-- Chèn dữ liệu vào bảng ChatLieu
INSERT INTO ChatLieu (MaChatLieu, TenChatLieu)
VALUES 
('GTT11', 'Gỗ công nghiệp'),
('KL12', 'Kim loại'),
('GTT13', 'Gỗ tự nhiên'),
('N14', 'Nhựa cao cấp');

-- Chèn dữ liệu vào bảng SanPham
-- Chèn dữ liệu vào bảng SanPham với MaSanPham là VARCHAR
INSERT INTO SanPham (MaSanPham, TenSanPham, MaDanhMuc, MaChatLieu, Gia, KichThuoc, TrongLuong, SoLuongTon, MoTa, AnhSanPham, MaNhaCungCap)
VALUES 
('BH01', 'Bàn học gỗ công nghiệp', 'BG11', 'GTT11', 1200000, '120x60x75 cm', 20.5, 50, 'Bàn học nhỏ gọn, thiết kế hiện đại.', 'banhoc1.jpg', 'XC11'),
('G01', 'Ghế xoay văn phòng', 'BG12', 'KL12', 850000, '45x45x100 cm', 10.0, 30, 'Ghế xoay chất liệu kim loại, bọc nệm cao cấp.', 'ghexoay.jpg', 'TV12'),
('TQ01', 'Tủ hồ sơ 4 ngăn', 'TQ13', 'GTT13', 2500000, '90x40x180 cm', 45.0, 20, 'Tủ hồ sơ nhiều ngăn, chất liệu gỗ công nghiệp.', 'tuhoso.jpg', 'TV13'),
('SF01', 'Sofa băng 3 chỗ', 'SF14', 'N14', 7500000, '200x80x90 cm', 75.0, 10, 'Sofa phòng khách sang trọng, bọc nhựa cao cấp.', 'sofa.jpg', 'MH14');


