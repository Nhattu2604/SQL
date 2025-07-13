
CREATE TABLE DanhMuc (
    MaDanhMuc INT IDENTITY(1,1) PRIMARY KEY,
    TenDanhMuc VARCHAR(255) NOT NULL,
    
);


)CREATE TABLE NhaCungCap (
    MaNhaCungCap INT IDENTITY(1,1) PRIMARY KEY,
    TenNhaCungCap VARCHAR(255) NOT NULL,
    NguoiLienHe VARCHAR(255),
    SoDienThoai VARCHAR(15),
    Email VARCHAR(255),
    DiaChi TEXT,
   
);

CREATE TABLE ChatLieu (
    MaChatLieu INT IDENTITY(1,1) PRIMARY KEY,
    TenChatLieu VARCHAR(255) NOT NULL,
    
);

CREATE TABLE SanPham (
    MaSanPham INT IDENTITY(1,1) PRIMARY KEY,         -- Mã sản phẩm
    TenSanPham VARCHAR(255) NOT NULL,                 -- Tên sản phẩm
    MaDanhMuc INT NULL,                               -- Mã danh mục
    MaChatLieu INT NULL,                              -- Mã chất liệu
    Gia DECIMAL(10, 2) NOT NULL,                      -- Giá sản phẩm
    KichThuoc VARCHAR(255),                           -- Kích thước sản phẩm
    TrongLuong DECIMAL(5, 2),                         -- Trọng lượng sản phẩm
    SoLuongTon INT,                                   -- Số lượng tồn
    MoTa TEXT,                                        -- Mô tả sản phẩm
    AnhSanPham VARCHAR(255),                          -- Ảnh sản phẩm
    MaNhaCungCap INT NOT NULL,                        -- Mã nhà cung cấp, phải có nhà cung cấp khi thêm sản phẩm
    FOREIGN KEY (MaDanhMuc) REFERENCES DanhMuc(MaDanhMuc) ON DELETE SET NULL, -- Khóa ngoại danh mục
    FOREIGN KEY (MaChatLieu) REFERENCES ChatLieu(MaChatLieu) ON DELETE SET NULL, -- Khóa ngoại chất liệu
    FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap) ON DELETE CASCADE -- Khóa ngoại nhà cung cấp
);
