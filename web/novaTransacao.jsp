<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.contaCorrente.Transacao.Transacao" %>
<%@page import="br.contaCorrente.Transacao.TransacaoDAO" %>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.text.DateFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            int conta = Integer.parseInt(request.getParameter("contaIncluir"));
            String tipoTransacao = request.getParameter("tipoTransacao");
            Double valor = Double.parseDouble(request.getParameter("valor").replace(',', '.'));
            
            TransacaoDAO db = TransacaoDAO.getInstance();
            Transacao a = new Transacao();
            a.setConta(conta);
            a.setTipoTransacao(tipoTransacao);
            a.setValor(valor);
                
            db.addTransacao(a);
            
            response.sendRedirect("listaContaCorrente.jsp" + "?conta=" + conta);
        %>
    </body>
</html>
