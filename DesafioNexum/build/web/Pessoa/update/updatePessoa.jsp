<%@page import="br.com.DAO.PessoaDAO"%>
<%@page import="br.com.DTO.PessoaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            try {
                    PessoaDTO objPessoaDTO = new PessoaDTO();
                    objPessoaDTO.setId(Integer.parseInt(request.getParameter("idUpdate")));
                    objPessoaDTO.setNome(request.getParameter("nameUpdate"));
                    objPessoaDTO.setEmail(request.getParameter("emailUpdate"));
                    objPessoaDTO.setNumeroCadastro(request.getParameter("pessoaCadastroUpdate"));
                    objPessoaDTO.setCep(request.getParameter("CEPUpdate"));
                    objPessoaDTO.setLogradouro(request.getParameter("logradouroUpdate"));
                    objPessoaDTO.setBairro(request.getParameter("bairroUpdate"));
                    objPessoaDTO.setCidade(request.getParameter("cidadeUpdate"));
                    objPessoaDTO.setEstado(request.getParameter("regiaoUpdate"));
                    
                    PessoaDAO objPessoaDAO = new PessoaDAO();
                    objPessoaDAO.UpdatePessoa(objPessoaDTO);
                    
                    String PaginaMostra = "../mostraPessoa.jsp";
                    response.sendRedirect(PaginaMostra);
                } catch (Exception e) {
                }
        %>
    </body>
</html>
