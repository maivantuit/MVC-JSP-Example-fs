package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Khoa;
import model.bean.SinhVien;
import model.bo.KhoaBO;
import model.bo.SinhVienBO;

/**
 * Servlet implementation class SuaSinhVienServlet
 */
public class SuaSinhVienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuaSinhVienServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//kiem tra da dang nhap chua
		HttpSession session = request.getSession();
		if(session.getAttribute("tenDangNhap")==null){
			response.sendRedirect("DangNhapServlet");
			return;
		}

		request.setCharacterEncoding("UTF-8");
		SinhVienBO sinhVienBO = new SinhVienBO();
		//lay danh sach cac khoa
		KhoaBO khoaBO = new KhoaBO();
		ArrayList<Khoa> listKhoa = khoaBO.getListKhoa();
		request.setAttribute("listKhoa", listKhoa);
		
		String msv=request.getParameter("msv");
		if("submit".equals(request.getParameter("submit"))){		//nhan nut Xac nhan o trang Sua sinh vien
			String hoTen= request.getParameter("hoten");
			String gioiTinh = request.getParameter("gioitinh");
			String maKhoa = request.getParameter("khoa");
			sinhVienBO.suaSinhVien(msv, hoTen, gioiTinh, maKhoa);
			response.sendRedirect("DanhSachSinhVienServlet");
		} else {													//chuyen sang trang Sua sinh vien
			SinhVien sinhVien = sinhVienBO.getThongTinSinhVien(msv);
			request.setAttribute("sinhVien", sinhVien);
			RequestDispatcher rd = request.getRequestDispatcher("suaSinhVien.jsp");
			rd.forward(request, response);
		}
	}
}
