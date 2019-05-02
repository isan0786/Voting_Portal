package ca.ishananand.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


import ca.ishananand.beans.Vote;
import ca.ishananand.beans.Voter;

public class Dao {

	SessionFactory sessionFactory = new Configuration()
			.configure("ca/ishananand/config/hibernate.cfg.xml").buildSessionFactory();
	
	

	
	//needs to be invoked just once
	
	
//	this list of students
	public List<Voter> votersList() {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		//case sensitivity matters
		List<Voter> voterList = (List<Voter>) session.createQuery("from Voter").getResultList();
		
		
		session.getTransaction().commit();
		session.close();
		
		return voterList;
	}
		
	
		
		public void addVoter(Voter v) {
			
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
				session.save(v);
			System.out.println("add Voter gets invoked");
			session.getTransaction().commit();
			session.close();
			
			
		}


		
		
		public Voter retreiveVoterById(int id) {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			
			Voter person = session.get(Voter.class, id);

			session.getTransaction().commit();
			session.close();
			return person;
		}
		
		
		
		public void updateVote(int id, boolean isVote, String voteParty) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = session.createSQLQuery(
			    "update Vote set isVote = :boolVote" + ", party = :votingParty" + " where voterPerson_sin = :sinNo");
			query.setParameter("boolVote", isVote);
			query.setParameter("sinNo", id);
			query.setParameter("votingParty", voteParty);
			
			int result = query.executeUpdate();
			System.out.println(result + "++++++++++++++++++++++++");
			session.getTransaction().commit();
			session.close();
		
	}
		
		
}
