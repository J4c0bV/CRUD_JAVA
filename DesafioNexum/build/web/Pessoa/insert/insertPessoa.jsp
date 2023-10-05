<%@page import="br.com.DAO.PessoaDAO"%>
<%@page import="br.com.DTO.PessoaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Page</title>
    </head>
    <body>
        <%
            try {
                    PessoaDTO objPessoaDTO = new PessoaDTO();
                    objPessoaDTO.setNome(request.getParameter("nameInsert"));
                    objPessoaDTO.setEmail(request.getParameter("emailInsert"));
                    objPessoaDTO.setNumeroCadastro(request.getParameter("pessoaCadastroInsert"));
                    objPessoaDTO.setCep(request.getParameter("CEPInsert"));
                    objPessoaDTO.setLogradouro(request.getParameter("logradouroInsert"));
                    objPessoaDTO.setBairro(request.getParameter("bairroInsert"));
                    objPessoaDTO.setCidade(request.getParameter("cidadeInsert"));
                    objPessoaDTO.setEstado(request.getParameter("regiaoInsert"));
                    
                    PessoaDAO objPessoaDAO = new PessoaDAO();
                    objPessoaDAO.CadastroPessoa(objPessoaDTO);
                    
                    String PaginaMostra = "../mostraPessoa.jsp";
                    response.sendRedirect(PaginaMostra);
                } catch (Exception e) {
                }
            
            
        %>
    </body>
</html>