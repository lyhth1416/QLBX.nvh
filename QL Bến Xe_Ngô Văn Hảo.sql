create database QLBenXe_NgoVanHao

create table XE_OTO (
   MaSoXe Nvarchar (10) primary key,
   BienSo Nvarchar (10) not null,
   SoGhe int,
   MaChuXe Nvarchar (10) not null references CHU_XE (MaChuXe),
   MaSoTuyen Nvarchar (10) references TUYEN (MaSoTuyen),
   MaChatLuong Nvarchar (20) references CHAT_LUONG (MaChatLuong),
   )
   
create table CHU_XE (
   MaChuXe Nvarchar (10) primary key,
   TenChuXe Nvarchar (20) not null,
   SoCMT Nvarchar (20) not null,
   DiaChi Nvarchar (30),
   DienThoai Nvarchar (20),
   )

create table TUYEN (
   MaSoTuyen Nvarchar (10),
   DiaDiem1 Nvarchar (30),
   DiaDiem2 Nvarchar (30),
   DoDai Nvarchar (10),
   primary key (MaSoTuyen),
   )

create table PHIEUDANGTAI (
   MaPDT Nvarchar (20) primary key,
   MaSoXe Nvarchar (10) references XE_OTO (MaSoXe),
   MaSoTuyen Nvarchar (10) references TUYEN (MaSoTuyen),
   Ngay Date,
   )

create table CHAT_LUONG (
   MaChatLuong Nvarchar (20) primary key,
   ChatLuong Nvarchar (30),
   )

create table VE (
   MaSoVe Nvarchar (20) primary key,
   MaSoXe Nvarchar (10) references XE_OTO (MaSoXe),
   SoGhe int,
   )

create table NHAN_VIEN (
   MaNhanVien Nvarchar (20) primary key,
   TenNhanVien Nvarchar (30),
   GioiTinh Nvarchar (20),
   NgaySinh Date,
   DiaChi Nvarchar (30),
   SoDienThoai Nvarchar (30),
   MaChucVu Nvarchar (20) references CHUC_VU (MaChucVu),
   MaSoLuong Nvarchar (20) references LUONG (MaSoLuong),
   MaPhongBan Nvarchar (20) references PHONG_BAN (MaPhongBan)
   )

create table HOADON_BANVE (
   MaHDB Nvarchar (20) primary key,
   MaSoXe Nvarchar (10) references XE_OTO (MaSoXe),
   MaKhach int,
   MaNhanVien Nvarchar (20),
   SoLuong int,
   NgapLap Date,
   DonGia int,
   )

create table HOADON_DIADIEM (
   MaHDDD Nvarchar (20) primary key,
   MaSoXe Nvarchar (10) references XE_OTO (MaSoXe),
   MaNhanVien Nvarchar (20) references NHAN_VIEN (MaNhanVien),
   SoLuong int,
   NgayLap Date,
   SoTien int,
   )

create table CHUC_VU (
   MaChucVu Nvarchar (20) primary key,
   ChucVu Nvarchar (30),
   )

create table PHONG_BAN (
   MaPhongBan Nvarchar (20) primary key,
   TenPhongBan Nvarchar (20),
   )

create table LUONG (
   MaSoLuong Nvarchar (20) primary key,
   HeSoLuong Nvarchar (10),
   )

create table LENH_XUAT_BEN (
   MaLenhXuatBen Nvarchar (20) primary key,
   NgayCap Date,
   NhanVienCap Nvarchar (20),
   MaSoXe Nvarchar (10) references XE_OTO (MaSoXe),
   )


           ---Nhập dữ liệu các bảng---MHDBV

