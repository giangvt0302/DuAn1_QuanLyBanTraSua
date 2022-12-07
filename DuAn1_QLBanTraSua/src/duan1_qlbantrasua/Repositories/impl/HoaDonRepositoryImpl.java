/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package duan1_qlbantrasua.Repositories.impl;

import duan1_qlbantrasua.DomainModels.Ban;
import duan1_qlbantrasua.DomainModels.DungDiem;
import duan1_qlbantrasua.DomainModels.HoaDon;
import duan1_qlbantrasua.DomainModels.KhachHang;
import duan1_qlbantrasua.DomainModels.NhanVien;
import duan1_qlbantrasua.Repositories.HoaDonRepository;
import duan1_qlbantrasua.Utilties.DBConnection;
import duan1_qlbantrasua.ViewModels.HDBHViewModel;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author TrungVD
 */
public class HoaDonRepositoryImpl implements HoaDonRepository {

    private DBConnection connection;

    @Override
    public ArrayList<HoaDon> getListHoaDonDB() {
        ArrayList<HoaDon> listHoaDon = new ArrayList<>();
        String query = "SELECT * FROM view_xemThongTinHoaDon";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NhanVien nhanVien = new NhanVien();
                nhanVien.setId(rs.getString(9));
                nhanVien.setMa(rs.getString(10));
                nhanVien.setHoVaTen(rs.getString(11));
                KhachHang khachHang = new KhachHang();
                khachHang.setId(rs.getString(12));
                khachHang.setHoVaTen(rs.getString(13));
//              khachHang.setDiem(rs.getShort(14));
                DungDiem diem = new DungDiem(rs.getInt(14));
                HoaDon hoaDon = new HoaDon();
                hoaDon.setId(rs.getString(1));
                hoaDon.setMa(rs.getString(2));
                hoaDon.setNgayTao(rs.getDate(3));
                hoaDon.setTongTien(rs.getFloat(4));
                hoaDon.setGiaKhuyenMai(rs.getFloat(5));
                hoaDon.setGiaThanhToan(rs.getFloat(6));
                hoaDon.setGhiChu(rs.getString(7));
                hoaDon.setNhanVien(nhanVien);
                hoaDon.setKhachHang(khachHang);
                hoaDon.setDungDiem(diem);
                hoaDon.setTrangThai(rs.getInt(15));
                listHoaDon.add(hoaDon);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listHoaDon;
    }

