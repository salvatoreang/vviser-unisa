package it.unisa.vviser.servlet;

import it.unisa.vviser.entity.Prodotto;
import it.unisa.vviser.entity.Utente;
import it.unisa.vviser.storage.DBGestioneProdotto;
import it.unisa.vviser.storage.DBProdottiValutazione;
import it.vviser.common.CommonMethod;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 
 * @author Antonio De Piano
 *
 */
public class InserimentoProdottoServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private DBGestioneProdotto gprodotto;

	/**
	 * 
	 */
	public void init(ServletConfig config) throws ServletException
	{
		super.init(config);
		this.gprodotto=DBGestioneProdotto.getInstance();
	}
	
	/**
     * Gestisce il metodo HTTP <code>GET</code>
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException in presenza di un errore servlet
     * @throws IOException in presenza di un errore I/O 
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
        processRequest(request, response);
    }
	
	/**
     * Gestisce il metodo HTTP <code>POST</code>
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException in presenza di un errore servlet
     * @throws IOException in presenza di un errore I/O 
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

	/**
	 * Inserisce un prodotto
	 * @param request servlet request
	 * @param response servlet response
	 */
	private void processRequest(HttpServletRequest request,HttpServletResponse response)
	{
		String isbn = request.getParameter("isbn");
		String titolo = request.getParameter("titolo");
		String dataPubblicazione = request.getParameter("data");
		
		String formatoPubblicazione = request.getParameter("formato_pub");
		String codiceDoi = request.getParameter("doi");
		String diffusione = request.getParameter("diffusione");
		String tipologia = request.getParameter("tipologia");
		String note = request.getParameter("note");
		String collaboratori[] = request.getParameterValues("collaboratori");
		String descrizione = request.getParameter("descrizione");

		String indirizzoweb = request.getParameter("indirizzoweb");
		String key = request.getParameter("key");
		String editore = request.getParameter("editore");
		String num_volume = request.getParameter("num_volume");
		String totalePagine = request.getParameter("totalePagine");

		String daPagina = request.getParameter("daPagina");
		String aPagina = request.getParameter("aPagina");
		HttpSession session = request.getSession();
		Utente currentUser = (Utente) session.getAttribute("utente");
		
		try
		{
			Prodotto prod=new Prodotto();
			
			prod.setIndirizzoWeb(indirizzoweb);
			prod.setAnnoPubblicazione(CommonMethod.stringToDate(dataPubblicazione));
			if(!aPagina.equals(""))
				prod.setApagina(Integer.parseInt(aPagina));
			else
				prod.setApagina(0);
			prod.setBozza(false);
			if(!daPagina.equals(""))
				prod.setDaPagina(Integer.parseInt(daPagina));
			else
				prod.setDaPagina(0);
			prod.setDescrizioneContenuti(descrizione);
			prod.setCodiceDOI(codiceDoi);
			prod.setIsbn(isbn);
			prod.setTipologia(tipologia);
			prod.setTitolo(titolo);
			prod.setEditore(editore);
			prod.setDiffusione(diffusione);
			if(collaboratori==null)
			{
				prod.setListaCollaboratori(null);
			}
			else
			{
				for(int i=0;i<collaboratori.length;i++)
				{
						prod.setListaCollaboratori(collaboratori[i]);
				}
			}
			
			if(!num_volume.equals(""))
				prod.setNumVolume(Integer.parseInt(num_volume));
			else
				prod.setNumVolume(0);
			prod.setParoleChiavi(key);
			prod.setNote(note);
			prod.setStato("NonValidato");
			prod.setProprietario(currentUser.getEmail());
			prod.setFormatoPubblicazione(formatoPubblicazione);
			if(!totalePagine.equals(""))
				prod.setTotalePagine(Integer.parseInt(totalePagine));
			else
				prod.setTotalePagine(0);
			this.gprodotto.insertProdotto(prod);
		}
		catch (SQLException ex)
		{
			ex.printStackTrace();
		}
	
		ServletContext sc = getServletContext();
		// ridirezione alla home dei prodotti
		RequestDispatcher rd = sc.getRequestDispatcher("/gpr/gpr.jsp");
		try
		{
			rd.forward(request,response);
		}
		catch (ServletException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}
}