select * from XE_OTO
  insert into XE_OTO
        (MaSoXe, BienSo, SoGhe, MaChuXe, MaSoTuyen, MaChatLuong)
  values
        ('XE01', '13579', '36', 'CX01', 'TN01', 'CL01'),
		('XE02', '24680', '12', 'CX02', 'TN02', 'CL02'),
		('XE03', '15789', '41', 'CX03', 'TN03', 'CL03'),
		('XE04', '13456', '09', 'CX04', 'TN04', 'CL04'),
		('XE05', '12345', '36', 'CX05', 'TN05', 'CL05'),
		('XE06', '17654', '12', 'CX06', 'TN06', 'CL06'),
		('XE07', '23456', '09', 'CX07', 'TN07', 'CL07'),
		('XE08', '13987', '36', 'CX08', 'TN08', 'CL08'),
		('XE09', '02468', '41', 'CX09', 'TN09', 'CL09'),
		('XE10', '45678', '36', 'CX10', 'TN10', 'CL10')

select * from CHU_XE
   insert into CHU_XE
        (MaChuXe, TenChuXe, SoCMT, DiaChi, DienThoai)
	values
	    ('CX01', N'Ngô Văn Hảo', 'SCMT01', N'Hà Nội', '0967675782'),
		('CX02', N'An Linh Nga', 'SCMT02', N'Hà Nội', '0966765765'),
		('CX03', N'Trịnh Sỹ Hoàng', 'SCMT03', N'Thanh Hóa', '0329864432'),
		('CX04', N'Lê Khắc Nam', 'SCMT04', N'Ninh Bình', '0357438454'),
		('CX05', N'Lê Minh Quang', 'SCMT05', N'Nam Định', '0385374732'),
		('CX06', N'Nguyễn Quý Nam', 'SCMT06', N'Hà Nam', '0395327572'),
		('CX07', N'Ngô Văn Đạt', 'SCMT07', N'Hà Nội', '0395327572'),
		('CX08', N'Trịnh Ngọc Huy', 'SCMT08', N'Hà Nội', '0345486845'),
		('CX09', N'Hà Hương Lý', 'SCMT09', N'Phú Thọ', '0356385536'),
		('CX10', N'Lê Giang Thanh', 'SCMT10', N'Hải Dương', '0379534363')

select * from TUYEN
  insert into TUYEN
        (MaSoTuyen, DiaDiem1, DiaDiem2, DoDai)
  values
        ('TN01', N'Thanh Hóa', N'Hà Nội', '178km'),
		('TN02', N'Phú Thọ', N'Hà Nội', '78km'),
		('TN03', N'Ninh Bình', N'Hà Nội', '68km'),
		('TN04', N'Nam Định', N'Hà Nội', '48km'),
		('TN05', N'Hà Tĩnh', N'Hà Nội', '260km'),
		('TN06', N'Sài Gòn', N'Hà Nội', '1728km'),
		('TN07', N'Bắc Giang', N'Hà Nội', '58km'),
		('TN08', N'Hòa Bình', N'Hà Nội', '88km'),
		('TN09', N'Quảng Ninh', N'Hà Nội', '178km'),
		('TN10', N'Hải Phòng', N'Hà Nội', '128km')
	
select * from PHIEUDANGTAI
  insert into PHIEUDANGTAI
        (MaPDT, MaSoXe, MaSoTuyen, Ngay)
  values
        ('PDT01', 'XE01', 'TN01', '2022/05/03'),
		('PDT02', 'XE02', 'TN02', '2022/05/02'),
		('PDT03', 'XE03', 'TN03', '2022/05/01'),
		('PDT04', 'XE04', 'TN04', '2022/05/04'),
		('PDT05', 'XE05', 'TN05', '2022/05/09'),
		('PDT06', 'XE06', 'TN06', '2022/01/01'),
		('PDT07', 'XE07', 'TN07', '2022/03/01'),
		('PDT08', 'XE08', 'TN08', '2022/06/01'),
		('PDT09', 'XE09', 'TN09', '2022/04/01'),
		('PDT10', 'XE10', 'TN10', '2022/02/01')

