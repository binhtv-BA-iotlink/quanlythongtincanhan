1. Tạo CÁC hàm theo yêu cầu sau (mỗi câu 1 làm riêng biệt)
select*from PHONGBAN
select*from NHANVIEN
 --a) Trả về tên phòng ban làm việc của nhân viên nếu biết mã nhân viên (1 điểm)
create function f_tenphongban (@MaNV char(5))
returns char(5)
as 
begin
declare @tenPB char(5)
set @TenPB = (select TenPB from PHONGBAN join NHANVIEN on PHONGBAN.MaPB = NHANVIEN.MaPB
where MaNV = (@MaNV)
return @tenpb
end 
--b) Trả về số lượng nhân viên trong phòng ban nếu biết tên phòng ban (1 điểm)
create function fSoNV (@TenPB varchar(50))
returns Varchar(50)
as
begin
	declare @b varchar (50)
	set @b = (select count(MaNV)
				from phongban join nhanvien on phongban.MaPB = nhanvien.MaPB
				where @TenPB=phongban.MaPB)
	return @b
end
--test
select dbo.fSoNV('N0002')
select*from phongban
--c) Trả về TỔNG số ngày công của toàn bộ dự án nếu biết mã dự án (1 điểm)
create function f_n
2. Tạo CÁC thủ tục sau (mỗi câu làm 1 thủ tục riêng biệt)

a) Cập nhật thời gian thực hiện dự án, với các yêu cầu như sau: (2 điểm)

 Input: mã dự án, thời gian bắt đầu, thời gian kết thúc

Output: 1) nếu thành công, 0) nếu thất bại

Process:

·         Bước 1: Kiểm tra nếu ngày bắt đầu >= ngày kết thúc à thông báo lỗi và kết thúc thủ tục trả về giá trị 0

·         Bước 2: cập nhật dữ liệu cho dự án có mã tương ứng. Nếu cập nhật thành công trả về 1, ngược lại trả về 0

b) Thêm mới dữ liệu vào bảng THAMGIA (2 điểm)

Input: mã nhân viên, mã dự án, số lượng ngày công

Output: 1) nếu thành công, 0) nếu thất bại

Process:

·         Bước 1: kiểm tra mã nhân viên đã tồn tại trong bảng NHANVIEN hay chưa? Nếu chưa, kết thúc thủ tục trả về 0

·         Bước 2: kiểm tra mã dự án đã tồn tại trong bảng DUAN hay chưa? Nếu chưa, kết thúc thủ tục trả về 0

·         Bước 3: Kiểm tra số lượng ngày công có hợp lệ (lớn hơn 0) hay không? Nếu không, kết thúc thủ tục trả về 0

·         Bước 4: thêm mới bản ghi với tham số đầu vào. Nếu thêm mới thành công kết thúc thủ tục trả về 1, ngược lại kết thúc thủ tục trả về 0.

3. (3 điểm)

a) Khi thêm mới dữ liệu cho bảng NHANVIEN, hãy đảm bảo rằng họ đã đủ 18 tuổi.

b) Khi thêm mới hoặc cập nhật dữ liệu cho bảng DUAN hãy đảm bảo rằng ngày kết thúc dự án là ngày hiện tại hoặc tương lai.

 