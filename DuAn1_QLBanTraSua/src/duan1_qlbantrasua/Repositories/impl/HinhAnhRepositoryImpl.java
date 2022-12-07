/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package duan1_qlbantrasua.Repositories.impl;

import duan1_qlbantrasua.DomainModels.HinhAnh;
import duan1_qlbantrasua.Repositories.HinhAnhRepository;
import duan1_qlbantrasua.Utilties.DBConnection;
import duan1_qlbantrasua.ViewModels.HinhAnhViewModel;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author TrungVD
 */
public class HinhAnhRepositoryImpl implements HinhAnhRepository{

    private DBConnection connection;
    
    @Override
    public ArrayList<HinhAnh> getListMucDaDB() {
        ArrayList<HinhAnh> listHinhAnhDB = new ArrayList<>();
        return listHinhAnhDB;
    }

    @Override
    public Boolean themMucDa(HinhAnh hinhAnh) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Boolean updateMucDa(HinhAnh hinhAnh, String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Boolean xoaMucDa(String ma) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<HinhAnh> timKiem(String tenHiString) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<HinhAnhViewModel> getListView() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
