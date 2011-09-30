package com.springsource.insight.plugin.mongodb;

import java.util.List;

import com.springsource.insight.intercept.operation.OperationList;
import com.springsource.insight.intercept.operation.OperationType;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import com.mongodb.*;
import com.springsource.insight.collection.AbstractOperationCollectionAspect;
import com.springsource.insight.intercept.operation.Operation;

public aspect MongoCollectionOperationCollectionAspect extends
        AbstractOperationCollectionAspect {
    public static final OperationType TYPE = OperationType.valueOf("mongo_collection_operation");

    public pointcut insertExecute(): 
	execution(WriteResult DBCollection.insert(DBObject[], WriteConcern));

    public pointcut updateExecute(): 
	execution(WriteResult DBCollection.update(DBObject, DBObject, boolean, boolean));

    public pointcut removeExecute(): 
	execution(WriteResult DBCollection.remove(DBObject, WriteConcern));

    public pointcut saveExecute():
	execution(WriteResult DBCollection.save(..));

    public pointcut findExecute(): 
	execution(* DBCollection.find*(..));

    public pointcut createIndexExecute(): 
	execution(void DBCollection.createIndex(DBObject, DBObject));

    public pointcut getCountExecute(): 
	execution(long DBCollection.getCount(DBObject, DBObject, long, long));

    public pointcut groupExecute(): 
	execution(DBObject DBCollection.group(..));

    public pointcut distinctExecute(): 
	execution(List DBCollection.distinct(String,DBObject));

    public pointcut mapReduceExecute(): 
	execution(MapReduceOutput DBCollection.mapReduce(..));

    public pointcut dropIndexExecute(): 
	execution(void DBCollection.dropIndexes(..));

    public pointcut collectionPoint():
        insertExecute() ||
        updateExecute() ||
        removeExecute() ||
        (findExecute() && !cflowbelow(findExecute()))||
        createIndexExecute() ||
        (saveExecute()  && !cflowbelow(saveExecute())) ||
        getCountExecute() ||
        (groupExecute() && !cflowbelow(groupExecute()))||
        distinctExecute() ||
        (mapReduceExecute() && !cflowbelow(mapReduceExecute())) ||
        dropIndexExecute();

    @Override
    protected Operation createOperation(final JoinPoint joinPoint) {
        final Signature signature = joinPoint.getSignature();
        final DBCollection collection = (DBCollection) joinPoint.getThis();
        Operation op = new Operation()
                .label("MongoDB: " + collection + "." + signature.getName() + "()")
                .type(TYPE).sourceCodeLocation(getSourceCodeLocation(joinPoint))
                .put("collection", collection.getFullName());
        OperationList opList = op.createList("args");
        List<String> args = MongoArgumentUtils.toString(joinPoint.getArgs());
        for (String arg : args) {
            opList.add(arg);
        }

        return op;
    }
}
