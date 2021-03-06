<!-- ROMANO SIMONE
	Antonio De Piano -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="it.unisa.vviser.storage.DBGestioneProdotto"%>
<%@ page import="it.unisa.vviser.entity.Prodotto"%>
<%@ page import="it.vviser.common.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
	<title>VViSeR</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<link href="/vviser/css/stile1.css" rel="stylesheet" type="text/css"/>
	<link href="/vviser/css/stile2.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
	th{	color:ORANGERED;
		text-align: left;}
		table{padding-top:5%;}
		fieldset{width:40%;}
	td{text-align:center;}
	</style>
</head>
<body>
<%
	//recupero prodotto
	Prodotto prodotto = (Prodotto)request.getAttribute("prodotto");
%>
<fieldset>
		<legend>Prodotto</legend>
<table border=0>
<tr><th>TITOLO</th><td><%out.print(prodotto.getTitolo()); %></td></tr>
<tr><th>ISBN</th><td><%out.print(prodotto.getIsbn()); %></td></tr>
<tr><th>PROPRIETARIO</th><td><%out.print(prodotto.getProprietario()); %></td></tr>
<tr><th>ANNO PUBBLICAZIONE</th><td><%out.print(CommonMethod.dateToString(prodotto.getAnnoPubblicazione())); %></td></tr>
<tr><th>FORMATO</th><td><%out.print(prodotto.getFormatoPubblicazione()); %></td></tr>
<tr><th>DOI</th><td><%out.print(prodotto.getCodiceDOI()); %></td></tr>
<tr><th>DIFFUSIONE</th><td><%out.print(prodotto.getDiffusione()); %></td></tr>
<tr><th>COLLABORATORI</th><td><%out.print(prodotto.getListaCollaboratori()); %></td></tr>
<tr><th>DESCRIZIONE</th><td><%out.print(prodotto.getDescrizioneContenuti()); %></td></tr>
<tr><th>INDIRIZZO WEB</th><td><%out.print(prodotto.getIndirizzoWeb()); %></td></tr>
<tr><th>PAROLE CHIAVE</th><td><%out.print(prodotto.getParoleChiavi()); %></td></tr>
<tr><th>EDITORE</th><td><%out.print(prodotto.getEditore()); %></td></tr>
<tr><th>NUMERO VOLUME</th><td><%out.print(prodotto.getNumVolume()); %></td></tr>
<tr><th>TOTALE PAGINE</th><td><%out.print(prodotto.getTotalePagine()); %></td></tr>
<tr><th>DA PAGINA</th><td><%out.print(prodotto.getDaPagina()); %></td></tr>
<tr><th>A PAGINA</th><td><%out.print(prodotto.getApagina()); %></td></tr>
<tr><th>NOTE</th><td><%out.print(prodotto.getNote()); %></td></tr>
<tr><th>STATO</th><td><%out.print(prodotto.getStato()); %></td></tr>
<tr><th>BOZZA</th><td><%out.print(prodotto.getBozza()); %></td></tr>
<tr><th>TIPOLOGIA</th><td><%out.print(prodotto.getTipologia()); %> </td></tr>
</table>
</fieldset>
</body>
</html>