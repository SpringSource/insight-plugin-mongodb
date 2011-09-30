package com.springsource.insight.plugin.mongodb;

import java.util.List;

import com.springsource.insight.intercept.operation.OperationList;
import com.springsource.insight.intercept.operation.OperationType;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;

import com.mongodb.DBCursor;
import com.springsource.insight.collection.AbstractOperationCollectionAspect;
import com.springsource.insight.intercept.operation.Operation;

public aspect MongoCursorOperationCollectionAspect extends
        AbstractOperationCollectionAspect {
    public static final OperationType TYPE = OperationType.valueOf("mongo_cursor_operation");

    private pointcut nextExecution():
	execution(* DBCursor.next());

    private pointcut skipExecution(): 
	execution(* DBCursor.skip(int));

    private pointcut limitExecution(): 
	execution(* DBCursor.limit(int));

    private pointcut toArrayExecution(): 
	execution(* DBCursor.toArray(..));

    private pointcut sortExecution(): 
	execution(* DBCursor.sort(..));

    private pointcut batchSizeExecution(): 
	execution(* DBCursor.batchSize(int));

    public pointcut collectionPoint(): 
	(nextExecution() && !cflowbelow(nextExecution())) ||
	(skipExecution() && !cflowbelow(skipExecution())) ||
	(limitExecution() && !cflowbelow(limitExecution())) ||
	(toArrayExecution() && !cflowbelow(toArrayExecution())) ||
	(sortExecution() && !cflowbelow(sortExecution())) ||
	(batchSizeExecution() && !cflowbelow(batchSizeExecution()));

    @Override
    protected Operation createOperation(final JoinPoint joinPoint) {
        final Signature signature = joinPoint.getSignature();
        final DBCursor cursor = (DBCursor) joinPoint.getTarget();
        Operation op = new Operation()
                .type(TYPE)
                .label("MongoDB: DBCursor." + signature.getName() + "()")
                .sourceCodeLocation(getSourceCodeLocation(joinPoint));

        op.put("keysWanted", MongoArgumentUtils.toString(cursor.getKeysWanted()))
          .put("query", MongoArgumentUtils.toString(cursor.getQuery()));
        OperationList opList = op.createList("args");
        List<String> args = MongoArgumentUtils.toString(joinPoint.getArgs());
        for (String arg : args) {
            opList.add(arg);
        }
        return op;

    }
}
