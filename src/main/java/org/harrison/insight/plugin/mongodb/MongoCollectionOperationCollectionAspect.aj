package org.harrison.insight.plugin.mongodb;

import java.util.List;

import com.springsource.insight.intercept.operation.OperationList;
import com.springsource.insight.intercept.operation.OperationType;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;

import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MapReduceOutput;
import com.mongodb.WriteResult;
import com.springsource.insight.collection.AbstractOperationCollectionAspect;
import com.springsource.insight.intercept.operation.Operation;

public aspect MongoCollectionOperationCollectionAspect extends
        AbstractOperationCollectionAspect {
    public static final OperationType TYPE = OperationType.valueOf("mongo_collection_operation");

    public pointcut insertExecute(): 
	execution(WriteResult DBCollection.insert(..));

    public pointcut updateExecute(): 
	execution(WriteResult DBCollection.update(..));

    public pointcut updateMultiExecute(): 
	execution(WriteResult DBCollection.updateMulti(..));

    public pointcut removeExecute(): 
	execution(WriteResult DBCollection.remove(..));

    public pointcut findExecute(): 
	execution(DBCursor DBCollection.find(..));

    public pointcut findOneExecute(): 
	execution(DBObject DBCollection.findOne(..));

    public pointcut findAndModifyExecute(): 
	execution(DBObject DBCollection.findAndModify(..));

    public pointcut findAndRemoveExecute(): 
	execution(DBObject DBCollection.findAndRemove(..));

    public pointcut createIndexExecute(): 
	execution(void DBCollection.createIndex(..));

    public pointcut ensureIndexExecute(): 
	execution(void DBCollection.ensureIndex(..));

    public pointcut saveExecute(): 
	execution(WriteResult DBCollection.save(..));

    public pointcut dropExecute(): 
	execution(void DBCollection.drop());

    public pointcut getCountExecute(): 
	execution(long DBCollection.getCount(..));

    public pointcut groupExecute(): 
	execution(DBObject DBCollection.group());

    public pointcut distinctExecute(): 
	execution(List DBCollection.distinct(..));

    public pointcut mapReduceExecute(): 
	execution(MapReduceOutput DBCollection.mapReduce(..));

    public pointcut dropIndexExecute(): 
	execution(void DBCollection.dropIndex(..));

    public pointcut collectionPoint():
        (insertExecute() && !cflowbelow(insertExecute())) || 
        (updateExecute() && !cflowbelow(updateExecute())) || 
        (updateMultiExecute() && !cflowbelow(updateMultiExecute())) || 
        (removeExecute() && !cflowbelow(removeExecute())) || 
        (findExecute() && !cflowbelow(findExecute())) ||
        (findOneExecute() && !cflowbelow(findOneExecute())) || 
        (findAndModifyExecute() && !cflowbelow(findAndModifyExecute())) ||
        (createIndexExecute() && !cflowbelow(createIndexExecute())) || 
        (ensureIndexExecute() && !cflowbelow(ensureIndexExecute())) || 
        (saveExecute() && !cflowbelow(saveExecute())) ||
        (dropExecute() && !cflowbelow(dropExecute())) || 
        (getCountExecute() && !cflowbelow(getCountExecute())) ||
        (groupExecute() && !cflowbelow(groupExecute())) || 
        (distinctExecute() && !cflowbelow(distinctExecute())) || 
        (mapReduceExecute() && !cflowbelow(mapReduceExecute())) ||
        (dropIndexExecute() && !cflowbelow(dropIndexExecute()));

    @Override
    protected Operation createOperation(final JoinPoint joinPoint) {
        final Signature signature = joinPoint.getSignature();
        final DBCollection collection = (DBCollection) joinPoint.getThis();
        Operation op = new Operation()
                .label("MongoDB: " + collection + "." + signature.getName() + "()")
                .type(TYPE).sourceCodeLocation(getSourceCodeLocation(joinPoint))
                .put("collection", collection.getFullName());
        OperationList opList = op.createList("args");
        List<String> args = ArgUtils.toString(joinPoint.getArgs());
        for (String arg : args) {
            opList.add(arg);
        }

        return op;
    }
}
