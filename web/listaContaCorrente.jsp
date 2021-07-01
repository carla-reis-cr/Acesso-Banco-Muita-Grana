<%-- 
    Document   : listaContaCorrente
    Created on : 24 de jun de 2021, 21:29:42
    Author     : Carla Reis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@page import="br.contaCorrente.Transacao.Transacao" %>
<%@page import="br.contaCorrente.Transacao.TransacaoDAO" %>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.text.DecimalFormatSymbols" %>
<%@page import="java.util.Locale" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Transações</title>
         <link rel="StyleSheet" type="text/css" href="styles.css" media="screen" >
           <script language="javascript" type="text/javascript">
            function checkForm(){
                var conta = myForm.contaIncluir.value;
                var tipoTransacao = myForm.tipoTransacao.value;
                var valor = myForm.valor.value;
                
                if (conta =="" || tipoTransacao=="" || valor==""){
                    alert("Necessario informar todos os campos");
                    return false;
                }
            }
            
            function adcElemento () {
 
                document.body.innerHTML += '<br><br><div style="flex: 2;background-color: white; border-radius: 32px;padding: 32px 32px 0 32px;overflow: hidden;height: 100%;display: flex;flex-direction: column;"><div style="align-items: center;display: flex;flex-direction: row;flex-wrap: wrap;justify-content: center;">Informe os dados da Transação:</div><div style="margin:1em;align-items: center;display: flex;flex-direction: row;flex-wrap: wrap;justify-content: center;"><br><br><form style="margin:0.5em" method="post" action="novaTransacao.jsp" id="myForm"><div style="margin:0.5em">Conta <input type="text" name="contaIncluir"></div><div style="margin:0.5em">Tipo Transação <select id="tipoTransacao" name="tipoTransacao"><option value=""></option><option value="C">Crédito</option><option value="D">Débito</option></select><br></div><div style="margin:0.5em">Valor <input type="text" name="valor"></div><br><br><input class="kb-btn kb-btn-round kb-btn-2" type="submit" value="Inserir" onclick="return checkForm()"/></form></div></div>';
  
            }
        </script> 
    </head>
    <body>
      
        <div>
            <h1>Extrato da Conta Corrente</h1>
        </div>
        <%
            int conta = Integer.parseInt(request.getParameter("conta"));
            
            TransacaoDAO db = TransacaoDAO.getInstance();
            List<Transacao> transacoes = db.getTransacoes(conta);
           
            //Format para valores
            Locale BRAZIL = new Locale("pt","BR");
            DecimalFormatSymbols REAL = new DecimalFormatSymbols(BRAZIL);
            DecimalFormat df = new DecimalFormat("¤ ###,###,##0.00",REAL);
            
            //Variaveis
            double total = 0.00;
            
            if(transacoes.isEmpty()){
                out.print("Conta "+conta+" não possui transações");
            }else{
                
                out.print("<div style=\"font-size:20px\">Transações - Conta: " + conta + "</div>");
                out.print("<div style=\"font-size:16px;align-items:center;border-style:solid;border-color:#b6d3b7;background-color:#b6d3b7\">");
                out.print("<table border=\"1px\" cellpadding=\"5px\" cellspacing=\"0\" ID=\"alter\"");
                out.print("<tr style=\"color:white;background-color:grey;text-align:center\" class=\"dif\">");
                out.print("<td>Data</td>");
                out.print("<td>Débito</td>");
                out.print("<td>Crédito</td>");
                out.print("<td>Total por Transação</td>");
                out.print("</tr>");

            
            for(Transacao a:transacoes){
                //conversão de datas
                String data = a.getData();
                DateFormat formatUS = new SimpleDateFormat("yyyy-MM-dd"); 
                Date dataUS = (Date)formatUS.parse(data);
                SimpleDateFormat formatBR = new SimpleDateFormat("dd/MM/yyyy");
                String dataBR = formatBR.format(dataUS);
               
                int tipoTransacao = a.getTipoTransacaoBoolean();
                double valorTransacao = a.getValor();
                double valorTotalPorLinha = 0.00;
                
                out.print("<tr class=\"dif\">");
                out.print("<td>");
                out.print(dataBR);
                out.print("</td>");
                out.print("<td style=\"color:red\">");
                
                if(tipoTransacao == 0){
                   out.print(df.format(valorTransacao));
                   total = total - valorTransacao;
                   valorTotalPorLinha = total;
               }
                
                out.print("</td>");
                out.print("<td style=\"color:blue\">");
                
                if(tipoTransacao == 1){
                    out.print(df.format(valorTransacao));
                    total = total + valorTransacao;
                    valorTotalPorLinha = total;
                }
                
                out.print("</td>");
                out.print("<td>"+df.format(valorTotalPorLinha)+"</td>");
                out.print("</tr>");
            }
            out.print("</table>");
            out.print("</div>");
        }
            out.print("<h2 format=\"##.###,##\">Saldo: " + df.format(total) + "</h2>");
        %>
        
        
        <input class="kb-btn kb-btn-round kb-btn-2" type="submit" value="Nova Transação" name="newTrans" onclick="return adcElemento()"/>
        
        <form method="post" action="index.html">
        <input class="kb-btn kb-btn-round kb-btn-2" type="submit" value="Transações de Outra conta"/>
        </form>
    </body>

</html>
