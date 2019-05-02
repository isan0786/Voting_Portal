package ca.ishananand.controllers;

import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.PersistenceException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.exception.ConstraintViolationException;

import ca.ishananand.beans.Vote;
import ca.ishananand.beans.Voter;
import ca.ishananand.dao.Dao;

/**
 * Servlet implementation class VotingServlet
 */
@WebServlet("/VotingServlet")
public class VotingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String party = "";
    private int sinSaver =0;
    private String divHide = "hidden";
    Dao dao = new Dao();
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VotingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		party =  request.getParameter("party");
		if(!(party == null || party.equals("") || sinSaver == 0)) {
			System.out.println(" do get method gets invoker with values " + party + "   sin no -" + sinSaver);
//			Dao dao = new Dao();
			dao.updateVote(sinSaver, true, party);
			party = "";
			sinSaver = 0;
			divHide = "hidden";
			request.setAttribute("hideDiv", divHide);
			request.setAttribute("SuccesssVote", "Your vote gets registered Successfully");
			request.getRequestDispatcher("Voters_Verification.jsp").forward(request, response);
		}else {
		System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		System.out.println(divHide);
		System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		request.getRequestDispatcher("Voter_Registeration.jsp").forward(request, response);
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String generateVotes = request.getParameter("voterGenerateStats");
		String dummyRecordsVoters = request.getParameter("GenerateRecords");
		String hidden = request.getParameter("query");
		String voterInformation = request.getParameter("voterInformation");
		String voterRegister = request.getParameter("voterRegisteration");
		String voterStatistics = request.getParameter("voterStats");
		
		VotingCalculations calculations = new VotingCalculations();
		int sinNumber;
		String message;
		message = "Registered Successfully";
		
		
		if(generateVotes != null) {
			 List<Voter> votersList = calculations.generateRandomVotingParties(dao);
			if(votersList.size() == 0 ) {
				System.out.println(" voters size "+votersList.size());
				request.setAttribute("successDummies", "Please Insert Dummy Records Or Insert Records Manually" );
				request.getRequestDispatcher("index.jsp").forward(request, response);	
			}else {
				request.setAttribute("btndisabled", "disabled" );
				request.setAttribute("btncolor", "black" );
				request.setAttribute("successDummies", "Votes assigned successfully, Please see Statistics" );
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
		
		
		if(voterStatistics != null) {
		List<Voter> voteStats = dao.votersList();
			if(voteStats.size() == 0 ) {
				System.out.println(" voters size "+voteStats.size());
				request.setAttribute("successRandomVotes", "Please Insert Dummy Records Or Insert Records Manually" );
				request.getRequestDispatcher("Voters_Statistics.jsp").forward(request, response);	
			}else {
			double[] partyResult = calculations.votingPartyResults(voteStats);
			double[] ageGroupResult = calculations.ageGroupVotedResults(voteStats);
			int[] didVote = calculations.votersDidVote(voteStats);
			
			if(partyResult[0] == 0 && partyResult[1] == 0 && partyResult[2] == 0 && partyResult[3] == 0 && partyResult[4] == 0) {
				request.setAttribute("noParties",  "No Voters been Voted so, no parties won");
			}
			request.setAttribute("partyResultjsp", partyResult );
			request.setAttribute("ageGroupResultjsp", ageGroupResult );
			request.setAttribute("didVotejsp", didVote );
			request.setAttribute("successRandomVotes", "Votes Statistics Result" );
			request.getRequestDispatcher("Voters_Statistics.jsp").forward(request, response);
			}
		}
		
		
		if(dummyRecordsVoters != null) {
			String messager = "";
			try {
			calculations.generateRandomVoters(dao);
			messager = "200 Records Gets Created Successfully";
			}catch(Exception ex) {
				messager = "Unable to generate Records";
			}
			request.setAttribute("successDummies", messager );
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		if(voterRegister != null) {
//			Dao dao = new Dao();
			Vote vote = new Vote(false);
		Voter person = new Voter(Integer.parseInt(request.getParameter("sin")),request.getParameter("firstName"),request.getParameter("lastName")
				,request.getParameter("dob"),request.getParameter("address"),Integer.parseInt(request.getParameter("age")), vote);
		vote.setVoterPerson(person);
		try {
		dao.addVoter(person);
		System.out.println("add Voter gets invoked2");
		} 
		
		catch(Exception ex) {
			message = "Sin number already exists, Inform Service Canada";
		
		}
		
		request.setAttribute("successRegister", message );
		request.getRequestDispatcher("Voter_Registeration.jsp").forward(request, response);
		
		System.out.println("Voter registeration geta invoked and voter info " + person.toString() + person.getVote().toString());
		
		}
		else if(voterInformation != null) {
//			Dao dao = new Dao();
			List<Voter> votersLists  = dao.votersList();
			if(votersLists.size() == 0 ) {
				request.setAttribute("noVoterInfo", "Please Insert Dummy Records" );
				request.getRequestDispatcher("Voters_Information.jsp").forward(request, response);	
			}else {
			System.out.println("getting voters");
			request.setAttribute("voterList", votersLists );   
			request.getRequestDispatcher("Voters_Information.jsp").forward(request, response);}
		}
		else 
		{
			if(hidden != null) {
//			Dao dao = new Dao();
			String pageInfo = "";
			
			
			
			sinNumber = Integer.parseInt(request.getParameter("sin"));
			
			Voter person = dao.retreiveVoterById(sinNumber);
			if(person == null) {
				divHide = "hidden";
				pageInfo = "Not allowed to vote because you are not \"Registered\"";
				// voter doesn;t exist please register
			}
			else {
				
				// registered already
				if(person.getVote().isVote()) {
				pageInfo = "You voted already" ;
				
					// voter already voted
				}else {
					sinSaver = sinNumber;
					divHide = "unhidden";
					pageInfo = "You are the Registered user, Please choose the Party";
					// you didn't vote yet please vote
				}
			}
			System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
			System.out.println(divHide);
			System.out.println(pageInfo);
			System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
			request.setAttribute("personCriteria", pageInfo);
			request.setAttribute("hideDiv", divHide);
			request.getRequestDispatcher("Voters_Verification.jsp").forward(request, response);
		}
		}
	}

}
