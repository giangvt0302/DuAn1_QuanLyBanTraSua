/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package duan1_qlbantrasua.Repositories.impl;

import duan1_qlbantrasua.DomainModels.Ban;
import duan1_qlbantrasua.Repositories.BanRepository;
import duan1_qlbantrasua.Utilties.DBConnection;
import duan1_qlbantrasua.ViewModels.BanBHViewModel;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author TrungVD
 */
public class BanRepositoryImpl implements BanRepository{
    private DBConnection connection;
    @Override
    public ArrayList<Ban> getListBanDB() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Boolean themBan(Ban ban) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Boolean updateBan(Ban ban, String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Boolean xoaBan(String ma) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Ban> timKiemSP(String tenBan) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<BanBHViewModel> getListView() {
        ArrayList<BanBHViewModel> listBan = new ArrayList<>();
        String query = "SELECT ten,trang_thai FROM ban";
        try ( Connection con = connection.getConnection();  PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BanBHViewModel ban = new BanBHViewModel();
                ban.setTenBan(rs.getString(1));
                ban.setTrangThai(rs.getInt(2));
                listBan.add(ban);
            }
        } catch (Exception e) {
            e.printStackTrace();    
        }
        return listBan;
    }
    
}