select * from CHAT_LUONG
  insert into CHAT_LUONG
        (MaChatLuong, ChatLuong)
  values
        ('CL01', N'Chất lượng xe tốt'),
		('CL02', N'Chất lượng xe khá'),
		('CL03', N'Chất lượng xe khá'),
		('CL04', N'Chất lượng xe tốt'),
		('CL05', N'Chất lượng xe tốt'),
		('CL06', N'Chất lượng xe tốt'),
		('CL07', N'Chất lượng xe khá'),
		('CL08', N'Chất lượng xe tốt'),
		('CL09', N'Chất lượng xe khá'),
		('CL10', N'Chất lượng xe khá')

select * from VE
   insert into VE
         (MaSoVe, MaSoXe, SoGhe)
	values
	     ('Ve01', 'XE01', '36'),
		 ('Ve02', 'XE02', '12'),
		 ('Ve03', 'XE03', '41'),
		 ('Ve04', 'XE04', '09'),
		 ('Ve05', 'XE05', '36'),
		 ('Ve06', 'XE06', '12'),
		 ('Ve07', 'XE07', '09'),
		 ('Ve08', 'XE08', '36'),
		 ('Ve09', 'XE09', '41'),
		 ('Ve10', 'XE10', '36')
		
select * from NHAN_VIEN
  insert into NHAN_VIEN
        (MaNhanVien, TenNhanVien, GioiTinh, NgaySinh, DiaChi, SoDienThoai, MaChucVu, MaSoLuong, MaPhongBan)
  values
        ('NV01', N'Đàm Minh Thạc', 'Nam', '2000/10/02', N'Hòa Bình','0967675782', 'CV01', 'LG01', 'PB101'),
		('NV02', N'Hoàng Phúc Khang','Nam', '2003/02/07', N'Hậu Giang','0329864432','CV02', 'LG02', 'PB102'),
		('NV03', N'Lưu Quốc Mỹ','Nam', '2000/12/11', N'Hải Phòng','0357438454','CV03', 'LG03', 'PB103'),
		('NV04', N'Vũ Thị Nguyên', N'Nữ', '1998/09/09', N'Hà Tĩnh','0385374732','CV04', 'LG04', 'PB104'),
		('NV05', N'Tri Tấn Trình', 'Nam', '2002/12/28', N'Hà Nội','0395327572','CV05', 'LG05', 'PB105'),
		('NV06', N'Ngô Quang Thái', 'Nam', '2003/10/12', N'Hà Nam','0395327572','CV06', 'LG06', 'PB201'),
		('NV07', N'Trịnh Thị Thảo', N'Nữ', '2002/12/08', N'Hà Giang','0345486845','CV07', 'LG07', 'PB202'),
		('NV08', N'Đàm Minh Thạc', 'Nam', '2001/08/01', N'Gia Lai','0356385536','CV08', 'LG08', 'PB203'),
		('NV09', N'Sùng Mạnh Thắng','Nam', '1997/12/09', N'Đồng Tháp','0379534933','CV09', 'LG09', 'PB204'),
		('NV10', N'Lê Thị Lợi', N'Nữ', '1999/05/25', N'An Giang','0379534363','CV10', 'LG10', 'PB205')

select * from HOADON_BANVE
  insert into HOADON_BANVE
        (MaHDB, MaSoXe, MaKhach, MaNhanVien, SoLuong, NgapLap, DonGia)
  values
        ('HDB01','XE01','01','NV01','1','2022/05/05','40000'),
        ('HDB02','XE02','02','NV02','2','2022/05/03','30000'),
        ('HDB03','XE03','03','NV03','3','2022/05/01','40000'),
        ('HDB04','XE04','04','NV04','4','2022/05/02','40000'),
        ('HDB05','XE05','05','NV05','5','2022/05/04','30000'),
        ('HDB06','XE06','06','NV06','6','2021/12/06','30000'),
        ('HDB07','XE07','07','NV07','7','2022/05/06','30000'),
        ('HDB08','XE08','08','NV08','8','2021/10/06','40000'),
        ('HDB09','XE09','09','NV09','9','2022/03/06','30000'),
        ('HDB10','XE10','10','NV10','10','2021/09/06','40000')

