/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package duan1_qlbantrasua.Repositories;

import duan1_qlbantrasua.DomainModels.HoaDon;
import duan1_qlbantrasua.ViewModels.HDBHViewModel;
import java.util.ArrayList;

/**
 *
 * @author TrungVD
 */
public interface HoaDonRepository {
    public ArrayList<HoaDon> getListHoaDonDB();
    public Boolean themHoaDon(HoaDon hoaDon);
    public Boolean updateHoaDon(HoaDon hoaDon, String id);
    public Boolean xoaHoaDon(String ma);
    public ArrayList<HoaDon> timKiemHDDB(String tenHoaDon);
    public ArrayList<HDBHViewModel> timKiemHDView(String tenHoaDon);
    public ArrayList<HDBHViewModel> getListHDBHView();
    public ArrayList<HDBHViewModel> getListHDChuaThanhToan();
    public ArrayList<HDBHViewModel> getListHDDaThanhToan();
    public ArrayList<HDBHViewModel> getListHDHuyThanhToan();
    public ArrayList<HoaDon> getListHDChoDB();
    public Boolean huyHoaDon(String hoaDon, String maHoaDon);
}
