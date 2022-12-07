/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duan1_qlbantrasua.Services.impl;

import duan1_qlbantrasua.DomainModels.KhachHang;
import duan1_qlbantrasua.Repositories.KhachHangRespository;
import duan1_qlbantrasua.Repositories.impl.KhachHangRespositoryimpl;
import duan1_qlbantrasua.Services.KhachHangService;
import java.util.ArrayList;

/**
 *
 * @author Giang
 */
public class KhachHangServiceimpl implements KhachHangService{

    private KhachHangRespository prodKH = new KhachHangRespositoryimpl();
    
    @Override
    public ArrayList<KhachHang> getListKhachHangDB() {
        return this.prodKH.getListKhachHangDB();
    }

    @Override
    public String themKhachHang(KhachHang k) {
         boolean them = prodKH.themKhachHang(k);
        if(them){
            return "Thêm thành công";
        }else{
            return "Thêm thất bại";
        }
    }

    @Override
    public String updateKhachHang(KhachHang k, String id) {
         boolean them = prodKH.updateKhachHang(k, id);
        if(them){
            return "Sửa thành công";
        }else{
            return "Sửa thất bại";
        }
    }

    @Override
    public String xoaKhachHang(String ma) {
         boolean them = prodKH.xoaKhachHang(ma);
        if(them){
            return "Xóa thành công";
        }else{
            return "Xóa thất bại";
        }
    }

    @Override
    public ArrayList<KhachHang> getList() {
        return this.prodKH.all();
    }
    
}
