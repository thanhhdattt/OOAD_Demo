package com.ooad.demo.Model.Status;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Status {
    PENDING, ACCEPTED, REJECTED, ONLINE, OFFLINE
}
