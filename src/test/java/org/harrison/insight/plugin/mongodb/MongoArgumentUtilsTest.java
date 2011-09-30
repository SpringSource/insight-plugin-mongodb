package org.harrison.insight.plugin.mongodb;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Random;

import org.bson.types.ObjectId;
import org.junit.Assert;
import org.junit.Test;

public class MongoArgumentUtilsTest {
    @Test
    public void testNullToString() {
	Assert.assertEquals("null", MongoArgumentUtils.toString((Object) null));
    }

    @Test
    public void testStringValue() {
	Assert.assertEquals("Slartibartfast",
		MongoArgumentUtils.toString("Slartibartfast"));
    }

    @Test
    public void testBooleanValue() {
	Assert.assertEquals("true", MongoArgumentUtils.toString(Boolean.TRUE));
    }

    @Test
    public void testByteValue() {
	Assert.assertEquals("42", MongoArgumentUtils.toString((byte) 42));
    }

    @Test
    public void testCharacterValue() {
	Assert.assertEquals("A", MongoArgumentUtils.toString('A'));
    }

    @Test
    public void testShortValue() {
	Assert.assertEquals("42", MongoArgumentUtils.toString((short) 42));
    }

    @Test
    public void testIntegerValue() {
	Assert.assertEquals("42", MongoArgumentUtils.toString(42));
    }

    @Test
    public void testLongValue() {
	Assert.assertEquals("42", MongoArgumentUtils.toString((long) 42));
    }

    @Test
    public void testFloatValue() {
	Assert.assertEquals("42.0", MongoArgumentUtils.toString((float) 42.0));
    }

    @Test
    public void testDoubleValue() {
	Assert.assertEquals("42.0", MongoArgumentUtils.toString(42.0));
    }

    @Test
    public void testBigIntegerValue() {
	Assert.assertEquals("42424242",
		MongoArgumentUtils.toString(new BigInteger("42424242")));
    }

    @Test
    public void testBigDecimalValue() {
	Assert.assertEquals("42.424242",
		MongoArgumentUtils.toString(new BigDecimal("42.424242")));
    }

    @Test
    public void testObjectIdValue() {
	Assert.assertEquals("0123456789abcd0123456789",
		MongoArgumentUtils.toString(new ObjectId("0123456789abcd0123456789")));
    }

    @Test
    public void testUnknownClass() {
	Assert.assertEquals("Random", MongoArgumentUtils.toString(new Random()));
    }
}
