package com.ooad.demo.Model.Status;

import lombok.Getter;

@Getter
public enum Role {
    TEACHER("Teacher"), STUDENT("Student");
    public final String label;

    private Role(String label){
        this.label = label;
    }
}
