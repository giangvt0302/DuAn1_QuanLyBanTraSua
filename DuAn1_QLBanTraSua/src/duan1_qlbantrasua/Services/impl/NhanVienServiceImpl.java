/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package duan1_qlbantrasua.Services.impl;

import duan1_qlbantrasua.DomainModels.NhanVien;
import duan1_qlbantrasua.Repositories.NhanVienRepository;
import duan1_qlbantrasua.Repositories.impl.NhanVienRepositoryImpl;
import duan1_qlbantrasua.Services.NhanVienService;

/**
 *
 * @author TrungVD
 */
public class NhanVienServiceImpl implements NhanVienService{
    NhanVienRepository nhanVienRepository = new NhanVienRepositoryImpl();
    @Override
    public NhanVien getListNhanVienDB(String maNV) {
        return nhanVienRepository.getListNhanVienDB(maNV);
    }
    
}
