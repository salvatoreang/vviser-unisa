<%-- 
    Author: Giuseppe Sabato
--%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="it.unisa.vviser.entity.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="org.json.JSONObject"%>
<%@ page session="true"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8"/>
    <title>Seleziona prodotti</title>
    <script type="text/javascript">
    	i=0;
    	function attivaP(check)
    	{
    		id=check.getAttribute('id');
    		n=document.getElementById("tn").value;
    		if(document.getElementById(id).checked==true)
    		{
    			document.getElementById("t"+id).disabled=false;
    			if(i<n)
    			{
    				i++;
    			}
    			else
    			{
    				alert("Puoi sottomettere max "+n+" prodotti !!");
    				document.getElementById(id).checked=false;
    				document.getElementById("t"+id).disabled=true;
    			}
    		}
    		else
    		{
    			i--;
    			document.getElementById("t"+id).disabled=true;
    		}
    		

    	}
    	
    	//controllo che venga selezionato almeno un prodotto
    	function controlMin()
    	{
    		if(i==0)
    		{
    			alert("Nessun prodotto selezionato !");
    			document.getElementById("bsp").type="reset";
    		}
    	}
    </script>
</head>

<body>

<%
	ArrayList<Prodotto> prodotti=new ArrayList<Prodotto>();
	prodotti=(ArrayList<Prodotto>)request.getAttribute("prod");
    int numProdMax=(Integer)request.getAttribute("numProdMax");
    
    out.println("<input id=\"tn\" type=\"text\" value="+numProdMax+" hidden/>");
%>
<form id="mod1" action="/vviser/ServletInsertProdottiValutazione" method="POST">
    <table>
        <tr>
            <th colspan="3">Seleziona Prodotti</th>    
        </tr>
        <tr>
        	<th>Spunta</th>
            <th>Titolo</th>
            <th>Priorita'</th>    
        </tr>
        <% 
        for(int i=0;i<prodotti.size();i++)
        {
        out.println("<tr>");
            out.println("<td><input type=\"checkbox\" name=\"selProd\" id="+i+" value="+prodotti.get(i).getIsbnTitleProdotto()+" onclick=\"attivaP(this)\""+"/></td>");
            out.println("<td>"+prodotti.get(i).getTitolo()+"</td>");
            String idInput="t"+i;
            //System.out.println(idInput);
            out.println("<td><input id="+idInput+" type=\"text\" name=\"priorita\" pattern=\"[0-5]{1}\" disabled=\"true\" /></td>");
        out.println("<tr>");
        }
        
        %>
    </table>
    <button id="bsp" class="pulsante" type="submit" name="sottometti" onclick="controlMin()" >Sottometti</button>
</form>


</body>
</html>
