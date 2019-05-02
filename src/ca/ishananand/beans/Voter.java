package ca.ishananand.beans;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Voter implements Serializable {

	@Id
	private int sin;
	private String fname;
	private String lname;
	private String dob;
	private String address;
	private int age;
	
//	@OneToOne(cascade=CascadeType.ALL,mappedBy="voterPerson")
//	private Vote vote;
	
	@OneToOne(cascade=CascadeType.ALL)
	private Vote vote;

	/**
	 * @param sin
	 * @param fName
	 * @param lName
	 * @param dob
	 * @param address
	 * @param age
	 */
	
	
	public Voter(int sin, String fName, String lName, String dob, String address, int age) {
		this.sin = sin;
		this.fname = fName;
		this.lname = lName;
		this.dob = dob;
		this.address = address;
		this.age = age;
	}
	
	@Override
	public String toString() {
		return sin + fname + lname + dob + address + age + vote;
	}
	
	
}
