package ca.ishananand.controllers;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import ca.ishananand.beans.Vote;
import ca.ishananand.beans.Voter;
import ca.ishananand.dao.Dao;

public class VotingCalculations {

// Generate Random voters and store them into the database
public void generateRandomVoters(Dao dao) {
	int min = 100000000;
	int max = 999999999;
	
	int minAge =18;
	int maxAge =100;
	Random rand = new Random(); 
	List<Integer> randomChecker = new ArrayList<Integer>();
	int randomSin;
	int randomAge;
	int randomDobDay;
	int randomDobMonth;
	int randomDobYear;
	
	
	
	List<Voter> voter = dao.votersList();
	
	
	for(int i= 0 ; i < voter.size(); i ++) {
		randomChecker.add(voter.get(i).getSin());
	}
	
	for(int i = 0 ; i < 200; i ++) {
		
		randomSin = rand.nextInt((max - min) + 1) + min;
		randomAge = rand.nextInt((maxAge - minAge) + 1) + minAge;
		randomDobDay = rand.nextInt((29-1)+1) + 1;
		randomDobMonth = rand.nextInt((12-1)+1) + 1;
		System.out.println(randomDobMonth);
		System.out.println(randomDobDay);
		randomDobYear = 1901 + (int)Math.round(Math.random() * (2001 - 1901));
		System.out.println(randomDobYear);
		
		
		while(randomChecker.contains(randomSin)) {
			randomSin = rand.nextInt((max - min) + 1) + min;
		} 
		randomChecker.add(randomSin);
			Vote vote = new Vote(false);
			Voter person = new Voter(randomSin , "Dwayne" , "Johnson " + i, randomDobMonth+"-" +randomDobDay+"-"+randomDobYear, "Dallas Street " + i, randomAge, vote);
			vote.setVoterPerson(person);
			dao.addVoter(person);

		
	}
	
}


/// should be invoke once
public List<Voter> generateRandomVotingParties(Dao dao) {
	
		List<Voter> voterVoteList = new ArrayList<Voter>();
	   ArrayList<String> parties = new ArrayList<String>();
//	   Dao dao = new Dao();
	   parties.add("Liberal Party");
	   parties.add("Conservative Party");
	   parties.add("New Democratic Party");
	   parties.add("Bloc Quebecois");
	   parties.add("Green Party");
	   int ratio = 0;
	   Random rand = new Random();
	   
	   //assign votes eg random = 110 votes to the people
	   int random = 0;
	   
	   List<Voter> votersList = dao.votersList();
	   System.out.println(votersList);
	   int votingPeople = votersList.size();
	   System.out.println(votingPeople);
	   random =(rand.nextInt(((int)((80*votingPeople)/100) - (int)((60*votingPeople)/100)) + 1) + (int)((60*votingPeople)/100));
	   System.out.println("random is "+random);
	   System.out.println("ratio is " +ratio);
		while(random > ratio) {

			int i = rand.nextInt(votingPeople);
			int index = rand.nextInt(parties.size());
			
			if(votersList.get(i).getVote().isVote()) {
				// what if somebody just enter registered with vote into  the database and if we want that person too then do something here
				voterVoteList.add(votersList.get(i));
				ratio++;
				
				
			}else {
				
				votersList.get(i).getVote().setVote(true);
				votersList.get(i).getVote().setParty(parties.get(index));
				dao.updateVote(votersList.get(i).getSin(), votersList.get(i).getVote().isVote(),votersList.get(i).getVote().getParty());
				voterVoteList.add(votersList.get(i));
				ratio++;
			}
			
			
			
		}
		System.out.println(voterVoteList.size() + "voter list");
		// if want to save it into the data base then use update command for
		return voterVoteList;		
		
	}

public double[] votingPartyResults(List<Voter> votersList) {
	String party;
	int lP = 0;
	int cP = 0;
	int nDP = 0;
	int bQ = 0 ;
	int gP = 0;
	double[] partyResultOneDec = new double[5];
	System.out.println(votersList.size()+"+++++++++++++++++++++_-----------------");
	for (Voter temp : votersList) {

		party = temp.getVote().getParty();
		if (party == null) {
			continue;
		}else {
		switch (party) {
			case "Liberal Party":
				lP++;
				break;
			case "Conservative Party":
				cP++;
				break;
			case "New Democratic Party":
				nDP++;
				break;
			case "Bloc Quebecois":
				bQ++;
				break;
			case "Green Party":
				gP++;
				break;
			default: 
				System.out.println(" +++++++++++++++++++++++++Invalid Party++++++++++++++++");
				break;
		}
		}
	}
	
	double total = lP + cP + nDP + bQ + gP;
	
	partyResultOneDec[0] = Math.round((lP/total) * 10) / 10.0;
	partyResultOneDec[1] = Math.round((cP/total) * 10) / 10.0;;
	partyResultOneDec[2] = Math.round((nDP/total) * 10) / 10.0;
	partyResultOneDec[3] = Math.round((bQ/total) * 10) / 10.0;;
	partyResultOneDec[4] = Math.round((gP/total) * 10) / 10.0;;
	
	
	
	
	System.out.println("Parties double with one decimal point result result");
	for(int i = 0 ; i < 5 ; i++) {
		System.out.println(partyResultOneDec[i]);
		
	}
	return partyResultOneDec;
}

public double[] ageGroupVotedResults(List<Voter> votersList) {
	int age = 0;
	int eighteenTothirty = 0;
	int thirtyToFortyfive = 0;
	int fortyfiveToSixty = 0;
	int sixtyPlus = 0 ;
	double[] ageGroupResults = new double[4];
	for (Voter temp : votersList) {
		age = temp.getAge();
		
		if( age >= 60 && temp.getVote().isVote()) {
			sixtyPlus++;
		}else if(age >=45 && temp.getVote().isVote()) {
			fortyfiveToSixty++;
		}else if(age >= 30 && temp.getVote().isVote()) {
			thirtyToFortyfive++;
		}else {
			if(temp.getVote().isVote()) {
			eighteenTothirty++;
		}}
	}
//	double total = eighteenTothirty + thirtyToFortyfive + fortyfiveToSixty + sixtyPlus;
//	ageGroupResults[0] = (eighteenTothirty/total)*100;
//	ageGroupResults[1] =  (thirtyToFortyfive/total)*100;
//	ageGroupResults[2] =  (fortyfiveToSixty/total)*100;
//	ageGroupResults[3] =  (sixtyPlus/total)*100;
	
	ageGroupResults[0] = eighteenTothirty;
	ageGroupResults[1] =  thirtyToFortyfive;
	ageGroupResults[2] =  fortyfiveToSixty;
	ageGroupResults[3] =  sixtyPlus;
	
	
	return ageGroupResults;
	
}


public int[] votersDidVote(List<Voter> votersList) {
//	Dao dao = new Dao();
	int[] vote = new int[2];
	for (Voter temp : votersList) {
		
		if(temp.getVote().isVote()) {
			vote[0]++;
		
	}else {
		vote[1]++;
	}
	}
	int didVote = votersList.size();
	
	System.out.println(vote[0] + "total number of people did vote");
	System.out.println(vote[1] + "total number of people that didn't vote");

	return vote;
}


//optional update the vote table

public void updateVoteTableUsingList(List<Voter> votersList, Dao dao) {
//	Dao dao = new Dao();
	
	for(int i = 0 ; i < votersList.size(); i ++) {
		dao.updateVote(votersList.get(i).getSin(), votersList.get(i).getVote().isVote(), votersList.get(i).getVote().getParty());
	}
	
	
	
	
}




}