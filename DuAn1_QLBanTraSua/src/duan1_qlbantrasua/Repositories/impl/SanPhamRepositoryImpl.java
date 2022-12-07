/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package duan1_qlbantrasua.Repositories.impl;

import duan1_qlbantrasua.DomainModels.DanhMucSP;
import duan1_qlbantrasua.DomainModels.SanPham;
import duan1_qlbantrasua.DomainModels.Size;
import duan1_qlbantrasua.Repositories.SanPhamRepository;
import duan1_qlbantrasua.Utilties.DBConnection;
import duan1_qlbantrasua.ViewModels.SanPhamFromBanHang;
import duan1_qlbantrasua.ViewModels.SanPhamViewModel;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author TrungVD
 */
public class SanPhamRepositoryImpl implements SanPhamRepository {

    private DBConnection connection;

    @Override
    public ArrayList<SanPham> getListSanPhamDB() {
        ArrayList<SanPham> listSanPham = new ArrayList<>();
        String query = "SELECT * FROM view_xemThongTinSanPham";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Size size = new Size(rs.getString(6), rs.getString(7), rs.getString(8), rs.getDouble(9));
                DanhMucSP danhMucSP = new DanhMucSP(rs.getString(10), rs.getString(11), rs.getString(12));
                SanPham sanPham = new SanPham();
                sanPham.setId(rs.getString(1));
                sanPham.setMa(rs.getString(2));
                sanPham.setTen(rs.getString(3));
                sanPham.setGia(rs.getInt(4));
                sanPham.setMoTa(rs.getString(5));
                sanPham.setSize(size);
                sanPham.setDanhMucSP(danhMucSP);
                sanPham.setTrangThai(rs.getInt(13));
                listSanPham.add(sanPham);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listSanPham;
    }

    @Override
    public Boolean themSanPham(SanPham sanPham) {
        int checkThem = 0;
        String query = "INSERT INTO san_pham\n"
                + "VALUES( ?,?,?,?,?,?,?)";
        try ( Connection con = DBConnection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, sanPham.getMa());
            ps.setString(2, sanPham.getTen());
            ps.setDouble(3, sanPham.getGia());
            ps.setString(4, sanPham.getMoTa());
            ps.setInt(5, sanPham.getTrangThai());
            ps.setString(6, sanPham.getSize().getId());
            ps.setString(7, sanPham.getDanhMucSP().getId());
            checkThem = ps.executeUpdate();
            return checkThem > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean updateSanPham(SanPham sanPham, String id) {
        int checkUpdate = 0;
        String query = "UPDATE san_pham\n"
                + "SET ma = ?,ten = ?,gia = ?,\n"
                + "    mo_ta = ?,trang_thai = ?,id_size = ?,id_danh_muc=?\n"
                + "WHERE id = " + id;
        try ( Connection con = DBConnection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, sanPham.getMa());   
            ps.setString(2, sanPham.getTen());
            ps.setDouble(3, sanPham.getGia());
            ps.setString(4, sanPham.getMoTa());
            ps.setInt(5, sanPham.getTrangThai());
            ps.setString(6, sanPham.getSize().getId());
            ps.setString(7, sanPham.getDanhMucSP().getId());
            checkUpdate = ps.executeUpdate();
            return checkUpdate > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean xoaSanPham(String ma) {
        int checkXoa = 0;
        String query = "DELETE san_pham\n"
                + "WHERE ma = ?";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, ma);
            checkXoa = ps.executeUpdate();
            return checkXoa > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public ArrayList<SanPhamViewModel> timKiem(String tenSanPham) {
        ArrayList<SanPhamViewModel> listSanPham = new ArrayList<>();
        String query = "SELECT * FROM view_fillSPTable\n"
                + "WHERE ten_sp LIKE N'%"+tenSanPham+"%'";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPhamViewModel sanPhamView = new SanPhamViewModel();
                sanPhamView.setMaSanPham(rs.getString(1));
                sanPhamView.setTenSanPham(rs.getString(2));
                sanPhamView.setDonGia(rs.getDouble(3));
                sanPhamView.setMoTa(rs.getString(4));
                sanPhamView.setTenDanhMuc(rs.getString(5));
                sanPhamView.setDuongDanAnh(rs.getString(6));
                sanPhamView.setTrangThai(rs.getInt(7));
                listSanPham.add(sanPhamView);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listSanPham;
    }

    @Override
    public ArrayList<SanPhamViewModel> getListView() {
        ArrayList<SanPhamViewModel> listSanPham = new ArrayList<>();
        String query = "SELECT * FROM view_fillSPTable";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPhamViewModel sanPhamView = new SanPhamViewModel();
                sanPhamView.setMaSanPham(rs.getString(1));
                sanPhamView.setTenSanPham(rs.getString(2));
                sanPhamView.setDonGia(rs.getDouble(3));
                sanPhamView.setMoTa(rs.getString(4));
                sanPhamView.setTenDanhMuc(rs.getString(5));
                sanPhamView.setDuongDanAnh(rs.getString(6));
                sanPhamView.setTrangThai(rs.getInt(7));
                listSanPham.add(sanPhamView);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listSanPham;
    }

    @Override
    public ArrayList<SanPham> timKiemSP(String tenSanPham) {
        ArrayList<SanPham> listSanPham = new ArrayList<>();
        String query = "SELECT * FROM view_xemThongTinSanPham\n"
                + "WHERE ten_sp LIKE N'%" + tenSanPham + "%'";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Size size = new Size(rs.getString(6), rs.getString(7), rs.getString(8), rs.getDouble(9));
                DanhMucSP danhMucSP = new DanhMucSP(rs.getString(10), rs.getString(11), rs.getString(12));
                SanPham sanPham = new SanPham();
                sanPham.setId(rs.getString(1));
                sanPham.setMa(rs.getString(2));
                sanPham.setTen(rs.getString(3));
                sanPham.setGia(rs.getInt(4));
                sanPham.setMoTa(rs.getString(5));
                sanPham.setSize(size);
                sanPham.setDanhMucSP(danhMucSP);
                sanPham.setTrangThai(rs.getInt(13));
                listSanPham.add(sanPham);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listSanPham;
    }

    @Override
    public ArrayList<SanPhamFromBanHang> getListSPFormBH() {
        ArrayList<SanPhamFromBanHang> listSanPham = new ArrayList<>();
        String query = "SELECT * FROM view_SanPhamFromBanHang";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SanPhamFromBanHang sanPham = new SanPhamFromBanHang();
                sanPham.setId(rs.getString(1));
                sanPham.setTenSanPham(rs.getString(2));
                sanPham.setGiaSanPham(rs.getDouble(3));
                sanPham.setDuongDanAnh(rs.getString(4));
                sanPham.setTenDanhMuc(rs.getString(5));
                sanPham.setMoTa(rs.getString(6));
                listSanPham.add(sanPham);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listSanPham;
    }
}
