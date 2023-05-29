package com.travel.ata.exception;

public class ResourceNotFound extends RuntimeException{

    public ResourceNotFound(){
        super();
    }
    public ResourceNotFound(String message){
        super(message);
    }
}