select * from HOADON_DIADIEM
  insert into HOADON_DIADIEM 
         (MaHDDD, MaSoXe, MaNhanVien, SoLuong, NgayLap, SoTien)
  values 
         ('HDDD01','XE01','NV01','1','2021/12/05','800000'),
		 ('HDDD02','XE02','NV02','2','2021/11/05','800000'),
		 ('HDDD03','XE03','NV03','3','2022/02/05','1000000'),
		 ('HDDD04','XE04','NV04','4','2022/01/05','1000000'),
		 ('HDDD05','XE05','NV05','5','2022/06/05','1000000'),
		 ('HDDD06','XE06','NV06','4','2022/04/05','800000'),
		 ('HDDD07','XE07','NV07','3','2022/03/05','1000000'),
		 ('HDDD08','XE08','NV08','2','2022/02/06','800000'),
		 ('HDDD09','XE09','NV09','1','2022/05/07','800000'),
		 ('HDDD10','XE10','NV10','6','2022/04/09','1000000')

select * from CHUC_VU
  insert into CHUC_VU
         (MaChucVu, ChucVu)
  values
         ('CV01', N'Chức vụ 1'),
		 ('CV02', N'Chức vụ 2'),
		 ('CV03', N'Chức vụ 3'),
		 ('CV04', N'Chức vụ 4'),
		 ('CV05', N'Chức vụ 5'),
		 ('CV06', N'Chức vụ 6'),
		 ('CV07', N'Chức vụ 7'),
		 ('CV08', N'Chức vụ 8'),
		 ('CV09', N'Chức vụ 9'),
		 ('CV10', N'Chức vụ 10')

select * from PHONG_BAN
  insert into PHONG_BAN
         (MaPhongBan, TenPhongBan)
  values
         ('PB101', N'Phòng ban 1'),
		 ('PB102', N'Phòng ban 2'),
		 ('PB103', N'Phòng ban 3'),
		 ('PB104', N'Phòng ban 4'),
		 ('PB105', N'Phòng ban 5'),
		 ('PB201', N'Phòng ban 6'),
		 ('PB202', N'Phòng ban 7'),
		 ('PB203', N'Phòng ban 8'),
		 ('PB204', N'Phòng ban 9'),
		 ('PB205', N'Phòng ban 10')

select * from LUONG
  insert into LUONG
         (MaSoLuong, HeSoLuong)
  values 
         ('LG01', '9000000'),
		 ('LG02', '7000000'),
		 ('LG03', '8000000'),
		 ('LG04', '8500000'),
		 ('LG05', '7500000'),
		 ('LG06', '7000000'),
		 ('LG07', '6500000'),
		 ('LG08', '7000000'),
		 ('LG09', '650000'),
		 ('LG10', '8000000')
		
select * from LENH_XUAT_BEN
  insert into LENH_XUAT_BEN 
         (MaLenhXuatBen, NgayCap, NhanVienCap, MaSoXe)
  values 
         ('LXB01','01/01/2022','NV01','XE01'),
		 ('LXB02','01/02/2022','NV02','XE02'),
		 ('LXB03','01/03/2022','NV03','XE03'),
		 ('LXB04','01/04/2022','NV04','XE04'),
		 ('LXB05','01/05/2022','NV05','XE05'),
		 ('LXB06','01/06/2022','NV06','XE06'),
		 ('LXB07','02/01/2022','NV07','XE07'),
		 ('LXB08','03/01/2022','NV08','XE08'),
		 ('LXB09','04/01/2022','NV09','XE09'),
		 ('LXB10','05/01/2022','NV10','XE10')

