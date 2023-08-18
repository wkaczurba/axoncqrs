package com.springbank.user.core.events;

import lombok.Builder;
import lombok.Data;
import com.springbank.user.core.models.User;

@Data
@Builder
public class UserRemovedEvent {
    private String id;
    private User user;
}
