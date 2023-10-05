<%@page import="java.sql.SQLException"%>
<%@page import="br.com.DTO.PessoaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.PessoaDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pessoas cadastradas</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="cabecalho">
        <h1>Pessoas Cadastradas</h1>
    </div>
    <div class="principal">
        <div class="source">
            <%
            String nameSource = request.getParameter("nameSource");
            if (nameSource != null) {
                
            } else {
                nameSource = "";
            }
            %>
            <h2>Pesquisa</h2>
            <hr>
            <form action="mostraPessoa.jsp" class="formsCadatrados">
                <label for="name" class="lbIndex">Nome</label>
                <input type="text" id="name" name="nameSource" class="inputsCadastrados">

                <button type="submit" class="filtro">FILTRAR</button>
                <button type="submit" class="filtroLimpar"><a href="mostraPessoa.jsp?nameSource=">LIMPAR</a></button>
            </form>
        </div>

        <div class="Info">
            <table>
                <tr>
                    <th>Nome</th>
                    <th>CPF / CNPJ</th>
                    <th>Email</th>
                    <th>atualizar</th>
                    <th>remover</th>
                </tr>
                <%
                    try {
                    PessoaDAO objPessoaDAO = new PessoaDAO();
                    ArrayList<PessoaDTO> lista = objPessoaDAO.ReadPessoa(nameSource);
                    
                    for(int i = 0; i<lista.size();i++){
                        int id = lista.get(i).getId();
                        String nome = lista.get(i).getNome();
                        String numeroCadastro = lista.get(i).getNumeroCadastro();
                        String email = lista.get(i).getEmail();
                        
                        String urlDelete = "delete/deletePessoa.jsp?id="+lista.get(i).getId();
                        String urlUpdate = "update/formsPessoaUpdate.jsp?id="+lista.get(i).getId();
                %>
                <tr>
                    <td><%=nome%></td>
                    <td><%=numeroCadastro%></td>
                    <td><%=email%></td>
                    <td><a href=<%=urlUpdate%>>atualizar</a></td>
                    <td><a href=<%=urlDelete%>>delete</a></td>
                    
                <%
                        }
                    }catch(Exception e){      
                    }
                %>
                </tr>
            </table>
        </div>
        <a href="insert/formsPessoa.html">Inserir</a>
    </div>
</body>
</html>