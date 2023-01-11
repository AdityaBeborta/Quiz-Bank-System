package com.backend.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor

public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int cId;
	private String title;
	private String content;
	@Transient
	@OneToMany(mappedBy = "category",cascade = CascadeType.ALL)
	List<Quiz> quizes=new ArrayList<>();
	
	
}
