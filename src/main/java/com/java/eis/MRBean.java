package com.java.eis;

import org.apache.hadoop.io.Text;

public class MRBean {
	String Year;
	String Sports;
	String Athlete;
	String Country;
	String Gender;
	String Medal;
	
	public MRBean(Text value) {
		
		try {
			String[] colums = value.toString().split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)", -1);
			this.Year = colums[0];
			this.Sports = colums[2];
			this.Athlete = colums[3];
			this.Country = colums[5];
			this.Gender = colums[6];
			this.Medal = colums[8];
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getYear() {
		return Year;
	}

	public void setYear(String Year) {
		Year = Year;
	}

	public String getSports() {
		return Sports;
	}

	public void setSports(String sports) {
		Sports = sports;
	}

	public String getAthlete() {
		return Athlete;
	}

	public void setAthlete(String athlete) {
		Athlete = athlete;
	}

	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	public String getMedal() {
		return Medal;
	}

	public void setMedal(String medal) {
		Medal = medal;
	}
	
	
}
