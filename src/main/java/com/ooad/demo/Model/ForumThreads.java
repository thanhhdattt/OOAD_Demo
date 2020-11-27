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
@Table(name = "ForumThreads")
public class ForumThreads {

    @Id
    @GeneratedValue
    @Column(name = "forum_thread_id")
    private Integer forum_thread_id;

    @Column(name = "course_id")
    private Integer course_id;

    @Column(name = "author_id")
    private Integer author_id;

    @Column(name = "title")
    private String title;

    @Column(name = "content")
    private String content;

    @Column(name = "create_at")
    private Date create_at;

    @Column(name = "update_at")
    private Date update_at;
}
