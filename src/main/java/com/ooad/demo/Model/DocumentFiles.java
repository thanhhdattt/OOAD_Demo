package com.ooad.demo.Model;

import com.ooad.demo.Model.Status.Format;
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
@Table(name = "DocumentFiles")
public class DocumentFiles {

    @Id
    @GeneratedValue
    @Column(name = "document_file_id")
    private Integer document_file_id;

    @Column(name = "document_id")
    private Integer document_id;

    @Column(name = "name")
    private String name;

    @Column(name = "url")
    private String url;

    @Column(name = "format")
    private Format format;
}
