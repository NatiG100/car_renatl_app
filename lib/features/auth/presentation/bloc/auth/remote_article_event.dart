abstract class RemoteAuthEvent{
  const RemoteAuthEvent();
}

class LoginEvent extends RemoteAuthEvent{

}

class LogoutEvent extends RemoteAuthEvent{

}

class ActivateEvent extends RemoteAuthEvent{
  
}