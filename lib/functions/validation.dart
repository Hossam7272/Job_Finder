validUser(String val,String type){
  if(val.isEmpty){
    return 'please enter your $type ';
  }else{
    if(type == 'password'){
      if(val.length < 8){
        return false;
      }
    }
  }
}