select * from XE_OTO
select * from CHU_XE
select * from TUYEN
select * from PHIEUDANGTAI
select * from CHAT_LUONG
select * from VE
select * from NHAN_VIEN
select * from HOADON_BANVE
select * from HOADON_DIADIEM
select * from CHUC_VU
select * from PHONG_BAN
select * from LUONG
select * from LENH_XUAT_BEN
                ----- Truy vấn---

Select MaSoXe, SoGhe, MaChuXe from XE_OTO
where MaSoXe = 'XE01'

Select * from CHU_XE where TenChuXe Like '%a%'

Select * from NHAN_VIEN where DiaChi Like N'%Hà%'

Select TenNhanVien, NgaySinh, DiaChi from NHAN_VIEN where NgaySinh > '2000/01/01'

Select * from NHAN_VIEN where TenNhanVien = N'Vũ Thị Nguyên'

Select * from HOADON_DIADIEM where SoTien Between 500000 and 900000

Select * from HOADON_BANVE where MaHDB = 'HDB05'

Select * from LUONG where HeSoLuong < '8000000'

Select * from CHUC_VU order by ChucVu

Select * from PHIEUDANGTAI where MaSoXe in ('XE01', 'XE05')

Select top 5 * from NHAN_VIEN

Select distinct DoDai from TUYEN

SELECT CONCAT(TenNhanVien ,', ', DiaChi)as N'Họ tên và địa chỉ nhân viên'
FROM NHAN_VIEN

SELECT TenNhanVien,year(getdate())-year(NgaySinh) AS N'Tuổi' FROM NHAN_VIEN

Select TenNhanVien as N'Nhân viên có lương cao nhất', HeSoLuong as N'Tiền lương'
from NHAN_VIEN nv join LUONG lg
on nv.MaSoLuong= lg.MaSoLuong
where HeSoLuong = (Select max(HeSoLuong) from LUONG)

Select TenNhanVien as N'Nhân viên có lương thấp nhất',
HeSoLuong As N'Tiền lương'
from NHAN_VIEN nv join LUONG lg
on nv.MaSoLuong = lg.MaSoLuong
where HeSoLuong = (Select min(HeSoLuong) from LUONG)

select nv.MaSoLuong, TenNhanVien, DiaChi, SoDienThoai, NgaySinh, MaChucVu, MaPhongBan,
HeSoLuong
from NHAN_VIEN Nv join LUONG Lg on Nv.MaSoLuong = lg.MaSoLuong

Select x.MaSoXe, BienSo, SoGhe, MaSoTuyen, MaChatLuong
from XE_OTO x join CHU_XE c on x.MaChuXe = c.MaChuXe
where SoGhe > '12'

SELECT(Year(NgaySinh)) as N'Năm sinh',
count(*) as N'Số người trùng năm sinh'
FROM NHAN_VIEN
GROUP BY (Year(NgaySinh))
ORDER BY N'Năm sinh' ASC

SELECT(Month(NgaySinh)) AS Tháng, count(*) as N'Số người có tháng sinh trùng nhau từ tháng 10 đến tháng 12'
FROM NHAN_VIEN
GROUP BY (month(NgaySinh))
Having (month(NgaySinh)) >= '10'

Create trigger DoDaiDuongDi on TUYEN
for update
as
if exists (select DoDai from inserted where DoDai > 100)
begin print N'Độ dài tuyến đường vượt qúa 10 nên hủy cập nhật'
rollback transaction end
else
begin
print 'Cap nhat thanh cong'
end
exec DoDaiDuongDi
Create procedure ChuXeHN
AS
BEGIN
SELECT *
FROM CHU_XE where DiaChi = N'Hà Nội'
END
Exec ChuXeHN




create view Nhieutien as
select * from HOADON_DIADIEM
where SoTien = ( select max (SoTien) from HOADON_DIADIEM )
select * from Nhieutien

CREATE VIEW Don_Gia as
select * from HOADON_BANVE 
WHERE DonGia = ( SELECT MAX (DonGia) from HOADON_BANVE )
SELECT * FROM Don_Gia 