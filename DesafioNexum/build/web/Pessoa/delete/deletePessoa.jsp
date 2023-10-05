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
            PessoaDTO objPessoaDTO = new PessoaDTO();
            objPessoaDTO.setId(Integer.parseInt(request.getParameter("id")));
            
            PessoaDAO objPessoaDAO = new PessoaDAO();
            objPessoaDAO.DeletePessoa(objPessoaDTO);
            
            String PaginaMostra = "../mostraPessoa.jsp";
            response.sendRedirect(PaginaMostra);

        %>
        
        
    </body>
</html>