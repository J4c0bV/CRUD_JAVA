package br.com.DAO;

import br.com.DTO.PessoaDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PessoaDAO {
    
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<PessoaDTO> lista = new ArrayList<>();
    
    public void CadastroPessoa(PessoaDTO objPessoaDTO) throws ClassNotFoundException{
        
        String sql = "INSERT INTO pessoa (nome, email, numero_cadastro, cep, logradouro, bairro, cidade, estado)\n VALUES (?,?,?,?,?,?,?,?)";
        con = new ConexaoDAO().conexaoBD();
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, objPessoaDTO.getNome());
            pstm.setString(2, objPessoaDTO.getEmail());
            pstm.setString(3, objPessoaDTO.getNumeroCadastro());
            pstm.setString(4, objPessoaDTO.getCep());
            pstm.setString(5, objPessoaDTO.getLogradouro());
            pstm.setString(6, objPessoaDTO.getBairro());
            pstm.setString(7, objPessoaDTO.getCidade());
            pstm.setString(8, objPessoaDTO.getEstado());
            
            pstm.execute();
            pstm.close();
            
            
        } catch (SQLException e) {
        }
    }
    
    public ArrayList<PessoaDTO> ReadPessoa(String nameSource) throws ClassNotFoundException{
        String sql = "";
        if(nameSource != ""){
            sql = "SELECT * FROM pessoa WHERE nome LIKE '%"+nameSource +"%' ORDER BY nome";
        }else{
            sql = "SELECT * FROM pessoa";
        }
        con = new ConexaoDAO().conexaoBD();
        
        try {
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery(sql);
            
            while(rs.next()){
                PessoaDTO objPessoaDTO = new PessoaDTO();
                objPessoaDTO.setId(rs.getInt("id"));
                objPessoaDTO.setNome(rs.getString("nome"));
                objPessoaDTO.setEmail(rs.getString("email"));
                objPessoaDTO.setNumeroCadastro(rs.getString("numero_Cadastro"));
                objPessoaDTO.setCep(rs.getString("cep"));
                objPessoaDTO.setLogradouro(rs.getString("logradouro"));
                objPessoaDTO.setBairro(rs.getString("bairro"));
                objPessoaDTO.setCidade(rs.getString("cidade"));
                objPessoaDTO.setEstado(rs.getString("estado"));
                
                lista.add(objPessoaDTO);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    
    public void DeletePessoa(PessoaDTO objPessoaDTO) throws ClassNotFoundException{
        
        String sql = "delete from pessoa where id = ?";
        con = new ConexaoDAO().conexaoBD();
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1,objPessoaDTO.getId());
            
            pstm.execute();
            pstm.close();
        } catch (SQLException e) {
        }
    }
    
    public PessoaDTO especificaPessoa(int idPesquisa) throws ClassNotFoundException{
        String sql = "SELECT * FROM pessoa where id=?";
        con = new ConexaoDAO().conexaoBD();
        PessoaDTO objPessoaDTO = new PessoaDTO();
        try {
            pstm = con.prepareStatement(sql);
            pstm.setInt(1,idPesquisa);
            rs = pstm.executeQuery();
            if(rs.next()){
                objPessoaDTO.setId(rs.getInt("id"));
                objPessoaDTO.setNome(rs.getString("nome"));
                objPessoaDTO.setEmail(rs.getString("email"));
                objPessoaDTO.setNumeroCadastro(rs.getString("numero_Cadastro"));
                objPessoaDTO.setCep(rs.getString("cep"));
                objPessoaDTO.setLogradouro(rs.getString("logradouro"));
                objPessoaDTO.setBairro(rs.getString("bairro"));
                objPessoaDTO.setCidade(rs.getString("cidade"));
                objPessoaDTO.setEstado(rs.getString("estado"));
            }
        } catch (SQLException e) {
        }
        return objPessoaDTO;
    }
    
    public void UpdatePessoa(PessoaDTO objPessoaDTO) throws ClassNotFoundException{
        
        String sql = "update pessoa set nome = ?, "
                + "email = ?, "
                + "numero_cadastro = ?, "
                + "cep = ?, "
                + "logradouro = ?, "
                + "bairro = ?, "
                + "cidade = ?,"
                + " estado = ? "
                + "where id = ?";
        con = new ConexaoDAO().conexaoBD();
        
        try {
            pstm = con.prepareStatement(sql);
            pstm.setString(1, objPessoaDTO.getNome());
            pstm.setString(2, objPessoaDTO.getEmail());
            pstm.setString(3, objPessoaDTO.getNumeroCadastro());
            pstm.setString(4, objPessoaDTO.getCep());
            pstm.setString(5, objPessoaDTO.getLogradouro());
            pstm.setString(6, objPessoaDTO.getBairro());
            pstm.setString(7, objPessoaDTO.getCidade());
            pstm.setString(8, objPessoaDTO.getEstado());
            pstm.setInt(9, objPessoaDTO.getId());
            
            pstm.execute();
            pstm.close();
        } catch (SQLException e) {
        }
    }
    
    
}