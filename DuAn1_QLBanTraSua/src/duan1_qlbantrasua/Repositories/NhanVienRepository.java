/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package duan1_qlbantrasua.Repositories;

import duan1_qlbantrasua.DomainModels.NhanVien;
import duan1_qlbantrasua.ViewModels.TaiKhoanViewModel;
import java.util.ArrayList;

/**
 *
 * @author TrungVD
 */
public interface NhanVienRepository {
    public ArrayList<NhanVien> getListNhanVienDB();
    public NhanVien getListNhanVienDB(String maNV);
    public Boolean themNhanVien(NhanVien nhanVien);
    public Boolean suaNhanVien(NhanVien nhanVien, String maNV);
    public Boolean xoaNhanVien(String maNV);
    public ArrayList<TaiKhoanViewModel> getListTaiKhoan();
    public  Boolean checkLogin(String maNV, String matKhau); 
    
}
