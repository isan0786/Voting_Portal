package ca.ishananand.beans;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Vote implements Serializable {


	/**
	 * @param sin
	 * @param isVote
	 */
	public Vote( boolean isVote) {
		
		
		this.isVote = isVote;
	}

	@Id
	@GeneratedValue
	private int id;
	private boolean isVote; 
	private String party;
	
//	@OneToOne(cascade=CascadeType.ALL)
//	private Voter voterPerson;
	
	@OneToOne
	private Voter voterPerson;
	
	
	@Override
	public String toString() {
		return  isVote + party ;
	}
}
