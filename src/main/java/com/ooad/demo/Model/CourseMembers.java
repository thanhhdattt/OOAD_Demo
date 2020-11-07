package com.ooad.demo.Model;

import com.ooad.demo.Model.Status.Status;
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
public class CourseMembers {
    @Id
    @GeneratedValue
    @Column(name = "course_member_id")
    private Integer course_member_id;

    @Column(name = "course_id")
    private Integer course_id;

    @Column(name = "user_id")
    private Integer user_id;

    @Column(name = "description")
    private String description;

    @Column(name = "status")
    private Status status;
}
