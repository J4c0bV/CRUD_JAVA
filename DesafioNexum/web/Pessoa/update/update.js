const PessoaSelect = document.getElementById('Pessoa');
const LabelPessoa = document.getElementById('tipoPessoa');
const InputPessoa = document.getElementById('inputPessoa');

function validarCPF(cpf) {
    cpf = cpf.replace(/[.-]/g, '');
    if ( !cpf || cpf.length != 11
        || cpf == "00000000000"
        || cpf == "11111111111"
        || cpf == "22222222222" 
        || cpf == "33333333333" 
        || cpf == "44444444444" 
        || cpf == "55555555555" 
        || cpf == "66666666666"
        || cpf == "77777777777"
        || cpf == "88888888888" 
        || cpf == "99999999999" )
    return false
    var soma = 0
    var resto
    
    for (var i = 1; i <= 9; i++) 
        soma = soma + parseInt(cpf.substring(i-1, i)) * (11 - i)
    resto = (soma * 10) % 11
    if ((resto == 10) || (resto == 11))  resto = 0
    if (resto != parseInt(cpf.substring(9, 10)) ) return false
    soma = 0
    for (var i = 1; i <= 10; i++) 
        soma = soma + parseInt(cpf.substring(i-1, i)) * (12 - i)
    resto = (soma * 10) % 11
    if ((resto == 10) || (resto == 11))  resto = 0
    if (resto != parseInt(cpf.substring(10, 11) ) ) return false
    return true
}

function validarCNPJ(cnpj) {
    cnpj=cnpj.replace(/[./-]/g, '');
    if ( !cnpj || cnpj.length != 14
        || cnpj == "00000000000000" 
        || cnpj == "11111111111111" 
        || cnpj == "22222222222222" 
        || cnpj == "33333333333333" 
        || cnpj == "44444444444444" 
        || cnpj == "55555555555555" 
        || cnpj == "66666666666666" 
        || cnpj == "77777777777777" 
        || cnpj == "88888888888888" 
        || cnpj == "99999999999999")
    return false
    var tamanho = cnpj.length - 2
    var numeros = cnpj.substring(0,tamanho)
    var digitos = cnpj.substring(tamanho)
    var soma = 0
    var pos = tamanho - 7
    for (var i = tamanho; i >= 1; i--) {
    soma += numeros.charAt(tamanho - i) * pos--
    if (pos < 2) pos = 9
    }
    var resultado = soma % 11 < 2 ? 0 : 11 - soma % 11
    if (resultado != digitos.charAt(0)) return false;
    tamanho = tamanho + 1
    numeros = cnpj.substring(0,tamanho)
    soma = 0
    pos = tamanho - 7
    for (var i = tamanho; i >= 1; i--) {
    soma += numeros.charAt(tamanho - i) * pos--
    if (pos < 2) pos = 9
    }
    resultado = soma % 11 < 2 ? 0 : 11 - soma % 11
    if (resultado != digitos.charAt(1)) return false
    return true;
}

PessoaSelect.addEventListener('change', function () {
    const selectPessoa = PessoaSelect.value;

    $(InputPessoa).inputmask('remove');

    if (selectPessoa !== 'null' && selectPessoa === 'fisica') {
        InputPessoa.readOnly = false;
        LabelPessoa.textContent = 'CPF';
        InputPessoa.maxLength = 14;
        InputPessoa.placeholder = "CPF"
        $(InputPessoa).inputmask('999.999.999-99');
    } else if (selectPessoa !== 'null' && selectPessoa === 'juridica') {
        InputPessoa.readOnly = false;
        LabelPessoa.textContent = 'CNPJ';
        InputPessoa.maxLength = 18;
        InputPessoa.placeholder = "CNPJ"
        $(InputPessoa).inputmask('99.999.999/9999-99');
    } else if(selectPessoa === 'null'){
        InputPessoa.readOnly = true;
        LabelPessoa.textContent = "Número de cadastro";
        InputPessoa.placeholder = "Cadastro"
    }
});

InputPessoa.addEventListener('blur', function () {
    const inputPessoaValue = InputPessoa.value;

    if (PessoaSelect.value === 'fisica') {
        const cpfValido = validarCPF(inputPessoaValue);
        if (!cpfValido) {
            alert('CPF inválido');
            InputPessoa.value = '';
        }
    } else if (PessoaSelect.value === 'juridica') {
        const cnpjValido = validarCNPJ(inputPessoaValue);
        if (!cnpjValido) {
            alert('CNPJ inválido');
            InputPessoa.value = '';
        }
    }
});

const formsPessoa = document.querySelector(".formsPessoa");
const inputCEP = document.querySelector("#CEP");
const inputLogradouro = document.querySelector("#logradouro");
const inputBairro = document.querySelector("#bairro");
const inputCidade = document.querySelector("#cidade");
const inputRegiao = document.querySelector("#regiao");

inputCEP.addEventListener("keypress", (e) =>{
    const ApenasNumeros = /[0-9]|\./;
    const digitos = e.key;

    // allow only numbers
    if (!ApenasNumeros.test(digitos)) {
    e.preventDefault();
    return;
    }
});

inputCEP.addEventListener("keyup" , (e)=> {
    const CEP = e.target.value;

    if(CEP.length === 5){
        inputCEP.value = CEP.replace(/(\d{5})/,'$1-');
    }
    if(CEP.length === 9){
        pegaCEP(CEP);
    }
});

function removeClickSelect() {

}

const pegaCEP = async (cep) => {
    inputCEP.blur();

    const apiUrl = `https://viacep.com.br/ws/${cep}/json/`;

    const resposta = await fetch(apiUrl);

    const data = await resposta.json();
    
    if(data.erro !== "true"){
        inputLogradouro.value = data.logradouro;
        inputBairro.value = data.bairro;
        inputCidade.value = data.localidade;
        inputRegiao.value = data.uf;

        inputLogradouro.readOnly = true;
        inputBairro.readOnly = true;
        inputCidade.readOnly = true;
        inputRegiao.readOnly = true;

        inputRegiao.addEventListener('click' , ()=>{
            alert("Não é possivel alterar somente o estado");
            inputRegiao.value = data.uf;
       })
    }else{
        inputCEP.value = "";
        alert("Erro na hora de digitar o cep, tente novamente");
        return;
    }

   
}