package com.esl.demo;

import groovyx.net.http.HTTPBuilder;

import java.net.URISyntaxException;
import static groovyx.net.http.Method.GET;
import static groovyx.net.http.ContentType.JSON;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
        Net n = new Net();
        n.tryIt();
    }
}
