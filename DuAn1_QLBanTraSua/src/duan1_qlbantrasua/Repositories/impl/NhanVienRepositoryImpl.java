/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package duan1_qlbantrasua.Repositories.impl;

import duan1_qlbantrasua.DomainModels.ChucVu;
import duan1_qlbantrasua.DomainModels.NhanVien;
import duan1_qlbantrasua.Repositories.NhanVienRepository;
import duan1_qlbantrasua.Utilties.DBConnection;
import duan1_qlbantrasua.ViewModels.TaiKhoanViewModel;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author TrungVD
 */
public class NhanVienRepositoryImpl implements NhanVienRepository {

    private DBConnection connection;

    @Override
    public ArrayList<NhanVien> getListNhanVienDB() {
        ArrayList<NhanVien> listNhanVien = new ArrayList<>();
        String query = "SELECT * FROM view_thongTinNhanVien";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ChucVu chucVu = new ChucVu(rs.getString(12), rs.getString(13));
                NhanVien nhanVien = new NhanVien();
                nhanVien.setId(rs.getString(1));
                nhanVien.setMa(rs.getString(2));
                nhanVien.setHoVaTen(rs.getString(3));
                nhanVien.setMatKhau(rs.getString(4));
                nhanVien.setsDT(rs.getString(5));
                nhanVien.setcCCD(rs.getString(6));
                nhanVien.setNgaySinh(rs.getDate(7));
                nhanVien.setGioiTinh(rs.getInt(8));
                nhanVien.setDiaChi(rs.getString(9));
                nhanVien.setEmail(rs.getString(10));
                nhanVien.setGhiChu(rs.getString(11));
                nhanVien.setChucVu(chucVu);
                nhanVien.setTrangThai(rs.getInt(14));
                listNhanVien.add(nhanVien);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listNhanVien;
    }

    @Override
    public ArrayList<TaiKhoanViewModel> getListTaiKhoan() {
        ArrayList<TaiKhoanViewModel> listTaiKhoan = new ArrayList<>();
        String query = "SELECT * FROM view_thongTinNhanVien";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TaiKhoanViewModel taiKhoan = new TaiKhoanViewModel();
                taiKhoan.setMaNV(rs.getString(2));
                taiKhoan.setMatKhau(rs.getString(4));
                taiKhoan.setChucVu(rs.getString(12));
                listTaiKhoan.add(taiKhoan);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listTaiKhoan;
    }

    @Override
    public Boolean checkLogin(String maNV, String matKhau) {
        ArrayList<TaiKhoanViewModel> listTK = new NhanVienRepositoryImpl().getListTaiKhoan();
        for (TaiKhoanViewModel taiKhoan : listTK) {
            if (taiKhoan.getMaNV().equalsIgnoreCase(maNV) && taiKhoan.getMatKhau().equalsIgnoreCase(matKhau)) {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }

    @Override
    public Boolean themNhanVien(NhanVien nhanVien) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Boolean suaNhanVien(NhanVien nhanVien, String maNV) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Boolean xoaNhanVien(String maNV) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public NhanVien getListNhanVienDB(String maNV) {
        NhanVien nhanVien = new NhanVien();
        String query = "SELECT * FROM view_thongTinNhanVien WHERE ma_nv = ?";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, maNV);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ChucVu chucVu = new ChucVu(rs.getString(12), rs.getString(13));
                nhanVien.setId(rs.getString(1));
                nhanVien.setMa(rs.getString(2));
                nhanVien.setHoVaTen(rs.getString(3));
                nhanVien.setMatKhau(rs.getString(4));
                nhanVien.setsDT(rs.getString(5));
                nhanVien.setcCCD(rs.getString(6));
                nhanVien.setNgaySinh(rs.getDate(7));
                nhanVien.setGioiTinh(rs.getInt(8));
                nhanVien.setDiaChi(rs.getString(9));
                nhanVien.setEmail(rs.getString(10));
                nhanVien.setGhiChu(rs.getString(11));
                nhanVien.setChucVu(chucVu);
                nhanVien.setTrangThai(rs.getInt(14));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nhanVien;
    }

    public static void main(String[] args) {
        NhanVien nhanVien = new NhanVienRepositoryImpl().getListNhanVienDB("NV001");
            System.out.println(nhanVien.getHoVaTen());
    }
}