    @Override
    public Boolean themHoaDon(HoaDon hoaDon) {
        int checkThem = 0;
        String query = "INSERT INTO hoa_don(ma,ngay_tao,"
                + "id_nhan_vien)\n"
                + "VALUES(?,?,?)";
        try ( Connection con = DBConnection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, hoaDon.getMa());
            ps.setObject(2, hoaDon.getNgayTao());
            ps.setString(3, hoaDon.getNhanVien().getId());
            checkThem = ps.executeUpdate();
            return checkThem > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean updateHoaDon(HoaDon hoaDon, String ma) {
        int checkUpdate = 0;
        String query = "UPDATE hoa_don\n"
                + "SET tong_tien = ?,\n"
                + "gia_khuyen_mai = ?,\n"
                + "gia_thanh_toan = ?,\n"
                + "ngay_thanh_toan = ?,\n"
//                + "id_dung_diem = ?,\n"
//                + "id_khach_hang = ?,\n"
                + "ghi_chu = ?,\n"
                + "trang_thai = ?\n"
                + " WHERE ma = ?";
        try ( Connection con = DBConnection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ps.setDouble(1, hoaDon.getTongTien());
            ps.setDouble(2, hoaDon.getGiaKhuyenMai());
            ps.setDouble(3, hoaDon.getGiaThanhToan());
            ps.setObject(4, new Date());
//            ps.setString(4, hoaDon.getDungDiem().getId());
//            ps.setString(5, hoaDon.getKhachHang().getId());
            ps.setString(5,hoaDon.getGhiChu());
            ps.setInt(6, hoaDon.getTrangThai());
            ps.setString(7, ma);
            checkUpdate = ps.executeUpdate();
            return checkUpdate > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean xoaHoaDon(String ma) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<HoaDon> timKiemHDDB(String tenHoaDon) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<HDBHViewModel> getListHDBHView() {
        ArrayList<HDBHViewModel> listHoaDon = new ArrayList<>();
        String query = "SELECT * FROM view_HoaDonFormBanHang";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HDBHViewModel hoaDon = new HDBHViewModel();
                hoaDon.setMaHoaDon(rs.getString(1));
                hoaDon.setTenNhanVien(rs.getString(2));
                hoaDon.setNgayTao(rs.getDate(3));
                hoaDon.setTrangThai(rs.getInt(4));
                listHoaDon.add(hoaDon);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listHoaDon;
    }

    @Override
    public ArrayList<HDBHViewModel> timKiemHDView(String tenHoaDon) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<HDBHViewModel> getListHDChuaThanhToan() {
        ArrayList<HDBHViewModel> listHoaDon = new ArrayList<>();
        String query = "SELECT * FROM view_HoaDonFormBanHang\n"
                + "WHERE trang_thai = 0";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HDBHViewModel hoaDon = new HDBHViewModel();
                hoaDon.setMaHoaDon(rs.getString(1));
                hoaDon.setTenNhanVien(rs.getString(2));
                hoaDon.setNgayTao(rs.getDate(3));
                hoaDon.setTrangThai(rs.getInt(4));
                listHoaDon.add(hoaDon);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listHoaDon;
    }

    @Override
    public ArrayList<HDBHViewModel> getListHDDaThanhToan() {
        ArrayList<HDBHViewModel> listHoaDon = new ArrayList<>();
        String query = "SELECT * FROM view_HoaDonFormBanHang\n"
                + "WHERE trang_thai = 1";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HDBHViewModel hoaDon = new HDBHViewModel();
                hoaDon.setMaHoaDon(rs.getString(1));
                hoaDon.setTenNhanVien(rs.getString(2));
                hoaDon.setNgayTao(rs.getDate(3));
                hoaDon.setTrangThai(rs.getInt(4));
                listHoaDon.add(hoaDon);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listHoaDon;
    }

    @Override
    public ArrayList<HDBHViewModel> getListHDHuyThanhToan() {
        ArrayList<HDBHViewModel> listHoaDon = new ArrayList<>();
        String query = "SELECT * FROM view_HoaDonFormBanHang\n"
                + "WHERE trang_thai = 2";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HDBHViewModel hoaDon = new HDBHViewModel();
                hoaDon.setMaHoaDon(rs.getString(1));
                hoaDon.setTenNhanVien(rs.getString(2));
                hoaDon.setNgayTao(rs.getDate(3));
                hoaDon.setTrangThai(rs.getInt(4));
                listHoaDon.add(hoaDon);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listHoaDon;
    }

    public static void main(String[] args) {
        ArrayList<HDBHViewModel> list = new HoaDonRepositoryImpl().getListHDChuaThanhToan();
        for (HDBHViewModel hDBHViewModel : list) {
            System.out.println(hDBHViewModel.getMaHoaDon());
        }
    }

    @Override
    public ArrayList<HoaDon> getListHDChoDB() {
        ArrayList<HoaDon> listHoaDon = new ArrayList<>();
        String query = "SELECT * FROM view_xemThongTinHoaDon WHERE trang_thai_hd = 0";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NhanVien nhanVien = new NhanVien();
                nhanVien.setId(rs.getString(9));
                nhanVien.setMa(rs.getString(10));
                nhanVien.setHoVaTen(rs.getString(11));
                KhachHang khachHang = new KhachHang();
                khachHang.setId(rs.getString(12));
                khachHang.setHoVaTen(rs.getString(13));
//              khachHang.setDiem(rs.getShort(14));
                DungDiem diem = new DungDiem(rs.getInt(14));
                HoaDon hoaDon = new HoaDon();
                hoaDon.setId(rs.getString(1));
                hoaDon.setMa(rs.getString(2));
                hoaDon.setNgayTao(rs.getDate(3));
                hoaDon.setTongTien(rs.getFloat(4));
                hoaDon.setGiaKhuyenMai(rs.getFloat(5));
                hoaDon.setGiaThanhToan(rs.getFloat(6));
                hoaDon.setGhiChu(rs.getString(7));
                hoaDon.setNhanVien(nhanVien);
                hoaDon.setKhachHang(khachHang);
                hoaDon.setDungDiem(diem);
                hoaDon.setTrangThai(rs.getInt(15));
                listHoaDon.add(hoaDon);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listHoaDon;
    }

    @Override
    public Boolean huyHoaDon(String lyDoHuy, String maHoaDon) {
        int checkHuyHoaDon = 0;
        String query = "UPDATE hoa_don\n"
                + "SET ghi_chu = ?, trang_thai = 2 \n"
                + " WHERE ma = ?";
        try ( Connection con = DBConnection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, lyDoHuy);
            ps.setString(2, maHoaDon);
            checkHuyHoaDon = ps.executeUpdate();
            return checkHuyHoaDon > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
