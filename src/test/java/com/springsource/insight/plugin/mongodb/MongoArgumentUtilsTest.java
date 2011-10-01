package com.springsource.insight.plugin.mongodb;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Random;

import org.bson.types.ObjectId;

import static org.junit.Assert.*;

import org.junit.Test;

public class MongoArgumentUtilsTest {

    @Test
    public void testLongStringTruncatedToLimit() {
        String bigRandom = new BigInteger(2048, new Random()).toString(32);
        assertEquals(bigRandom.substring(0, 256) + "...", MongoArgumentUtils.toString(bigRandom));
    }

    @Test
    public void testNullToString() {
        assertEquals("null", MongoArgumentUtils.toString((Object) null));
    }

    @Test
    public void testStringValue() {
        assertEquals("Slartibartfast",
                MongoArgumentUtils.toString("Slartibartfast"));
    }

    @Test
    public void testBooleanValue() {
        assertEquals("true", MongoArgumentUtils.toString(Boolean.TRUE));
    }

    @Test
    public void testByteValue() {
        assertEquals("42", MongoArgumentUtils.toString((byte) 42));
    }

    @Test
    public void testCharacterValue() {
        assertEquals("A", MongoArgumentUtils.toString('A'));
    }

    @Test
    public void testShortValue() {
        assertEquals("42", MongoArgumentUtils.toString((short) 42));
    }

    @Test
    public void testIntegerValue() {
        assertEquals("42", MongoArgumentUtils.toString(42));
    }

    @Test
    public void testLongValue() {
        assertEquals("42", MongoArgumentUtils.toString((long) 42));
    }

    @Test
    public void testFloatValue() {
        assertEquals("42.0", MongoArgumentUtils.toString((float) 42.0));
    }

    @Test
    public void testDoubleValue() {
        assertEquals("42.0", MongoArgumentUtils.toString(42.0));
    }

    @Test
    public void testBigIntegerValue() {
        assertEquals("42424242",
                MongoArgumentUtils.toString(new BigInteger("42424242")));
    }

    @Test
    public void testBigDecimalValue() {
        assertEquals("42.424242",
                MongoArgumentUtils.toString(new BigDecimal("42.424242")));
    }

    @Test
    public void testObjectIdValue() {
        assertEquals("0123456789abcd0123456789",
                MongoArgumentUtils.toString(new ObjectId("0123456789abcd0123456789")));
    }

    @Test
    public void testUnknownClass() {
        assertEquals("Random", MongoArgumentUtils.toString(new Random()));
    }
}
