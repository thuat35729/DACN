<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="row">
    <div class="col-7">
        <h2>Danh sách hoá đơn</h2>
        <table class="table">
            <thead>
            <tr>
                <td>STT</td>
                <td>ID</td>
                <td>Ten khach hang</td>
                <td>Ngay tao</td>
                <td>Trang Thai</td>
                <td>Chuc nang</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listhd}" var="hd" varStatus="i">
                <tr>
                    <td>${i.index + 1}</td>
                    <td>${hd.id}</td>
                    <td>${hd.id_khachHang.hoTen}</td>
                    <td>${hd.ngayTao}</td>
                    <td>${hd.trangThai}</td>
                    <td>
                        <a href="/ban-hang/view?id=${hd.id}">
                            <button class="btn btn-info">Chon</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <h2>Danh sách hoá đơn chi tiết</h2>
        <table class="table">
            <thead>
            <tr>
                <td>STT</td>
                <td>ID</td>
                <td>Ten san pham</td>
                <td>So luong</td>
                <td>Gia ban</td>
                <td>Tong tien</td>
                <td>Chuc nang</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach varStatus="i" var="hdct" items="${listhdct}">
                <tr>
                    <td>${i.index +1}</td>
                    <td>${hdct.id}</td>
                    <td>${hdct.id_ctsp.id_sanPham.tenSP}</td>
                    <td>${hdct.soLuong}</td>
                    <td>${hdct.id_ctsp.giaBan}</td>
                    <td>${hdct.tongTien}</td>
                    <td>
                        <a href="/ban-hang/xoaSP?idHDCT=${hdct.id}">
                            <button class="btn btn-danger">DELETE</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-5">
        <h2>Tạo hoá đơn</h2>
        <div class="row">
            <div>
                <form>
                    <form action="/ban-hang/view" method="get">
                        <div>
                            <label class="mb-3 col-3" name="sdt">Số điện thoại</label>
                            <input type="text" class="col-7">
                        </div>
                        <button class="btn btn-primary" type="submit">Search</button>
                    </form>
                </form>
            </div>

            <form action="/ban-hang/them-hd" method="post">
                <div class="mb-3">
                    <label class="col-3">Ten Khach hang</label>
                    <input type="text" class="col-7" readonly
                           value="${listtthd[0].id_khachHang.hoTen} ${listkh[0].hoTen}">
                    <input hidden="hidden"
                           value="${listtthd[0].id_khachHang.id} ${listkh[0].id}" name="id_khachHang">
                    <input hidden="hidden"
                           value="${listtthd[0].id_khachHang.diaChi} ${listkh[0].diaChi}" name="diaChi">
                    <input hidden="hidden"
                           value="${listtthd[0].id_khachHang.sdt} ${listkh[0].diaChi}" name="sdt">
                    <p style="color: red">${message}</p>
                </div>
                <div class="mb-3">
                    <label class="col-3">ID Hoa don</label>
                    <input type="text" class="col-7" readonly
                           <c:forEach var="hd" items="${listtthd}">value="${hd.id}"</c:forEach>>
                </div>
                <div class="mb-3">
                    <label class="col-3">Tong tien</label>
                    <input type="text" class="col-7" readonly
                           value="${tongTienHD}">
                </div>

                <div>
                    <button class="btn btn-primary" type="submit">Tạo hoá đơn</button>
                    <a <c:forEach items="${listtthd}"
                                  var="hd"> href="/ban-hang/thanh-toan?idHoaDon=${hd.id}"</c:forEach>>
                        <button class="btn btn-primary" type="button">Thanh toán</button>
                    </a>
                </div>
            </form>
        </div>

    </div>
</div>
<div>
    <h2>Danh sách chi tiết sản phẩm</h2>
    <table class="table">
        <thead>
        <tr>
            <td>STT</td>
            <td>ID CTSP</td>
            <td>Ten san pham</td>
            <td>Mau sac</td>
            <td>Size</td>
            <td>Gia ban</td>
            <td>So luong ton</td>
            <td>Trang Thai</td>
            <td>Chuc nang</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listctsp}" var="ctsp" varStatus="i">
            <tr>
                <td>${i.index + 1}</td>
                <td>${ctsp.id}</td>
                <td>${ctsp.id_sanPham.tenSP}</td>
                <td>${ctsp.id_mauSac.tenMau}</td>
                <td>${ctsp.id_size.tenSize}</td>
                <td>${ctsp.giaBan}</td>
                <td>${ctsp.soLuongTon}</td>
                <td>${ctsp.trangThai}</td>
                <td>
                    <a href="/ban-hang/them-sp?idSPCT=${ctsp.id}">
                        <button class="btn btn-primary">Chọn mua</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>