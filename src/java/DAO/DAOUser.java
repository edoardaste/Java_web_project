package DAO;

import java.sql.Connection; // criar e abrir conexao - caminho do banco de dados
import MODEL.Usuario; //metodos get e set do usuario estao na classe model
import java.sql.PreparedStatement; // responsavel por executar instruções SQL com parametros
import java.sql.SQLException;
import java.sql.Statement; // Excutar instrucoes sql sem parametro
import java.util.ArrayList; // exibir o vlor de retorno do result set
import java.sql.ResultSet; // recebe valor de retorno no banco de dados

    public class DAOUser {
    
    
        private Connection conn;
        private PreparedStatement stmt;
        private Statement st;
        private ResultSet rs;
        private ArrayList<Usuario> lista = new ArrayList<>();
        
        public DAOUser() throws ClassNotFoundException {
        
            conn = new Conexao().getConexao();
        
        }
    
        public void InserirUsuario(Usuario usuario) {
        
            String sql = "INSERT INTO usuario (nome, email, senha) VALUES (?, ?, ?)";
                
            try{
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getNome_usuario());
            stmt.setString(2, usuario.getEmail_usuario());
            stmt.setString(3, usuario.getSenha_usuario());        
                    
            stmt.execute();
            stmt.close();
                    
            }catch(SQLException erro){
            
                throw new RuntimeException("erro inserir usuario" + erro);
            }
    
        }
    
        //MÉTODO LISTAR USUARIOS
        
        public ArrayList<Usuario> listarUsuarios() {
            // variavel que recebe a instrucao SQL
            String sql = "SELECT * FROM usuario";
                    
                    try{                    
                        //CAMINHO DE CONEXÃO PARA O STATEMENT - st
                        st = conn.createStatement();
                        //passar para o result set o retorno d instrução sql
                        rs = st.executeQuery(sql);
                        while(rs.next()){
                                Usuario usuario = new Usuario();
                                usuario.setID(rs.getInt("id"));
                                usuario.setNome_usuario(rs.getString("nome"));
                                usuario.setEmail_usuario(rs.getString("email"));
                                usuario.setSenha_usuario(rs.getString("senha"));
                                lista.add(usuario);
                        
                        }
                    
                    }catch(Exception erro){
                            throw new RuntimeException("Erro ao executar a listagem usuario");
    
                    
                    }
                    
            return lista;
                
        }
        
        //listar por nome
         public ArrayList<Usuario> listarUsuariosNome(String valor) {
            // variavel que recebe a instrucao SQL
            String sql = "SELECT * FROM usuario WHERE nome LIKE '%"+valor+"%'";
                    
                    try{                    
                        //CAMINHO DE CONEXÃO PARA O STATEMENT - st
                        st = conn.createStatement();
                        //passar para o result set o retorno d instrução sql
                        rs = st.executeQuery(sql);
                        while(rs.next()){
                                Usuario usuario = new Usuario();
                                usuario.setID(rs.getInt("id"));
                                usuario.setNome_usuario(rs.getString("nome"));
                                usuario.setEmail_usuario(rs.getString("email"));
                                usuario.setSenha_usuario(rs.getString("senha"));
                                lista.add(usuario);
                        
                        }
                    
                    }catch(SQLException erro){
                            throw new RuntimeException("Erro ao executar a listagem usuario");
    
                    
                    }
                    
            return lista;
                
        }
        
  
        
    }