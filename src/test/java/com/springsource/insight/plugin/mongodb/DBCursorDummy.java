/**
 * Copyright 2009-2010 VMware.
 * All rights reserved.
 */

package com.springsource.insight.plugin.mongodb;

import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import java.util.List;

/**
 */
public class DBCursorDummy extends DBCursor {
    public DBCursorDummy(DBCollection collection, DBObject q, DBObject k) {
        super(collection, q, k);
    }

    @Override
    public DBObject next() {
        return null;
    }

    @Override
    public DBCursor skip(int num) {
        return null;
    }

    @Override
    public DBCursor limit(int n) {
        return null;
    }

    @Override
    public DBCursor batchSize(int n) {
        return null;
    }

    @Override
    public List<DBObject> toArray() {
        return null;
    }

    @Override
    public List<DBObject> toArray(int n) {
        return null;
    }

    @Override
    public DBCursor sort(DBObject obj) {
        return null;
    }

}
