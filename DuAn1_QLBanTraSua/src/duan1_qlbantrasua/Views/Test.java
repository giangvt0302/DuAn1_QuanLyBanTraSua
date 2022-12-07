/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package duan1_qlbantrasua.Views;

import duan1_qlbantrasua.DomainModels.GiaoCa;
import duan1_qlbantrasua.DomainModels.MucDa;
import duan1_qlbantrasua.Services.MucDaService;
import duan1_qlbantrasua.Services.impl.MucDaServiceImpl;
import java.awt.Color;
import java.awt.GridLayout;
import java.util.ArrayList;
import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.border.Border;
import javax.swing.plaf.BorderUIResource;

/**
 *
 * @author TrungVD
 */
public class Test {
    JFrame frame;
    JPanel panelMucDa = new JPanel(new GridLayout(3, 2));
    JPanel panelMucDuong = new JPanel(new GridLayout(3, 2));
    private MucDaService qLDa = new MucDaServiceImpl();
    ArrayList<MucDa> list = qLDa.getListMucDaDB();
    Test() {
        
        this.panelMucDa.setSize(100, 200);
        panelMucDa.setBorder(BorderFactory.createTitledBorder("Mức đá"));
        frame = new JFrame();
        ButtonGroup grDa = new ButtonGroup();
        for (MucDa mucDa : list) {
            JRadioButton rdoBtn = new JRadioButton(mucDa.getTen());
            grDa.add(rdoBtn);
            panelMucDa.add(rdoBtn);
            
        }
        for (MucDa mucDa : list) {
            JCheckBox chk = new JCheckBox(mucDa.getTen());
            panelMucDuong.add(chk);
            System.out.println(chk.isSelected());
        }
        
        frame.add(panelMucDa);
        frame.add(panelMucDuong);
        frame.setLayout(new GridLayout(3, 2));
        frame.setTitle("Vi du JRadioButton trong Java Swing");
        frame.setSize(400, 250);
        frame.setVisible(true);
    }
 
    public static void main(String[] args) {
        new Test();
    }
}
