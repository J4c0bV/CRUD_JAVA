<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.PessoaDAO"%>
<%@page import="br.com.DTO.PessoaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>form Pessoa</title>
    <link rel="stylesheet" href="../style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.6/jquery.inputmask.min.js"></script>
    <script src="update.js" defer></script>
    </head>
    <body>
         <%
            PessoaDTO objPessoaDTO = new PessoaDTO();
            objPessoaDTO.setId(Integer.parseInt(request.getParameter("id")));
            int idBusca = objPessoaDTO.getId();
            
            PessoaDAO objPessoaDAO = new PessoaDAO();
            PessoaDTO updatePessoaDTO = new PessoaDTO();
            updatePessoaDTO= objPessoaDAO.especificaPessoa(idBusca);
            
        %>
    <div class="HeaderFormPessoa">
        <h1>Atualização de Pessoas</h1>
    </div>
    <div class="container-Principal">
        <div class="cadastro">
            <form action="updatePessoa.jsp" method="post" class="formsPessoa">
                <input type="hidden" id="id" value="<%=updatePessoaDTO.getId()%>" name="idUpdate" class="inputstexts" required placeholder="id" >
                <label for="name" class="LblPessoas">Nome Completo</label>
                <input type="text" id="name" value="<%=updatePessoaDTO.getNome()%>" name="nameUpdate" class="inputstexts" required placeholder="Nome">
                
                <label for="email" class="LblPessoas">E-mail</label>
                <input type="email" id="email" value="<%=updatePessoaDTO.getEmail()%>" name="emailUpdate" class="inputstexts" required placeholder="email">
                
                <label for="pessoa" class="LblPessoas">Tipo de Pessoa</label>
                <select name="pessoa" id="Pessoa" class="selects" required>
                    <option value="null">Selecio um tipo de pessoa</option>
                    <option value="fisica">Pessoa física</option>
                    <option value="juridica">Pessoa jurídica</option>
                </select>

                <label for="inputPessoa"  id="tipoPessoa"class="LblPessoas">Número de cadastro</label>
                <input type="text" id="inputPessoa" value="<%=updatePessoaDTO.getNumeroCadastro()%>" name="pessoaCadastroUpdate" class="inputstexts" required placeholder="Cadastro" readOnly>
                
                <label for="CEP" class="LblPessoas">CEP</label>
                <input type="text" id="CEP" value="<%=updatePessoaDTO.getCep()%>" name="CEPUpdate" class="inputstexts" maxlength="9" minlength="8" placeholder="CEP">
     
                <label for="logradouro" class="LblPessoas"> Logradouro</label>
                <input type="text" id="logradouro" value="<%=updatePessoaDTO.getLogradouro()%>" name="logradouroUpdate" placeholder="Logradouro" readOnly required data-input class="inputstexts">
                
                <label for="bairro" class="LblPessoas"> Bairro</label>
                <input type="text" id="bairro" value="<%=updatePessoaDTO.getBairro()%>" name="bairroUpdate" placeholder="Bairro" readOnly required data-input class="inputstexts">
                
                <label for="cidade" class="LblPessoas">Cidade</label>
                <input type="text" id="cidade" value="<%=updatePessoaDTO.getCidade()%>" name="cidadeUpdate" placeholder="Cidade" readOnly required data-input class="inputstexts">

                <label for="região">Estado</label>
                <input type="text" id="regiao" value="<%=updatePessoaDTO.getEstado()%>" name="regiaoUpdate" placeholder="Estado" readOnly required data-input class="inputstexts">
                

                <hr>
                <button class="btnCancelar"><a href="../mostraPessoa.jsp">cancelar</a></button>
                <button type="submit" class="btnEnviar">Enviar</button>
            </form>
        </div>
    </div>
    </body>
</html>