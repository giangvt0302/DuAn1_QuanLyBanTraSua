/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package duan1_qlbantrasua.Repositories;

import duan1_qlbantrasua.DomainModels.SanPham;
import duan1_qlbantrasua.ViewModels.SanPhamFromBanHang;
import duan1_qlbantrasua.ViewModels.SanPhamViewModel;
import duan1_qlbantrasua.ViewModels.ThongKeSanPham;
import java.util.ArrayList;

/**
 *
 * @author TrungVD
 */
public interface SanPhamRepository {
    public ArrayList<SanPham> getListSanPhamDB();
    public Boolean themSanPham(SanPham sanPham);
    public Boolean updateSanPham(SanPham sanPham, String id);
    public Boolean xoaSanPham(String ma);
    public ArrayList<SanPham> timKiemSP(String tenSanPham);
    public ArrayList<SanPhamViewModel> timKiem(String tenSanPham);
    public ArrayList<SanPhamViewModel> getListView();
    public ArrayList<SanPhamFromBanHang> getListSPFormBH();
    public ArrayList<ThongKeSanPham> TKSanPham();
}
