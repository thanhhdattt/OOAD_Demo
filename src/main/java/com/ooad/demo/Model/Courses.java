package com.ooad.demo.Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Courses {

    @Id
    @GeneratedValue
    @Column(name = "course_id")
    private Integer course_id;

    @Column(name = "host_id")
    private Integer host_id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;
}
