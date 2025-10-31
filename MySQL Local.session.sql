-- TẠO DB VÀ BẢNG
DROP DATABASE IF EXISTS qlbh;
CREATE DATABASE qlbh CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE qlbh;

CREATE TABLE NhanVien (
    ma_nv VARCHAR(20) PRIMARY KEY,
    ten_nv VARCHAR(100) NOT NULL,
    gioi_tinh VARCHAR(10),
    dia_chi VARCHAR(255),
    sdt VARCHAR(20),
    chuc_vu VARCHAR(50)
);

CREATE TABLE SanPham (
    ma_sp VARCHAR(20) PRIMARY KEY,
    ten_sp VARCHAR(150) NOT NULL,
    loai_sp VARCHAR(50),
    mo_ta TEXT,
    gia DECIMAL(13,2) NOT NULL,
    so_luong_ton INT DEFAULT 0
);

CREATE TABLE KhachHang (
    ma_kh VARCHAR(20) PRIMARY KEY,
    ten_kh VARCHAR(100) NOT NULL,
    sdt VARCHAR(20),
    dia_chi VARCHAR(255),
    email VARCHAR(100)
);

CREATE TABLE HoaDon (
    ma_hd VARCHAR(20) PRIMARY KEY,
    ma_kh VARCHAR(20),
    ma_nv VARCHAR(20),
    ngay_lap DATE NOT NULL,
    tong_tien DECIMAL(13,2) DEFAULT 0,
    FOREIGN KEY (ma_kh) REFERENCES KhachHang(ma_kh) ON DELETE SET NULL,
    FOREIGN KEY (ma_nv) REFERENCES NhanVien(ma_nv) ON DELETE SET NULL
);

CREATE TABLE ChiTietHoaDon (
    ma_hd VARCHAR(20),
    ma_sp VARCHAR(20),
    so_luong INT NOT NULL,
    don_gia DECIMAL(13,2) NOT NULL,
    thanh_tien DECIMAL(13,2) GENERATED ALWAYS AS (so_luong * don_gia) STORED,
    PRIMARY KEY (ma_hd, ma_sp),
    FOREIGN KEY (ma_hd) REFERENCES HoaDon(ma_hd) ON DELETE CASCADE,
    FOREIGN KEY (ma_sp) REFERENCES SanPham(ma_sp) ON DELETE CASCADE
);

-- NHẬP DỮ LIỆU
INSERT INTO NhanVien VALUES
('NV0001', 'Nguyễn Văn A', 'Nam', 'Hà Nội', '0901234567', 'Quản lý'),
('NV0002', 'Trần Thị B', 'Nữ', 'TP.HCM', '0912345678', 'Nhân viên bán hàng');

INSERT INTO SanPham VALUES
('SP0001', 'Sạc nhanh 20W', 'Phụ kiện', 'Sạc nhanh iPhone', 250000, 100),
('SP0002', 'Ốp lưng iPhone 15', 'Phụ kiện', 'Chống sốc', 180000, 50),
('SP0003', 'Tai nghe Bluetooth', 'Phụ kiện', 'Không dây', 350000, 30),
('SP0004', 'Sạc dự phòng 10000mAh', 'Phụ kiện', 'Sạc nhanh', 450000, 20);

INSERT INTO KhachHang VALUES
('KH0001', 'Phạm Minh Tâm', 'Hải Phòng', '0988123123', 'tam@gmail.com'),
('KH0002', 'Nguyễn Thu Trang', 'Cần Thơ', '0977456712', 'trang@yahoo.com'),
('KH0003', 'Lưu Đức Mạnh', 'Đà Nẵng', '0909888777', 'manh@gmail.com');

INSERT INTO HoaDon VALUES
('HD0001', 'KH0001', 'NV0001', '2025-10-28', 2550000),
('HD0002', 'KH0002', 'NV0002', '2025-10-29', 1800000),
('HD0003', 'KH0003', 'NV0001', '2025-10-29', 3050000);

INSERT INTO ChiTietHoaDon (ma_hd, ma_sp, so_luong, don_gia) VALUES
('HD0001', 'SP0001', 1, 250000),
('HD0001', 'SP0002', 1, 180000),
('HD0002', 'SP0003', 1, 350000),
('HD0003', 'SP0001', 1, 250000),
('HD0003', 'SP0004', 2, 450000);

-- KIỂM TRA
SELECT * FROM NhanVien;
SELECT * FROM SanPham;
SELECT * FROM KhachHang;
SELECT * FROM HoaDon;
SELECT * FROM ChiTietHoaDon;
DESCRIBE NhanVien;
<<<<<<< HEAD
ALTER TABLE NhanVien CHANGE COLUMN gioi_tinh gioitinh VARCHAR(10);
=======
>>>>>>> a029a52990cf7fbdfd7a67cbb403e5f6f35ec87b
