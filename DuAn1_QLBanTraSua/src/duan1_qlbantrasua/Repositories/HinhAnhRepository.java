/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package duan1_qlbantrasua.Repositories;

import duan1_qlbantrasua.DomainModels.HinhAnh;
import duan1_qlbantrasua.ViewModels.HinhAnhViewModel;
import java.util.ArrayList;

/**
 *
 * @author TrungVD
 */
public interface HinhAnhRepository {
    public ArrayList<HinhAnh> getListMucDaDB();
    public Boolean themMucDa(HinhAnh hinhAnh);
    public Boolean updateMucDa(HinhAnh hinhAnh, String id);
    public Boolean xoaMucDa(String ma);
    public ArrayList<HinhAnh> timKiem(String tenHiString);
    public ArrayList<HinhAnhViewModel> getListView();
}
