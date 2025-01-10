/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import connection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author Leonovo
 */
public class OrderCtr {
    private final Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    
    public OrderCtr() {
        conn = DBConnection.getConnection();
    }
    
    public List<Order> getHistories(String dateFrom, String dateTo) {
        List<Order> listOrder = new ArrayList<Order>();
        System.out.println("---- getting data -----");
        try {
            String sql = "SELECT * FROM `order` WHERE tanggal BETWEEN ? and ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dateFrom);
            ps.setString(2, dateTo);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getString("id"));
                order.setTanggal(rs.getString("tanggal"));
                order.setWaktu(rs.getString("waktu"));
                order.setPajak(rs.getDouble("pajak"));
                order.setTotalHarga(rs.getDouble("total_harga"));
                order.setJumlahBayar(rs.getDouble("jumlah_bayar"));
                listOrder.add(order);
                System.out.println("    id order : " + rs.getString("id"));
            }
        } catch (SQLException e) {
            System.out.println("error get data order : "+e);
        }
        return listOrder;
    }
    
    public boolean save(Order order) {
        String sqlSimpan = "INSERT INTO `order`(id, tanggal, waktu, total_harga, jumlah_bayar, pajak) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(sqlSimpan);
            ps.setString(1, order.getId());
            ps.setString(2, order.getTanggal());
            ps.setString(3, order.getWaktu());
            ps.setDouble(4, order.getTotalHarga());
            ps.setDouble(5, order.getJumlahBayar());
            ps.setDouble(6, order.getPajak());
            System.out.println(ps.toString());
            ps.executeUpdate();
            System.out.println("success add data");
            return true;
        } catch (SQLException se) {
            System.out.println("error add or update : " + se);
            System.out.println(se.getSQLState());
            System.err.println(se);
        }
        return false;
    }
    
    public boolean saveDetail(List<OrderDetail> orderDetails) {
        String sqlSimpan = "INSERT INTO `order_detail`(id_order, id_menu, nama_menu, harga_satuan, qty) VALUES (?, ?, ?, ?, ?)";
        try {
            for (OrderDetail order : orderDetails) {
                ps = conn.prepareStatement(sqlSimpan);
                ps.setString(1, order.getOrderId());
                ps.setString(2, order.getMenuId());
                ps.setString(3, order.getNamaMenu());
                ps.setDouble(4, order.getHargaMenu());
                ps.setInt(5, order.getQty());
                System.out.println(ps.toString());
                ps.executeUpdate();
                System.out.println("success add data");
            }
           
            return true;
        } catch (SQLException se) {
            System.out.println("error add or update : " + se);
            System.out.println(se.getSQLState());
            System.err.println(se);
        }
        return false;
    }
    
    public double getTotalPesananHistory(String dateFrom, String dateTo) {
        double totalHarga = 0;
        try {
            String sql = "SELECT SUM(total_harga) sum_harga FROM `order` WHERE tanggal BETWEEN ? and ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dateFrom);
            ps.setString(2, dateTo);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalHarga = rs.getDouble("sum_harga");
            }
        } catch (SQLException e) {
            System.out.println("error get data order : "+e);
            return 0.0;
        }
        return totalHarga;
    }
        
    public static void main(String[] args) {
        OrderCtr ctr = new OrderCtr();
        Order order = new Order();
        order.setId("0019923");
        order.setJumlahBayar(100000);
        order.setTanggal("2024-01-06");
        order.setWaktu("122321");
        order.setTotalHarga(100000);
        order.setPajak(10000);
//        ctr.save(order);

        OrderDetail detail = new OrderDetail();
        detail.setOrderId("12212");
        detail.setMenuId("nasigoreng");
        detail.setNamaMenu("Nasi Goreng");
        detail.setHargaMenu(15000);
        detail.setQty(2);
        
        List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
        orderDetails.add(detail);
        
//        ctr.saveDetail(orderDetails);
//        System.out.println(ctr.getAll().size());
        System.out.println(ctr.getTotalPesananHistory("2024-01-07", "2024-01-07"));
    }
}
