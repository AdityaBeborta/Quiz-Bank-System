package com.backend.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data
@Entity
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Quiz {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer q_Id;
	private String title;
	private String description;
	private String maxMarks;
	private String numberOfQuestion;
	private boolean active=false;
	@ManyToOne(fetch = FetchType.EAGER)
	private Category category;
	@OneToMany(mappedBy = "quiz",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	List<Question> question=new ArrayList<>();

}
