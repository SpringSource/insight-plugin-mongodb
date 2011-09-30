/**
 * Copyright 2009-2010 VMware.
 * All rights reserved.
 */

package com.springsource.insight.plugin.mongodb;

import com.mongodb.CommandResult;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;

/**
 */
public class DBDummy extends DB {

    public DBDummy(Mongo mongo, String name) {
        super(mongo, name);
    }

    public CommandResult command(com.mongodb.DBObject cmd)
            throws com.mongodb.MongoException {
        return null;
    }

    public CommandResult command(com.mongodb.DBObject cmd, int options)
            throws com.mongodb.MongoException {
        return null;
    }

    public CommandResult command(java.lang.String cmd)
            throws com.mongodb.MongoException {
        return null;
    }


    @Override
    public void requestStart() {}

    @Override
    public void requestDone() {}

    @Override
    public void requestEnsureConnection() {}

    @Override
    protected DBCollection doGetCollection(String s) {
        return null;
    }
}
