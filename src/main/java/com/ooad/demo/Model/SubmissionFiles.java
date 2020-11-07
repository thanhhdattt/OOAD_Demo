package com.ooad.demo.Model;

import com.ooad.demo.Model.Status.Format;
import lombok.*;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class SubmissionFiles {

    @Id
    @GeneratedValue
    @Column(name = "submission_file_id")
    private Integer submission_file_id;

    @Column(name = "assignment_submission_id")
    private Integer assignment_submission_id;

    @Column(name = "name")
    private String name;

    @Column(name = "url")
    private String url;

    @Column(name = "format")
    private Format format;
}
