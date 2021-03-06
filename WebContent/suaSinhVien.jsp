<%@page import="model.bean.SinhVien"%>
<%@page import="model.bean.Khoa"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>Sửa sinh viên</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <script src="js/jquery-1.11.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<%
	SinhVien sinhVien = (SinhVien)request.getAttribute("sinhVien");
%>
<div class="container">
    <h3>Sửa sinh viên: <%=sinhVien.getHoTen() %></h3>
    <br>

    <form action="SuaSinhVienServlet" method="post">
        <div class="row form-group">
            <label class="col-lg-2">Mã SV</label>
            <div class="col-lg-3">
                <input type="text" class=" form-control" name="msv" readonly="readonly" value="<%=sinhVien.getMsv()%>"/>
            </div>
        </div>
        <div class="row form-group">
            <label class="col-lg-2">Họ tên</label>
            <div class="col-lg-3">
                <input type="text" class="form-control" name="hoten" value="<%=sinhVien.getHoTen()%>"/>
            </div>
        </div>
        <div class="row form-group">
            <label class="col-lg-2">Giới tính</label>
            <div class="col-lg-3">
                <input type="radio" name="gioitinh" value="1" style="margin-right: 10px;">Nam
                <input type="radio" style="margin: 0px 10px 0px 30px;" name="gioitinh" value="0">Nữ
            </div>
        </div>
        <div class="row form-group">
            <label class="col-lg-2">Khoa</label>
            <div class="col-lg-3">
                <select class="form-control" name="khoa">
                    <%
                    	ArrayList<Khoa> listKhoa = (ArrayList<Khoa>)request.getAttribute("listKhoa");
                    	for(Khoa khoa:listKhoa){
                    %>
                    <option value="<%=khoa.getMaKhoa()%>"><%=khoa.getTenKhoa() %></option>
                    <%
                    	}
                    %>
                </select>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-lg-3 col-lg-offset-2">
                <button class="btn btn-primary" type="submit" value="submit" name="submit">Lưu lại</button>
                <input class="btn btn-primary" type="button" value="Quay lại" onclick="history.go(-1);" />
            </div>
        </div>
    </form>
    <script type="text/javascript">
    	$("[name='gioitinh'][value='<%=sinhVien.getGioiTinh()%>']").attr("checked", true);
    	$("[name='khoa']").val("<%=sinhVien.getMaKhoa()%>");
    </script>
</div>
</body>
</html>