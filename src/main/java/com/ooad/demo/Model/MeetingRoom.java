package com.ooad.demo.Model;

import com.ooad.demo.Model.Status.Status;
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
@Table(name = "MeetingRoom")
public class MeetingRoom {
    @Id
    @GeneratedValue
    @Column(name = "meeting_room_id")
    private int meeting_room_id;

    @Column(name = "host_id")
    private int host_id;

    @Column(name = "description")
    private String description;

    @Column(name = "status")
    private Status status;
}
