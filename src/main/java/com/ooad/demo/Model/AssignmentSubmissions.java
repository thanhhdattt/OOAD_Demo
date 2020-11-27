package com.ooad.demo.Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "AssignmentSubmissions")
public class AssignmentSubmissions {

    @Id
    @GeneratedValue
    @Column(name = "assignment_submission_id")
    private Integer assignment_submission_id;

    @Column(name = "author_id")
    private Integer author_id;

    @Column(name = "assignment_id")
    private Integer assignment_id;

    @Column(name = "description")
    private String description;
}
