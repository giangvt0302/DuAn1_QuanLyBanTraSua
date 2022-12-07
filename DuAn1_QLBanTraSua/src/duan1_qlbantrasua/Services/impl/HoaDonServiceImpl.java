/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package duan1_qlbantrasua.Services.impl;

import duan1_qlbantrasua.DomainModels.HoaDon;
import duan1_qlbantrasua.Repositories.HoaDonRepository;
import duan1_qlbantrasua.Repositories.impl.HoaDonRepositoryImpl;
import duan1_qlbantrasua.Services.HoaDonService;
import duan1_qlbantrasua.ViewModels.HDBHViewModel;
import java.util.ArrayList;

/**
 *
 * @author TrungVD
 */
public class HoaDonServiceImpl implements HoaDonService{

    private HoaDonRepository  hoaDonRepository = new HoaDonRepositoryImpl();
    @Override
    public ArrayList<HoaDon> getListHoaDonDB() {
        return hoaDonRepository.getListHoaDonDB();
    }

    @Override
    public String themHoaDon(HoaDon hoaDon) {
        boolean them = hoaDonRepository.themHoaDon(hoaDon);
        if(them){
            return "Tạo mới hóa đơn thành công!";
        }else{
            return "Tạo hóa đơn thất bại!";
        }
    }

    @Override
    public String updateHoaDon(HoaDon hoaDon, String maHoaDon) {
        boolean update = hoaDonRepository.updateHoaDon(hoaDon, maHoaDon);
        if(update){
            return "Update hóa đơn thành công!";
        }else{
            return "Update hóa đơn thất bại!";
        }
    }

    @Override
    public String xoaHoaDon(String ma) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<HoaDon> timKiemHDDB(String tenHoaDon) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<HDBHViewModel> timKiemHDView(String tenHoaDon) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<HDBHViewModel> getListHDBHView() {
        return hoaDonRepository.getListHDBHView();
    }

    @Override
    public ArrayList<HDBHViewModel> getListHDChuaThanhToan() {
        return hoaDonRepository.getListHDChuaThanhToan();
    }

    @Override
    public ArrayList<HDBHViewModel> getListHDDaThanhToan() {
        return hoaDonRepository.getListHDDaThanhToan();
    }

    @Override
    public ArrayList<HDBHViewModel> getListHDHuyThanhToan() {
        return hoaDonRepository.getListHDHuyThanhToan();
    }

    @Override
    public ArrayList<HoaDon> getListHDChoDB() {
        return hoaDonRepository.getListHDChoDB();
    }

    @Override
    public String huyHoaDon(String lyDoHuy, String maHoaDon) {
        boolean huy = hoaDonRepository.huyHoaDon(lyDoHuy, maHoaDon);
        if(huy){
            return "Hóa đơn đã bị hủy!";
        }else{
            return "Hủy không thành công!";
        }
    }
    
}
