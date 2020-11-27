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

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Documents")
public class Documents {

    @Id
    @GeneratedValue
    @Column(name = "document_id")
    private Integer document_id;

    @Column(name = "course_id")
    private Integer course_id;

    @Column(name = "author_id")
    private Integer author_id;

    @Column(name = "title")
    private String title;

    @Column(name = "update_at")
    private Date update_at;

    @Column(name = "create_at")
    private Date create_at;

    @Column(name = "description")
    private String description;
}
