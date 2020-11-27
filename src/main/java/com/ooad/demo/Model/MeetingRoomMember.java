package com.ooad.demo.Model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "MeetingRoomMember")
public class MeetingRoomMember {

    @Id
    @GeneratedValue
    @Column(name = "meeting_room_member_id")
    private int meeting_room_member_id;

    @Column(name = "user_id")
    private int user_id;

    @Column(name = "meeting_room_id")
    private int meeting_room_id;
}
