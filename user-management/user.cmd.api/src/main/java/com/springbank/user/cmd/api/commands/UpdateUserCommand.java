package com.springbank.user.cmd.api.commands;

import lombok.Builder;
import lombok.Data;
import org.axonframework.modelling.command.TargetAggregateIdentifier;
import com.springbank.user.core.models.User;

@Data
@Builder
public class UpdateUserCommand {
    @TargetAggregateIdentifier
    private String id;
    private User user;
}
