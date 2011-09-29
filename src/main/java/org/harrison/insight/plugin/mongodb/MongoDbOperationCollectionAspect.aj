package org.harrison.insight.plugin.mongodb;

import com.springsource.insight.intercept.operation.OperationList;
import com.springsource.insight.intercept.operation.OperationType;
import org.aspectj.lang.JoinPoint;

import com.mongodb.CommandResult;
import com.mongodb.DB;
import com.springsource.insight.collection.AbstractOperationCollectionAspect;
import com.springsource.insight.intercept.operation.Operation;

import java.util.List;

public aspect MongoDbOperationCollectionAspect extends AbstractOperationCollectionAspect {

    public static final OperationType TYPE = OperationType.valueOf("mongo_db_operation");

    public pointcut collectionPoint(): execution(CommandResult DB.command(..));

    @Override
    protected Operation createOperation(final JoinPoint joinPoint) {
        Operation op = new Operation().label("MongoDB: DB." + joinPoint.getSignature().getName() + "()").type(TYPE);
        OperationList opList = op.createList("args");
        List<String> args = ArgUtils.toString(joinPoint.getArgs());
        for (String arg : args) {
            opList.add(arg);
        }
        return op;
    }
}
