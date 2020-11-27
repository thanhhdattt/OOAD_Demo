package com.ooad.demo.Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Assignments")
public class Assignments {

    @Id
    @GeneratedValue
    @Column(name = "assignment_id")
    private Integer assignment_id;

    @Column(name = "course_id")
    private Integer course_id;

    @Column(name = "title")
    private String title;

    @Column(name = "content")
    private String content;

    @Column(name = "create_at")
    private Date create_at;

    @Column(name = "due_date")
    private Date due_date;

    @Column(name = "description")
    private String description;
}
