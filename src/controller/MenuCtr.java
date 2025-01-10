/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author Leonovo
 */
import connection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Menu;

public class MenuCtr {
    private final Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public MenuCtr() {
        conn = DBConnection.getConnection();
    }
    
    public List<Menu> getAll() {
        List<Menu> listMenu = new ArrayList<Menu>();
        System.out.println("---- getting data -----");
        try {
            String sql = "SELECT * FROM menu";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Menu menu = new Menu();
                menu.setId(rs.getString("id"));
                menu.setNama(rs.getString("nama"));
                menu.setGambar(rs.getString("gambar"));
                menu.setHarga(rs.getDouble("harga"));
                listMenu.add(menu);
                System.out.println("    id menu : " + rs.getString("id"));

            }
        } catch (SQLException e) {
            System.out.println("error get data book : "+e);
        }
        return listMenu;
    }
    
    public static void main(String[] args) {
        MenuCtr ctr = new MenuCtr();
        List<Menu> menus = ctr.getAll();
    }
}
