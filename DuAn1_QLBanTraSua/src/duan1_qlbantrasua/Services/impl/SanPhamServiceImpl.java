/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package duan1_qlbantrasua.Services.impl;

import duan1_qlbantrasua.DomainModels.SanPham;
import duan1_qlbantrasua.Repositories.SanPhamRepository;
import duan1_qlbantrasua.Repositories.impl.SanPhamRepositoryImpl;
import duan1_qlbantrasua.Services.SanPhamService;
import duan1_qlbantrasua.ViewModels.SanPhamFromBanHang;
import duan1_qlbantrasua.ViewModels.SanPhamViewModel;
import duan1_qlbantrasua.ViewModels.ThongKeSanPham;
import java.util.ArrayList;

/**
 *
 * @author TrungVD
 */
public class SanPhamServiceImpl implements SanPhamService{

    private SanPhamRepository sanPhamRepository = new SanPhamRepositoryImpl();
    @Override
    public ArrayList<SanPham> getListSanPhamDB() {
        return sanPhamRepository.getListSanPhamDB();
    }

    @Override
    public String themSanPham(SanPham sanPham) {
        boolean them = sanPhamRepository.themSanPham(sanPham);
        if(them){
            return "Thêm thành công";
        }else{
            return "Thêm thất bại";
        }
    }

    @Override
    public String updateSanPham(SanPham sanPham, String id) {
        boolean sua = sanPhamRepository.updateSanPham(sanPham, id);
        if(sua){
            return "Sửa thành công";
        }else{
            return "Sửa thất bại";
        }
    }

    @Override
    public String xoaSanPham(String ma) {
        boolean xoa = sanPhamRepository.xoaSanPham(ma);
        if(xoa){
            return "Xóa thành công";
        }else{
            return "Xóa thất bại";
        }
    }

    @Override
    public ArrayList<SanPhamViewModel> timKiem(String tenSanPham) {
        return sanPhamRepository.timKiem(tenSanPham);
    }

    @Override
    public ArrayList<SanPhamViewModel> getListView() {
        return sanPhamRepository.getListView();
    }

    @Override
    public ArrayList<SanPham> timKiemSP(String tenSanPham) {
        return sanPhamRepository.timKiemSP(tenSanPham);
    }

    @Override
    public ArrayList<SanPhamFromBanHang> getListSPFormBH() {
        return sanPhamRepository.getListSPFormBH();
    }

    @Override
    public ArrayList<ThongKeSanPham> getListTKSanPham() {
        return sanPhamRepository.TKSanPham();
    }
    
}
