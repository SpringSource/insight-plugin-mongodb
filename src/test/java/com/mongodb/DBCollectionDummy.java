/**
 * Copyright 2009-2010 VMware.
 * All rights reserved.
 */

package com.mongodb;

import com.mongodb.*;

import java.util.Iterator;
import java.util.List;

/**
 */
public class DBCollectionDummy extends DBCollection {

    public DBCollectionDummy(DB base, String name) {
        super(base, name);
    }




//	execution(WriteResult DBCollection.save(DBObject, WriteConcern));
    public WriteResult save(DBObject obj1, WriteConcern concern, String finalMethodsMakeTestingThisHard) {
        return null;
    }

//	execution(long DBCollection.getCount(DBObject, DBObject, long, long));
    @Override
    public long getCount(DBObject obj1, DBObject obj2, long l1, long l2) {
        return 0;
    }

//	execution(DBObject DBCollection.group(GroupCommand));
    @Override
    public DBObject group(com.mongodb.DBObject key, com.mongodb.DBObject cond, com.mongodb.DBObject initial, java.lang.String reduce) {
        return null;
    }

//	execution(List DBCollection.distinct(String,DBObject));
    @Override
    public List distinct(String str, DBObject obj) {
        return null;
    }

//	execution(MapReduceOutput DBCollection.mapReduce(..));
    @Override
    public MapReduceOutput mapReduce(com.mongodb.DBObject command) {
        return null;
    }

//	execution(void DBCollection.dropIndexes(..));
    @Override
    public void dropIndexes(String key) {

    }

//	execution(WriteResult DBCollection.insert(DBObject[], WriteConcern));
    @Override
    public WriteResult insert(DBObject[] dbObjects, WriteConcern writeConcern) throws MongoException {
        return null;
    }

//	execution(WriteResult DBCollection.update(DBObject, DBObject, boolean, boolean));
    @Override
    public WriteResult update(DBObject dbObject, DBObject dbObject1, boolean b, boolean b1, WriteConcern writeConcern) throws MongoException {
        return null;
    }

//	execution(DBCursor DBCollection.__find(DBObject, DBObject, int, int, int, int, ReadPreference));

    public DBCursor find(String blah1, String blah2, String blah3) {
        return null;
    }

    Iterator<com.mongodb.DBObject> __find(DBObject ref ,
                                          DBObject fields,
                                          int numToSkip,
                                          int batchSize,
                                          int limit) throws com.mongodb.MongoException {
        return null;

    }

//	execution(WriteResult DBCollection.remove(DBObject, WriteConcern));
    @Override
    public WriteResult remove(DBObject dbObject, WriteConcern writeConcern) throws MongoException {
        return null;
    }

//	execution(void DBCollection.createIndex(DBObject, DBObject));
    @Override
    public void createIndex(DBObject dbObject, DBObject dbObject1) throws MongoException {
    }

    @Override
    protected void doapply(DBObject dbObject) {
    }
}
