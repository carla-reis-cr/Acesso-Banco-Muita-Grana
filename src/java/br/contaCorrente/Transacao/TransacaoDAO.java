package br.contaCorrente.Transacao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class TransacaoDAO {
    private static TransacaoDAO instance;
    String uri = "jdbc:derby://localhost:1527/db_contacorrente";
    Connection con;
    
     public static synchronized TransacaoDAO getInstance(){
        if(instance == null){
            instance = new TransacaoDAO();
        }
        
        return instance;
    }
     
    public void connect(){
        try {
            con = DriverManager.getConnection(uri, "bancoMuitaGrana","1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private TransacaoDAO(){
        connect();
    }
        public List<Transacao> getTransacoes(Integer conta){
            List<Transacao> transacoes = new ArrayList<>();
            Transacao t;
            try {
                
                String sql = "SELECT * FROM TRANSACAO2 WHERE CONTA=? ORDER BY DATA_TRANSACAO, ID";
                PreparedStatement pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, conta);
                ResultSet rs =  pstmt.executeQuery();
                while (rs.next()) {                    
                    t = new Transacao();
                    t.setId(rs.getInt("ID"));
                    t.setConta(rs.getInt("CONTA"));
                    t.setTipoTransacao(rs.getString("TIPO_TRANSACAO"));
                    t.setData(rs.getString("DATA_TRANSACAO"));
                    t.setValor(rs.getDouble("VALOR"));
                    transacoes.add(t);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }     
        return transacoes;
    }
 
    public void addTransacao(Transacao a){
        String sql = "INSERT INTO TRANSACAO2 (CONTA, TIPO_TRANSACAO,VALOR) VALUES (?,?,?)";
        try {
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, a.getConta());
            pstmt.setString(2, a.getTipoTransacao());
            pstmt.setDouble(3, a.getValor());
            pstmt.execute(); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
